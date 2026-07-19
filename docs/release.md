# Release Policy

## Versioning

Wirestead Python follows the Wirestead C++ core release line.

| Wirestead Python | Wirestead core |
|---|---|
| 0.9.x | 0.9.x |

Wirestead Python uses the same minor version as the supported Wirestead C++ core
release line. Patch releases should align with the matching Wirestead C++ core
patch release when the core tag exists.

Patch releases may contain Python packaging, binding, documentation, or CI fixes
without requiring a matching Wirestead core patch release, as long as they remain
compatible with the same core minor release line.

## Release Checklist

1. Confirm the target Wirestead core release line.
2. Update `pyproject.toml`, `CMakeLists.txt`, and `src/wirestead/_version.py`.
3. Update `CHANGELOG.md` and `docs/compatibility.md`.
4. Run local verification against the supported core consumption paths.
5. Push the release commit and confirm CI passes on Linux, macOS, and Windows.
6. Create and push the matching git tag, for example `v0.9.0`.
7. Confirm the Release workflow uploaded the source distribution and wheels to
   the GitHub release.

## Local Verification

```bash
scripts/verify.sh --core-source ../wirestead
```

Set `VCPKG_ROOT` to a vcpkg checkout that contains the official `wirestead`
port for the matching 0.9.x release line. To include installed-package
validation, first install the matching core release and pass the prefix:

```bash
scripts/verify.sh \
  --core-source ../wirestead \
  --installed-prefix ../wirestead-install
```

## Release Assets

The Release workflow publishes GitHub release assets only. It does not upload to
PyPI.

Wheel files keep their standard Python wheel filenames so they remain directly
installable with `pip install ./<wheel-file>.whl`. Artifact grouping follows the
same platform-oriented style as the Wirestead core release workflow:

- `ubuntu-24.04-amd64`
- `macos-15-arm64`
- `windows-amd64`

The source distribution is built with `python -m build --sdist`.

For an existing tag, run the Release workflow manually with `tag_name` set to
that tag and `upload` enabled. Future `v*` tag pushes trigger the same workflow
automatically.
