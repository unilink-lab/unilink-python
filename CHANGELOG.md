# Changelog

All notable changes to unilink-python are documented in this file.

## v0.7.4

Release aligned with unilink C++ core 0.7.4.

### Changed

- Synced Python package metadata, runtime version, tests, documentation, and
  CI validation with the unilink C++ core 0.7.4 release line.
- Kept build and release dependency installation aligned with pybind11 3.x.

## v0.7.3

### Changed

- Synced Python package metadata with the unilink C++ core 0.7.3 release line.
- Updated CI to validate against unilink core `v0.7.3`.
- Clarified minor-line compatibility policy for `unilink-python`.

## v0.7.2

Initial split release aligned with unilink C++ core 0.7.2.

### Added

- pybind11 bindings migrated from the unilink core repository.
- scikit-build-core packaging for the `unilink` Python package.
- Local unilink core source build mode through `UNILINK_CORE_SOURCE_DIR`.
- Installed unilink CMake package build mode through `CMAKE_PREFIX_PATH`.
- Compatibility import shim for `unilink_py`.
- Import and API smoke tests.
- Linux, macOS, and Windows CI for Python 3.8, 3.10, and 3.12.

### Notes

- The Python API remains experimental while the unilink C++ public API is
  pre-1.0.
- unilink-python follows the unilink core minor release line. The 0.7.x Python
  package line targets the 0.7.x core line.
- Patch releases may contain Python-only packaging, CI, documentation, or
  binding fixes as long as they remain compatible with the same core minor
  release line.
