"""Reset Testcase."""
import cocotb

logger = cocotb.log


def reset_test(RAL, *, verbose=False, expected_error=0):
    """Reset Testcase.

    This testcase reads the value of all fields during reset and checks for match with the defined reset value.
    """
    error_count = 0
    for key, val in RAL.masks.items():
        if "reset" in val["disable"]:
            continue
        rv = 0
        for hsh in val["signals"]:
            hshval = RAL.background.read(hsh)
            if hshval is not None:
                rv |= int(hshval) << hsh["low"]
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
            else:
                logger.info(f"Error: Unable to access {hsh}")
                error_count += 1
            if verbose:
                logger.info(f"Reset Read Reg:{key}, Value {rv:x}")
        assert (
            error_count == expected_error
        ), f"Test exited with {error_count} Error, expected {expected_error}"
