def test_core_api_surface():
    import unilink

    expected = [
        "TcpClient",
        "TcpServer",
        "Serial",
        "UdpClient",
        "UdpConfig",
        "UdpServer",
        "UdsClient",
        "UdsServer",
        "MessageContext",
        "ConnectionContext",
        "ErrorContext",
        "BackpressureStrategy",
        "ErrorCode",
        "LineFramer",
        "PacketFramer",
    ]

    missing = [name for name in expected if not hasattr(unilink, name)]
    assert not missing


def test_standard_python_surface_uses_canonical_names():
    import unilink

    assert hasattr(unilink.TcpClient, "connected")
    assert not hasattr(unilink.TcpClient, "is_connected")
    assert hasattr(unilink.TcpClient, "use_line_framer")
    assert not hasattr(unilink.TcpClient, "line_framer")
    assert hasattr(unilink.TcpClient, "use_packet_framer")
    assert not hasattr(unilink.TcpClient, "packet_framer")

    assert hasattr(unilink.TcpServer, "listening")
    assert not hasattr(unilink.TcpServer, "is_listening")
    assert hasattr(unilink.TcpServer, "on_connect")
    assert not hasattr(unilink.TcpServer, "on_client_connect")
    assert hasattr(unilink.TcpServer, "on_disconnect")
    assert not hasattr(unilink.TcpServer, "on_client_disconnect")

    assert hasattr(unilink.MessageContext, "client_info")
    assert not hasattr(unilink.MessageContext, "remote_address")


def test_backpressure_properties_are_write_only():
    import pytest
    import unilink

    client = unilink.TcpClient("127.0.0.1", 65535)

    client.backpressure_threshold = 32
    client.backpressure_strategy = unilink.BackpressureStrategy.BestEffort

    with pytest.raises(AttributeError):
        _ = client.backpressure_threshold
    with pytest.raises(AttributeError):
        _ = client.backpressure_strategy
