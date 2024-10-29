"""Callback."""

from .callback_base import CallbackBase


class BSVCallback(CallbackBase):
    """Callback function for Peakrdl Generated Bluespec verilog code.

    The BSV generated RTL
    1. Retains the signal name for Reg* types.
    2. For Wire types the signal has a `_wget` suffix to indicate value and a `_whas` suffix to indicate the signal is driven in the current cycle.
    3. The original Bluespec code uses s<RegName><signalName> as the pattern for the bleuspec variable name.

    The override for the sig function takes care of this difference.
    """

    def sig(self, sigHash):
        """Finds the signal in dut and returns a reference to it.

        params:
            sigHash (dict): A dictionary of signal parameters "
                {"reg": register,
                "sig": signal_name,
                "low": signal's low index in the register,
                "high": signal's high index in the register,
                 }
        """
        sig = f"s{sigHash['path'][-2].lower()}{sigHash['path'][-1]}"
        return (
            getattr(self.dut, sig)
            if hasattr(self.dut, sig)
            else getattr(self.dut, sig + "_wget")
        )
