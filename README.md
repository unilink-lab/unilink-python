# unilink-python

Python bindings for the unilink C++ communication library.

This repository contains the Python package and pybind11 bindings. The C++ core
lives in the main unilink repository.

- Core library: https://github.com/jwsung91/unilink
- Python bindings: https://github.com/unilink-lab/unilink-python

## Package Layout

- Python package: `unilink`
- Compiled extension: `unilink._core`
- Backward compatibility shim: `unilink_py`

## Documentation

- Installation: [docs/installation.md](docs/installation.md)
- API overview: [docs/api.md](docs/api.md)
- Compatibility: [docs/compatibility.md](docs/compatibility.md)
- Contributing: [CONTRIBUTING.md](CONTRIBUTING.md)
- Release policy: [docs/release.md](docs/release.md)
- Changelog: [CHANGELOG.md](CHANGELOG.md)

The first split release keeps the existing binding API surface. It does not add
new transport functionality.

## Installation

### Development mode with local core source

```bash
git clone https://github.com/jwsung91/unilink.git
git clone https://github.com/unilink-lab/unilink-python.git

cd unilink-python

python -m pip install -U pip
python -m pip install -e . \
  -Ccmake.define.UNILINK_CORE_SOURCE_DIR=../unilink
```

### Installed core package

```bash
cmake -S ../unilink -B ../unilink-build \
  -DCMAKE_BUILD_TYPE=Release \
  -DUNILINK_BUILD_TESTS=OFF \
  -DUNILINK_BUILD_DOCS=OFF

cmake --build ../unilink-build --parallel
cmake --install ../unilink-build --prefix ../unilink-install

cd ../unilink-python
python -m pip install . \
  -Ccmake.define.CMAKE_PREFIX_PATH=../unilink-install
```

### vcpkg core package

The repository includes a `vcpkg.json` manifest that depends on
`jwsung91-unilink`.

```bash
export VCPKG_ROOT=/path/to/vcpkg

python -m pip install . \
  -Ccmake.define.CMAKE_TOOLCHAIN_FILE=$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake
```

## Import Smoke

```bash
python -c "import unilink; print(unilink.__version__)"
python -c "import unilink_py"
```

## Tests

```bash
python -m pytest -q -m "not serial"
```

Real TCP loopback coverage is marked as `integration` and is disabled unless
explicitly requested:

```bash
UNILINK_PYTHON_RUN_LOOPBACK_TESTS=1 python -m pytest -q -m "integration"
```

For local validation across supported core consumption paths, use:

```bash
scripts/verify.sh --core-source ../unilink
```

Set `VCPKG_ROOT` to enable the vcpkg path, or pass `--skip-vcpkg` when it is
not applicable. Add `--installed-prefix /path/to/unilink/install` to validate
against an installed core package.

## Compatibility

unilink-python follows the unilink C++ core release line. For example,
unilink-python 0.7.x targets the unilink C++ core 0.7.x release line.

Patch releases may contain Python packaging, binding, documentation, or CI fixes
without requiring a matching unilink core patch release, as long as they remain
compatible with the same core minor release line.

The Python package is currently experimental until the C++ public API reaches a
stable release line.
