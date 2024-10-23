"""RAL Generator."""
# Copyright © 2024 Dyumnin Semiconductors. All rights reserved.
# This software is licensed under the MIT License.
# For more information, please visit https://dyumnin.com
import logging
import pkg_resources

logging.basicConfig(
    level=logging.INFO,
    format="%(module)s %(funcName)s %(lineno)d %(levelname)s:: %(message)s",
)
logger = logging.getLogger()

import sys
from pprint import PrettyPrinter

from jinja2 import Environment, PackageLoader, select_autoescape
from systemrdl import RDLCompiler, RDLListener, RDLWalker


class HexPP(PrettyPrinter):
    """Formats integers as Hex."""

    def format(self, obj, context, maxlevels, level):
        """Extends PrettyPrinter's format to support printing numbers in hex."""
        if isinstance(obj, int):
            return f"0x{obj:_X}", True, False
        return super().format(obj, context, maxlevels, level)


# Define a listener that will print out the register model hierarchy
class RALGEN(RDLListener):
    """RAL Generator.

    # RAL Test.
    RAL Test consists of
    1. Reset read test
    2. Random Read Write tests

    These tests use a mix of front door/backdoor access.
    e.g.

    |Write |Read|
    | --- | ---|
    | Front | Front |
    | Back | Front |
    | Front | Back |
    | Back | Back |

    For using backdoor access you need to create two functions for reading and writing to hdl signals and pass it to this class

    A check function can only check the modified register, or check all registers to ensure that only the desired bit in the desired register is modified.

    For every register we need to create
    1. A Reset value and Reset mask
    2. Write mask
    3. Read mask
    """

    def __init__(self, file):
        """Constructor."""
        self.file = file
        self.registers = {}
        self.current_register = ""
        print(
            """
import random
import cocotb
logger = cocotb.log
              """,
            file=file,
        )
        print(
            f" Cocotb RALGEN: SystemRDL to RALtest converter version {pkg_resources.get_distribution('peakrdl_cocotb_ralgen').version}.",
        )
        print(
            """
        Copyright © 2024 Dyumnin Semiconductors.
        https://dyumnin.com
        """,
        )

    def enter_Addrmap(self, node):
        """Overriding builtin method."""
        self.registers = {}

    def enter_Reg(self, node):
        """Overriding builtin method."""
        self.current_register = node.get_path_segment()
        self.registers[node.get_path_segment()] = {
            "reset_value": 0,
            "reset_mask": 0,
            "write_mask": 0,
            "read_mask": 0,
            "donttest": 0,
            "signals": [],
            "disable": [],
        }

        # print(node.__dict__,file=self.file)

    def enter_Field(self, node):
        """Overriding builtin method."""
        self.registers[self.current_register]["signals"].append(
            {
                "reg": self.current_register,
                "sig": node.get_path_segment(),
                "low": node.low,
                "high": node.high,
            },
        )
        if "reset" in node.inst.properties:
            # print(f"{self.current_register}:{node.get_path_segment()}:::{self.registers[self.current_register]['reset_value']} |={node.get_property('reset')} << {node.high}")
            self.registers[self.current_register]["reset_value"] |= (
                node.get_property("reset") << node.low
            )
            self.registers[self.current_register]["reset_mask"] |= (
                int("1" * (node.high - node.low + 1), 2) << node.low
            )
        if node.is_sw_writable:
            self.registers[self.current_register]["write_mask"] |= (
                int("1" * (node.high - node.low + 1), 2) << node.low
            )
        if node.is_sw_readable:
            self.registers[self.current_register]["read_mask"] |= (
                int("1" * (node.high - node.low + 1), 2) << node.low
            )
        if "donttest" in node.inst.properties:
            self.registers[self.current_register]["donttest"] |= (
                int("1" * (node.high - node.low + 1), 2) << node.low
            )
        if "woclr" in node.inst.properties:
            print("Error: Not testing woclr bits")
            self.registers[self.current_register]["donttest"] |= (
                int("1" * (node.high - node.low + 1), 2) << node.low
            )
        if "rclr" in node.inst.properties:
            print("Error: Not testing rclr bits")
            self.registers[self.current_register]["donttest"] |= (
                int("1" * (node.high - node.low + 1), 2) << node.low
            )
        if "singlepulse" in node.inst.properties:
            print("Error: Not testing SinglePulse bits")
            self.registers[self.current_register]["donttest"] |= (
                int("1" * (node.high - node.low + 1), 2) << node.low
            )
        # print(node.inst.__dict__,file=self.file)

    def exit_Reg(self, node):
        """Overriding builtin method."""
        # {'regwidth': 32}
        self.registers[self.current_register]["regwidth"] = node.get_property(
            "regwidth",
        )
        # print(node.inst.__dict__)
        if not node.has_sw_writable:
            self.registers[self.current_register]["disable"].append("rw")
        if not node.has_sw_readable:
            self.registers[self.current_register]["disable"].extend(["rw", "reset"])

    def exit_Addrmap(self, node):
        """Overriding builtin method."""
        preg = HexPP().pformat(self.registers)
        env = Environment(
            loader=PackageLoader("peakrdl_cocotb_ralgen"),
            autoescape=select_autoescape(),
        )
        template = env.get_template("ralgen.j2")
        print(template.render(preg=preg, node=node), file=self.file)


if __name__ == "__main__":
    input_files = sys.argv[1:]
    rdlc = RDLCompiler()
    try:
        for input_file in input_files:
            rdlc.compile_file(input_file)
            root = rdlc.elaborate()
    except:
        sys.exit(1)
    walker = RDLWalker(unroll=True)
    with open("out.txt", "w") as of:
        listener = RALGEN(of)
        walker.walk(root, listener)
