# TensorPlate Homebrew Tap

First-party Homebrew tap for the [TensorPlate](https://github.com/tensorplate/tensorplate)
operator CLI on macOS Apple Silicon.

```bash
brew install tensorplate/tap/tensorplate
tensorplate version
```

Or in two steps:

```bash
brew tap tensorplate/tap
brew install tensorplate
```

## What this installs

The `tensorplate` CLI only. The TensorPlate runtime (device agent,
serving worker, observability service) is Linux-only and ships through
the TensorPlate APT repository on Jetson devices — macOS support is
CLI-only by design.

## Notes

- **Tap required.** Plain `brew install tensorplate` without tapping is
  not supported: the formula is not in `homebrew/core`.
- **Built from source.** The formula builds the CLI with the Rust
  toolchain Homebrew provides (`rust` is a build-only dependency).
  Prebuilt bottles are follow-up work; until then installs compile the
  CLI from the pinned release tag.
- Issues with the CLI itself belong in the
  [main repository](https://github.com/tensorplate/tensorplate/issues);
  packaging issues for this tap belong here.
