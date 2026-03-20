"""Base class for all callbacks."""
import cocotb
from cocotb.handle import Force


class CallbackBase:
    """Base class for all callbacks."""

    def __init__(self, dut):
        """Initialize.

        params:
          dut (Any): cocotb dut reference.
        """
        self.dut = dut

    def write(self, sigHash, wr):
        """Finds the actual signal in RTL and sets its value.

        params:
            sigHash (dict): A dictionary of signal parameters "
                {"reg": register,
                "sig": signal_name,
                "low": signal's low index in the register,
                "high": signal's high index in the register,
                 }
            wr (int): Integer value to write to the signal
        """

        if self.sig(sigHash):
            self.sig(sigHash).value = Force(wr)

    def read(self, sigHash):
        """Finds the actual signal in RTL and returns its value.

        params:
            sigHash (dict): A dictionary of signal parameters "
                {"reg": register,
                "sig": signal_name,
                "low": signal's low index in the register,
                "high": signal's high index in the register,
                 }
        """
        if self.sig(sigHash) is not None:
            rv = self.sig(sigHash).value
        else:
            rv = None
        cocotb.log.debug(f"{sigHash} rv={rv}")
        return rv
