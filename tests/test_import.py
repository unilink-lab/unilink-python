def test_import_wirestead():
    import wirestead

    assert wirestead is not None
    assert wirestead.__version__ == "0.9.0"


def test_import_unilink_compat_package():
    import unilink

    assert unilink is not None
    assert unilink.__version__ == "0.9.0"


def test_import_compat_shim():
    import unilink_py

    assert unilink_py is not None
