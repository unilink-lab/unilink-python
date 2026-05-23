# Compatibility

## Core compatibility

unilink-python does not implement transports itself. It binds to the unilink
C++ core library.

| unilink-python | Supported unilink core |
|---|---|
| 0.7.x | 0.7.x |

## Validated core versions

The current release line is validated against:

| unilink-python | Validated unilink core refs |
|---|---|
| 0.7.4 | v0.7.4 |

Additional patch versions in the same minor line may also work, but CI
validation tracks the versions listed above.

## Versioning

unilink-python follows the unilink C++ core minor release line.

Patch versions may differ when Python packaging, binding, documentation, or CI
fixes do not require a matching unilink core patch release.

## Stability

The Python package is experimental until the C++ core public API reaches a
stable release line.

## ABI policy

Python wheels may statically link or bundle the unilink C++ core. C++ ABI
stability is not guaranteed across incompatible core versions before v1.0.

## Dependency policy

Wheel builds use pybind11 2.x. Keep CI, release, and local verification build
dependency ranges aligned with `pyproject.toml`.
