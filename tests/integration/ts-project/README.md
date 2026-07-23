# TypeSript integration test

We're using `pnpm` instead of `bun` here because bun doesn't properly support
relative dependencies. See https://github.com/oven-sh/bun/issues/5045.

## Running this test

```sh
`pnpm install`
```

```sh
`bun reun-moon-config`
```

```sh
`moon run root:lint`
```
