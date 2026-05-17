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

## Smoke test

```bash
python -c "import unilink; print(unilink.__version__)"
python -c "import unilink_py"
```
