def test_import_unilink():
    import unilink

    assert unilink is not None
    assert unilink.__version__ == "0.8.9"


def test_import_compat_shim():
    import unilink_py

    assert unilink_py is not None
