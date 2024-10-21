"""Set Version for release."""
from pdm.backend.hooks.version import SCMVersion


def format_version(version: SCMVersion) -> str:
    """Used by pdm."""
    with open("f", "w") as f:
        print(version, file=f)
    if version.distance is None:
        return str(version.version)
    return f"{version.version}.post{version.distance}"
