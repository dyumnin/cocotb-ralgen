"""Callback."""

import cocotb
from cocotb.handle import Force


class Callback:
    """Callback function for Peakrdl Generated Bluespec verilog code."""

    def __init__(self, dut):
        """Initialize.

        params:
          - dut: cocotb dut reference.
        """
        self.dut = dut

    def write(self, sigHash, wr):
        """Finds the actual signal in RTL and sets its value.

        params:
            - sigHash: A dictionary of signal parameters "
                {"reg": register,
                "sig": signal_name,
                "low": signal's low index in the register,
                "high": signal's high index in the register,
                 }
            - wr: Integer value to write to the signal
        """
        self.sig(sigHash).value = Force(wr)

    def read(self, sigHash):
        """Finds the actual signal in RTL and returns its value.

        params:
            - sigHash: A dictionary of signal parameters "
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
        sig = f"s{sigHash['reg'].lower()}{sigHash['sig']}"
        rv = (
            getattr(self.dut, sig)
            if hasattr(self.dut, sig)
            else getattr(self.dut, sig + "_wget")
        )
        return rv
