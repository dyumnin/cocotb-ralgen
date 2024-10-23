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
     - RAL: Instance of ral model generated using peakrdl_cocotb_ralgen
     - foreground_write: Boolean True/False
     - background_write: Boolean True/False
     - count: The number of time read/write operation has to be done to a register.
     - default_value: If None, a random value will be used, else this value will be used for read/write.
     - verbose: Print results of each operation.
    """
    # TODO Handle background oprations
    # assert foreground_write and foreground_read, "Error Background operations are not yet defined"
    for key, val in RAL.masks.items():
        if "rw" in val["disable"]:
            continue
        r = RAL.regmodel.__getattribute__(key)
        rv = None
        donttest = val["donttest"]
        for _ in range(count):
            wrval = (
                default_value
                if default_value
                else random.randint(0, 2 ** val["regwidth"])
            )
            wval = wrval & ~val["donttest"]
            if foreground_write:
                await r.write(wval)
            else:
                for hsh in val["signals"]:
                    RAL.callback.write(
                        hsh,
                        (wval >> hsh["low"])
                        & int("1" * (hsh["high"] - hsh["low"] + 1), 2),
                    )
            if foreground_read:
                rv = await r.read()
            else:
                rv = 0
                for hsh in val["signals"]:
                    rv |= RAL.callback.read(hsh) << hsh["low"]
            wmask = val["write_mask"]
            rmask = val["read_mask"]
            actual = rv & wmask & ~donttest
            expected = wval & wmask & rmask
            assert (
                actual == expected
            ), f"{key}:: Read Write Written {wval}, actual(Read) {actual}, Expected {expected}, wrMask {wmask}, rdmask {rmask}, donttest = {donttest}"
        if verbose:
            logger.info(
                f"Test RW: {key} wval {wval:x} rv {rv:x} expected {expected:x} actual {actual:x}",
            )
