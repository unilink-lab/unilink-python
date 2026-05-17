# Compatibility

## Core compatibility

unilink-python does not implement transports itself. It binds to the unilink
C++ core library.

| unilink-python | unilink core |
|---|---|
| 0.7.x | 0.7.x |

## Versioning

unilink-python follows the unilink C++ core release line. For example,
unilink-python 0.7.x targets the unilink C++ core 0.7.x release line.

Patch releases may contain Python packaging, binding, documentation, or CI fixes
without requiring a matching unilink core patch release, as long as they remain
compatible with the same core minor release line.

## Stability

The Python package is experimental until the C++ core public API reaches a
stable release line.

## ABI policy

Python wheels may statically link or bundle the unilink C++ core. C++ ABI
stability is not guaranteed across incompatible core versions before v1.0.
