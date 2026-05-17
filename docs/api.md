# API

The Python package exposes the pybind11 API migrated from the unilink C++ core
repository.

```python
import unilink

client = unilink.TcpClient("127.0.0.1", 9000)
server = unilink.TcpServer(9000)
```

The compiled extension is installed as `unilink._core`. Existing users can
temporarily import the compatibility shim:

```python
import unilink_py
```

The shim re-exports the same public symbols from `unilink`.
