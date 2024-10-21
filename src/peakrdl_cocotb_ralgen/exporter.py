"""PeakRDL cocotb_ralgen exporter."""

__authors__ = [
    "Vijayvithal Jahagirdar <jahagirdar.vs@gmail.com>",
]

import sys
from typing import List, Optional, Union

from systemrdl import RDLCompiler, RDLWalker
from systemrdl.node import (
    AddrmapNode,
    RootNode,
)

from .ralgen import RALGEN


class CocotbRALExporter:  # pylint: disable=too-few-public-methods
    """PeakRDL RAL exporter main class."""

    def export(
        self,
        top_node: Union[AddrmapNode, RootNode],
        outputpath: str,
        input_files: Optional[List[str]] = None,
        rename: Optional[str] = None,
        depth: int = 0,
    ):
        """Interface stub required by peakrdl."""
        # print(f"{top_node.inst.inst_name} {input_files} {outputpath}")
        rdlc = RDLCompiler()
        try:
            for input_file in input_files:  # type: ignore
                rdlc.compile_file(input_file)
                root = rdlc.elaborate()
        except:
            sys.exit()
        with open(f"{outputpath}/{top_node.inst.inst_name}_RAL.py", "w") as file:
            walker = RDLWalker(unroll=True)
            listener = RALGEN(file)
            walker.walk(root, listener)
