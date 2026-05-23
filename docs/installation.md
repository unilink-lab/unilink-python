# Installation

## Development install with local core source

```bash
git clone https://github.com/jwsung91/unilink.git
git clone https://github.com/unilink-lab/unilink-python.git

cd unilink-python

python -m pip install -U pip
python -m pip install -e . \
  -Ccmake.define.UNILINK_CORE_SOURCE_DIR=../unilink
```

## Install with an installed unilink core package

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

## Install with vcpkg

The repository includes a `vcpkg.json` manifest that depends on
`jwsung91-unilink`. Use a vcpkg checkout that contains `jwsung91-unilink` 0.7.4
or newer.

```bash
export VCPKG_ROOT=/path/to/vcpkg

python -m pip install . \
  -Ccmake.define.CMAKE_TOOLCHAIN_FILE=$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake
```

## Smoke test

```bash
python -c "import unilink; print(unilink.__version__)"
python -c "import unilink_py"
```

## Local verification

```bash
scripts/verify.sh --core-source ../unilink
```

Set `VCPKG_ROOT` to run vcpkg validation, or pass `--skip-vcpkg`. Add
`--installed-prefix /path/to/unilink/install` to validate against an installed
core package.
