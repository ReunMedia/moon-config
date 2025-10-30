# Reun Media moon Configuration

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
composer require reun/moon-config
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
bun run reun-moon-config
```

```sh
# Composer installation
vendor/bin/reun-moon-config
```

### Disabling specific tasks in project

If you don't want or can't use specific tasks in projects e.g. due to missing
dependencies, you can override

## Upgrading

[Clean](https://moonrepo.dev/docs/commands/clean) moon cache to refresh
tasks after upgrading to a new version.

```sh
moon clean --lifetime 0
```
