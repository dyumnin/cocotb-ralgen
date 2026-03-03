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
import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(module)s %(funcName)s %(lineno)d %(levelname)s:: %(message)s",
)
logger = logging.getLogger(__name__)


class CocotbRALExporter:  # pylint: disable=too-few-public-methods
    """PeakRDL RAL exporter main class."""

    def export(
        self,
        top_node: Union[AddrmapNode, RootNode],
        outputpath: str,
        input_files: Optional[List[str]] = None,
        rename: Optional[str] = None,
        depth: int = 0,
        default_regwidth=None,
    ):
        """Interface stub required by peakrdl."""
        logger.info(
            f"Options {top_node=}, {outputpath=}, {input_files=}, {rename=}, {depth=}, {default_regwidth=}",
        )
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
            listener = RALGEN(file, default_regwidth)
            walker.walk(root, listener)
