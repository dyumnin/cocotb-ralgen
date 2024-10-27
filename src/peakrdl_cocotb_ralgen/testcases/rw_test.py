"""Read Write Test."""
import cocotb
import random

logger = cocotb.log


async def rw_test(
    RAL,
    foreground_write=True,
    foreground_read=True,
    count=10,
    default_value=None,
    verbose=False,
):
    """Read Write Test.

    params:
     RAL (RAL_Test): Instance of ral model generated using peakrdl_cocotb_ralgen
     foreground_write (bool): Boolean True/False
     foreground_read (bool): Boolean True/False
     count (int): The number of time read/write operation has to be done to a register.
     default_value (int): If None, a random value will be used, else this value will be used for read/write.
     verbose (bool): Print results of each operation.
    """
    # TODO Handle background oprations
    # assert foreground_write and foreground_read, "Error Background operations are not yet defined"
    for key, reg in RAL.masks.items():
        if "rw" in reg["disable"]:
            continue
        r = RAL.ifc
        addr = reg["address"]
        rv = None
        donttest = reg["donttest"]
        for _ in range(count):
            wrval = (
                default_value
                if default_value
                else random.randint(0, 2 ** reg["regwidth"])
            )
            wval = wrval & ~reg["donttest"]
            wmask = reg["write_mask"]
            rmask = reg["read_mask"]
            expected = wval & wmask & rmask
            if foreground_write:
                await r.write(
                    addr,
                    reg["width"],
                    reg["width"],
                    wval,
                )
            else:
                for sighash in reg["signals"]:
                    RAL.background.write(
                        sighash,
                        (wval >> sighash["low"])
                        & int("1" * (sighash["high"] - sighash["low"] + 1), 2),
                    )
            if foreground_read:
                rv = await r.read(addr, reg["width"], reg["width"])
            else:
                rv = 0
                for sighash in reg["signals"]:
                    rv |= RAL.background.read(sighash) << sighash["low"]
            actual = rv & wmask & ~donttest
            assert (
                actual == expected
            ), f"{key}:: Read Write Written {wval:x}, actual(Read) {actual:x}, Expected {expected:x}, wrMask {wmask:x}, rdmask {rmask:x}, donttest = {donttest:x}"
        if verbose:
            logger.info(
                f"Test RW: {key} wval {wval:x} rv {rv:x} expected {expected:x} actual {actual:x}",
            )
