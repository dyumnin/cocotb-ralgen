"""Set Version for release."""
from pdm.backend.hooks.version import SCMVersion


def format_version(version: SCMVersion) -> str:
    """Used by pdm."""
    if version.distance is None:
        return str(version.version)
    return f"{version.version}.post{version.distance}"
