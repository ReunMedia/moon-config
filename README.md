# Reun Media moon Configuration

[![NPM Version](https://img.shields.io/npm/v/%40reunmedia%2Fmoon-config)](https://www.npmjs.com/package/@reunmedia/moon-config)
[![Packagist Version](https://img.shields.io/packagist/v/reun/moon-config)](https://packagist.org/packages/reun/moon-config)

Reun Media [moon](https://moonrepo.dev/moon) configuration.

## Installation

### Requirements

- moon binary available in `PATH`

A [global installation](https://moonrepo.dev/docs/install) of moon is
recommended. If moon is installed locally (e.g. via npm), it must still be
available in `PATH`.

### From npm

```sh
bun add -D @reunmedia/moon-config
```

### With Composer

```sh
composer require --dev reun/moon-config
```

### Manually

Copy desired configuration files manually from `.moon/**` to your project.

## Usage

Initialize moon:

```sh
moon init
```

Run the included script to generate moon configuration files. The location of
the script depends on how you installed the package.

Note: The script requires Bash to run. Refer to [manual installation](#manually)
if you aren't running Bash.

```sh
# npm installation
bun reun-moon-config
```

```sh
# Composer installation
./vendor/bin/reun-moon-config
```

Sync YAML schemas:

```sh
moon sync config-schemas
```

### Configure task inheritance

Add relevant languages, toolchains and tasks to each project's `moon.yml` for
task inheritance. See `inheritedBy` in `./moon/tasks/*.yml` to see which
configuration enables task inheritance for that specific file.

```yml
# packages/php-project/moon.yml
language: php # Inherits PHP tasks
```

```yml
# packages/astro-project/moon.yml
language: typescript # Inherits JS/TS tasks
toolchains:
  default: bun # Inherits Bun tasks
tags: [astro] # Inherits Astro tasks
```

### Enable Git hooks

Git hooks are not enabled by default and must be synced manually.

```sh
moon sync hooks
```

### Task package dependencies

Most tasks require specific dependencies to be installed. See the comments in
`.moon/**/*.yml` for list of packages to install. You may [disable specific
tasks](#disabling-specific-tasks-in-project) to avoid installing all
dependencies.

### Disabling specific tasks in project

If you don't want or can't use specific tasks in projects e.g. due to missing
dependencies, you can exclude them in local project's `moon.yml`:

```yml
# Example of a PHP project without `php-cs-fixer`, `phpstan` and `package.json`
workspace:
  inheritedTasks:
    exclude:
      - php-cs-fixer
      - phpstan
      - lint-package-json
```

## Upgrading

[Clean](https://moonrepo.dev/docs/commands/clean) moon cache to refresh
tasks after upgrading to a new version.

```sh
moon clean --lifetime 0
```

See [UPGRADING.md](UPGRADING.md) for upgrade notes between versions.
