# Compatibility

## Core compatibility

unilink-python does not implement transports itself. It binds to the unilink
C++ core library.

| unilink-python | unilink core |
|---|---|
| 0.1.x | 0.7.x / 0.8.x |

## Stability

The Python package is experimental until the C++ core public API reaches a
stable release line.

## ABI policy

Python wheels may statically link or bundle the unilink C++ core. C++ ABI
stability is not guaranteed across incompatible core versions before v1.0.
