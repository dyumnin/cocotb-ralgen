"""Read Write Test."""
import cocotb
import random

logger = cocotb.log


async def rw_test_base(
    RAL,
    key,
    reg, 
    wrval, 
    foreground_write, 
    foreground_read,
    test_type,
    verbose, 
):
    """Base function to perform read-write tests on a given register.

    Params:
        RAL: The RAL instance, required for background operations.
        key (str): Key or identifier for the register.
        reg (dict): Register metadata containing width and masks.
        wrval (int): The value to write to the register.
        foreground_write (bool): If True, use foreground write; otherwise, use background write.
        foreground_read (bool): If True, use foreground read; otherwise, use background read.
        test_type (str): The test type which calls the base function.
        verbose (bool): If True, logs the read-write results.

    Raises:
        AssertionError: If the actual value read does not match the expected value.
    """
    r = RAL.ifc
    addr = reg["address"]
    donttest = reg["donttest"]
    wmask = reg["write_mask"]
    rmask = reg["read_mask"]

    expected = wrval & ~donttest & wmask & rmask

    if foreground_write:
        await r.write(addr, reg["width"], reg["width"], wrval)
    else:
        for sighash in reg["signals"]:
            RAL.background.write(
                sighash,
                (wrval >> sighash["low"]) & int(
                    "1" * (sighash["high"] - sighash["low"] + 1), 2),
            )

    if foreground_read:
        rv = await r.read(addr, reg["width"], reg["width"])
    else:
        rv = 0
        for sighash in reg["signals"]:
            rv |= RAL.background.read(sighash) << sighash["low"]

    actual = rv & ~donttest & wmask

    assert (
        actual == expected
    ), f"{key}:: Read Write Written {wrval:x}, actual(Read) {actual:x}, Expected {expected:x}, wrMask {wmask:x}, rdmask {rmask:x}, donttest = {donttest:x}"

    if verbose:
        logger.info(
            f"Test {test_type}: {key} wval {wrval:x} rv {rv:x} expected {expected:x} actual {actual:x}",
        )


async def rw_test(
    RAL,
    foreground_write=True,
    foreground_read=True,
    count=10,
    default_value=None,
    verbose=False,
):
    """Performs read-write tests using random or default values.

    Params:
        RAL (RAL_Test): Instance of RAL model generated using peakrdl_cocotb_ralgen.
        foreground_write (bool): If True, use foreground write; otherwise, use background write.
        foreground_read (bool): If True, use foreground read; otherwise, use background read.
        count (int): Number of read-write operations to perform per register.
        default_value (int): If provided, this value is used for writes; otherwise, random values are used.
        verbose (bool): If True, logs the results of each operation.
    """
    test_type = "RW"
    for key, reg in RAL.masks.items():
        if "rw" in reg["disable"]:
            continue

        for _ in range(count):
            wrval = (
                default_value
                if default_value is not None
                else random.randint(0, 2 ** reg["regwidth"])
            )
            await rw_test_base(
                RAL, 
                key, 
                reg, 
                wrval, 
                foreground_write, 
                foreground_read,
                test_type,
                verbose, 
            )


async def walking_ones_test(
    RAL,
    foreground_write=True,
    foreground_read=True,
    verbose=False,
):
    """Performs walking ones test on the registers.

    Params:
        RAL (RAL_Test): Instance of RAL model generated using peakrdl_cocotb_ralgen.
        verbose (bool): If True, logs the results of each operation.
        foreground_write (bool): If True, use foreground write; otherwise, use background write.
        foreground_read (bool): If True, use foreground read; otherwise, use background read.
    """
    test_type = "Walking Ones"
    for key, reg in RAL.masks.items():
        if "rw" in reg["disable"]:
            continue

        reg_width = reg["regwidth"]

        for bit in range(reg_width):
            wrval = 1 << bit
            await rw_test_base(
                RAL, 
                key, 
                reg, 
                wrval, 
                foreground_write, 
                foreground_read,
                test_type,
                verbose, 
            )


async def walking_zeros_test(
    RAL,
    foreground_write=True,
    foreground_read=True,
    verbose=False,
):
    """Performs walking zeros test on the registers.

    Params:
        RAL (RAL_Test): Instance of RAL model generated using peakrdl_cocotb_ralgen.
        verbose (bool): If True, logs the results of each operation.
        foreground_write (bool): If True, use foreground write; otherwise, use background write.
        foreground_read (bool): If True, use foreground read; otherwise, use background read.
    """
    test_type = "Walking Zeros"
    for key, reg in RAL.masks.items():
        if "rw" in reg["disable"]:
            continue

        reg_width = reg["regwidth"]

        for bit in range(reg_width):
            wrval = ~(1 << bit) & (2 ** reg["regwidth"] - 1)
            await rw_test_base(
                RAL, 
                key, 
                reg, 
                wrval, 
                foreground_write, 
                foreground_read,
                test_type,
                verbose, 
            )
