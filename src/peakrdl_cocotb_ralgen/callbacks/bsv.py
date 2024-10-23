"""Callback."""

import cocotb
from cocotb.handle import Force


class Callback:
    """Callback function for Peakrdl Generated Bluespec verilog code."""

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
        rv = self.sig(sigHash).value
        cocotb.log.debug(f"{sigHash['sig']} rv={rv}")
        return rv

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
        sig = f"s{sigHash['reg'].lower()}{sigHash['sig']}"
        return (
            getattr(self.dut, sig)
            if hasattr(self.dut, sig)
            else getattr(self.dut, sig + "_wget")
        )
