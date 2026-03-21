"""regblock Callback."""

from .callback_base import CallbackBase
from typing import Any
import logging

logging.basicConfig(
    level=logging.DEBUG,
    format="%(module)s %(funcName)s %(lineno)d %(levelname)s:: %(message)s",
)
log = logging.getLogger(__name__)


class RegblockCallback(CallbackBase):
    """Callback function for Peakrdl Generated Bluespec verilog code.

    Peakrdl Regblock stores the signals in a struct called field_storage
    A signal Foo in register Bar can be accessed as
    field_storage.Bar.Foo.value;
    """

    def _walk_hier(self, dut, sigHash, count) -> Any:
        if hasattr(dut, sigHash["path"][count]):
            log.info(sigHash["path"][count])
            sig = getattr(dut, sigHash["path"][count])
            if count == -1:
                return sig
            count = count + 1
            return self._walk_hier(sig, sigHash, count)
        return None

    def sig(self, sigHash) -> Any:
        """Finds the signal in dut and returns a reference to it.

        params:
            sigHash (dict): A dictionary of signal parameters "
                {"reg": register,
                "sig": signal_name,
                "low": signal's low index in the register,
                "high": signal's high index in the register,
                 }
        """
        # sig = f"field_storage.{sigHash['path'][-2]}.{sigHash['path'][-1]}"
        fs = self.dut.field_storage
        return self._walk_hier(fs, sigHash, -2)
