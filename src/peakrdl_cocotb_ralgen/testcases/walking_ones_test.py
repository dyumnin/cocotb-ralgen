"""Walking Ones Test"""
import cocotb
#import random
logger = cocotb.log

async def walking_ones_test(
    RAL,     
    foreground_write=True,
    foreground_read=True,
    verbose = False
):
    for key, reg in RAL.masks.items():
        if 'rw' in reg["disable"]:
            continue
        r = RAL.ifc
        addr = reg["address"]
        rv = None
        donttest = reg["donttest"]
        for shift_amount in range(reg["regwidth"]):
            wrval = 1 << shift_amount
            logger.info(f"wrval:{shift_amount}")
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
