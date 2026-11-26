# Upgrade Guide

[Clean](https://moonrepo.dev/docs/commands/clean) moon cache to refresh
tasks after upgrading to a new version.

```sh
moon clean --lifetime 0
```

## 0.2 to 0.3

1. Run `bun reun-moon-config`
2. Remove `.moon/tasks.yml`. Global tasks are now defined in `.moon/tasks/all.yml`.
3. Remove `.moon/tasks/tag-astro.yml`. Config renamed to `.moon/tasks/astro.yml`.'
4. Remove previous hooks from `.moon/hooks`
5. Run `moon sync hooks`
