# Packaging & PyInstaller Notes

`unilink-python` includes the compiled C++ extension `unilink._core`.

Applications that bundle `unilink-python` with tools such as PyInstaller must
ensure that:

- `unilink._core` compiled extension is included
- Required unilink core C++ runtime libraries are discoverable
- On Windows, DLL directories are configured correctly
- vcpkg or installed runtime DLLs are included in the bundle when needed

`src/unilink/__init__.py` contains logic to configure Windows DLL directories at import time. When packaging, make sure that any required shared libraries (like `.dll` or `.so`) are placed in the application bundle directory so they can be loaded by the extension.
