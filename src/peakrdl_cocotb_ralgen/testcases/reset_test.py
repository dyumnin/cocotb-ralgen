"""Reset Testcase."""
import cocotb

logger = cocotb.log


def reset_test(RAL, *, verbose=False):
    """Reset Testcase.

    This testcase reads the value of all fields during reset and checks for match with the defined reset value.
    """
    error_count = 0
    for key, val in RAL.masks.items():
        if "reset" in val["disable"]:
            continue
        rv = 0
        for hsh in val["signals"]:
            rv |= RAL.background.read(hsh) << hsh["low"]
        try:
            actual = rv & val["reset_mask"]
            expected = val["reset_value"]
            assert (
                actual == expected
            ), f"{key} Resetvalue mismatch Actual {actual:x},Expected {expected:x},"
        except:
            cocotb.log.error(
                f"Reset Read Reg:{key}, actual {rv:x} expected {expected:x}",
            )
            error_count += 1
        if verbose:
            logger.info(f"Reset Read Reg:{key}, Value {rv:x}")
    assert error_count == 0, f"Test exited with {error_count} Error"
