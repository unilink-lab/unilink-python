# Packet Probe Viewer IPC Example

This example shows how a Python application can consume a Packet Probe JSONL IPC
stream using `unilink-python`.

## UDS JSONL client

```python
import json
import threading
import unilink

socket_path = "/tmp/packet-probe.sock"

client = unilink.UdsClient(socket_path)
client.use_line_framer("\n", False, 65536)

def on_message(ctx):
    line = bytes(ctx.data).decode("utf-8")
    obj = json.loads(line)
    if obj.get("type") == "metadata":
        print("metadata:", obj)
    else:
        print("event:", obj)

client.on_message(on_message)

if not client.start_sync():
    raise RuntimeError("failed to connect")

try:
    threading.Event().wait()
finally:
    client.stop()
```

## Async version

```python
import asyncio
import json
from unilink.asyncio import AsyncUdsClient

async def main():
    client = AsyncUdsClient("/tmp/packet-probe.sock")
    client.use_line_framer("\n", False, 65536)

    if not await client.start():
        raise RuntimeError("failed to connect")

    try:
        while True:
            ctx = await client.read_message()
            obj = json.loads(bytes(ctx.data).decode("utf-8"))
            print(obj)
    finally:
        client.stop()

asyncio.run(main())
```
