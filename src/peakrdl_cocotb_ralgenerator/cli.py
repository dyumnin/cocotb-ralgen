"""Console script for peakrdl_cocotb_ralgenerator."""

import sys
import subprocess

import click


@click.command()
@click.option("-i", "--rdlfile", required=True, help="Input systemrdl file")
@click.option("-o", "--ralfolder", required=True, help="Output cocotb ral folder")
def cocotb_ralgenerator(rdlfile: str, ralfolder: str):
    """Console script for cocotb ral generator."""
    subprocess.Popen(["peakrdl", "cocotb_ralgen", rdlfile, "-o", ralfolder])
    return 0


if __name__ == "__main__":
    sys.exit(cocotb_ralgenerator())  # pragma: no cover
