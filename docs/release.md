# Release Policy

## Versioning

unilink-python follows the unilink C++ core release line.

| unilink-python | unilink core |
|---|---|
| 0.8.x | 0.8.x |

unilink-python uses the same minor version as the supported unilink C++ core
release line. Patch releases should align with the matching unilink C++ core
patch release when the core tag exists.

Patch releases may contain Python packaging, binding, documentation, or CI fixes
without requiring a matching unilink core patch release, as long as they remain
compatible with the same core minor release line.

## Release Checklist

1. Confirm the target unilink core release line.
2. Update `pyproject.toml`, `CMakeLists.txt`, `vcpkg.json`, and
   `src/unilink/_version.py`.
3. Update `CHANGELOG.md`, `docs/compatibility.md`, and the version table above.
4. Run local verification against the supported core consumption paths.
5. Push the release commit and confirm CI passes on Linux, macOS, and Windows.
6. Create and push the matching git tag, for example `v0.8.9`.
7. Confirm the Release workflow uploaded the source distribution and wheels to
   the GitHub release.

## Local Verification

```bash
scripts/verify.sh --core-source ../unilink
```

Set `VCPKG_ROOT` to a vcpkg checkout that contains `jwsung91-unilink` 0.8.9 or
newer. To include installed-package validation, first install the matching core
release and pass the prefix:

```bash
scripts/verify.sh \
  --core-source ../unilink \
  --installed-prefix ../unilink-install
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
