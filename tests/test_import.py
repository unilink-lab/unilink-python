def test_import_unilink():
    import unilink

    assert unilink is not None
    assert unilink.__version__ == "0.7.2"


def test_import_compat_shim():
    import unilink_py

    assert unilink_py is not None
