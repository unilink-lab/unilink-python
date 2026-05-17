# Release Policy

## Versioning

unilink-python follows the unilink C++ core release line.

| unilink-python | unilink core |
|---|---|
| 0.7.x | 0.7.x |

The first split release is unilink-python v0.7.2 because the current unilink
C++ core release is v0.7.2.

Patch releases may contain Python packaging, binding, documentation, or CI fixes
without requiring a matching unilink core patch release, as long as they remain
compatible with the same core minor release line.

## Release Checklist

1. Confirm the target unilink core release line.
2. Update `pyproject.toml`, `CMakeLists.txt`, and `src/unilink/_version.py`.
3. Update `CHANGELOG.md` and `docs/compatibility.md`.
4. Run local smoke tests against the matching core source tree.
5. Push the release commit and confirm CI passes on Linux, macOS, and Windows.
6. Create and push the matching git tag, for example `v0.7.2`.
7. Confirm the Release workflow uploaded the source distribution and wheels to
   the GitHub release.

## Local Verification

```bash
python -m pip install -e . \
  -Ccmake.define.UNILINK_CORE_SOURCE_DIR=../unilink

python -c "import unilink; print(unilink.__version__)"
python -c "import unilink_py"
python -m pytest -q -m "not serial and not integration"
```

## Release Assets

The Release workflow publishes GitHub release assets only. It does not upload to
PyPI.

Wheel files keep their standard Python wheel filenames so they remain directly
installable with `pip install ./<wheel-file>.whl`. Artifact grouping follows the
same platform-oriented style as the unilink core release workflow:

- `ubuntu-24.04-amd64`
- `macos-15-arm64`
- `windows-amd64`

The source distribution is built with `python -m build --sdist`.

For an existing tag, run the Release workflow manually with `tag_name` set to
that tag and `upload` enabled. Future `v*` tag pushes trigger the same workflow
automatically.
