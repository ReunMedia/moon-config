# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and [Common Changelog](https://common-changelog.org/), and this project adheres
to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.3] - 2026-11-26

_Remove previous hooks from `.moon/hooks` and run `moon sync hooks` to update Git hooks._

### Fixed

- Use `moon run` for Git hooks
- Remove `--no-bail` from lint Git hook (it was [removed in moon 2](https://moonrepo.dev/docs/migrate/2.0#moon-run))

## [0.3.2] - 2026-07-24

### Changed

- Add `--pass-with-no-tests` to Bun test task to prevent dependent tasks from
  failing if there are no tests

### Added

- Add option to overwrite all config files when running the script instead of
  having to approve each individually

## [0.3.1] - 2026-07-24

### Changed

- Run lint-package-json from root project only

### Fixed

- Improve Astro Bun support

## [0.3.0] - 2026-07-24

_If you are upgrading: please see [`UPGRADING.md`](UPGRADING.md)._

### Changed

- **Breaking:** Update to moon 2

### Removed

- **Breaking:** Drop moon 1 support

## [0.2.0] - 2025-10-31

Initial release.

[0.3.3]: https://github.com/ReunMedia/moon-config/releases/tag/0.3.3
[0.3.2]: https://github.com/ReunMedia/moon-config/releases/tag/0.3.2
[0.3.1]: https://github.com/ReunMedia/moon-config/releases/tag/0.3.1
[0.3.0]: https://github.com/ReunMedia/moon-config/releases/tag/0.3.0
[0.2.0]: https://github.com/ReunMedia/moon-config/releases/tag/0.2.0
