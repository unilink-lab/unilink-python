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
| 0.7.3 | v0.7.3 |

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

The initial split release pins pybind11 below 3.0 for wheel builds. pybind11 3.x
support should be tested and enabled in a later release line or patch once the
Windows import smoke tests pass consistently.
