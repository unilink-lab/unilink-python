# Contributing

This repository contains the Python package and pybind11 bindings for
`unilink`. Keep changes scoped to Python packaging, binding code, tests, and
documentation for consuming the C++ core from Python.

## Formatting

The repository follows the same C++ and CMake formatting configuration as the
core `unilink` repository:

- C++ files use `.clang-format`.
- CMake files use `.cmake-format.py`.

Run the formatting workflow locally when changing C++ or CMake files, or verify
that CI formatting checks pass on the pull request.

## Validation

For build-related changes, validate the supported core consumption paths when
possible. The recommended entry point is:

```bash
scripts/verify.sh --core-source /path/to/unilink
```

The script always runs `git diff --check`. By default it validates a package
install against a local core source tree and a vcpkg manifest install. Set
`VCPKG_ROOT` to a vcpkg checkout that contains `jwsung91-unilink` 0.7.2 or
newer, or pass `--skip-vcpkg` if that path is not applicable.

To validate an installed core package, pass the installation prefix:

```bash
scripts/verify.sh \
  --core-source /path/to/unilink \
  --installed-prefix /path/to/unilink/install
```

To run the TCP loopback integration test as part of verification, pass
`--run-integration`.

If a check is not applicable, note that in the pull request.
