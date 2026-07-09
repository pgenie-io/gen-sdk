# gen-sdk

[![Continuous Docs for Dhall](https://img.shields.io/badge/dhall_docs-master-blue)](https://pgenie-io.github.io/gen-sdk/)

Helper kit (Dhall-only) for authors of [pGenie](https://pgenie.io) code generators: fixtures and opt-in signature helpers layered on top of the [`gen-contract`](https://github.com/pgenie-io/gen-contract) schema. All pGenie generators are written in Dhall, so this SDK carries no Haskell.

> [!IMPORTANT]
> This library relies on a fork of Dhall that provides primitives for `Natural/equal` and `Natural/lessThan`. These have been [PRd](https://github.com/dhall-lang/dhall-haskell/pull/2739) into the main repo. Until they get merged you will need to use the custom Dhall binary provided in https://github.com/nikita-volkov/dhall-haskell.

## Structure

### `src/`

See the [Dhall docs](https://pgenie-io.github.io/gen-sdk/dhall/) for the full reference.

The entry point is `package.dhall`, which re-exports `Project` and `module` from [`gen-contract`](https://github.com/pgenie-io/gen-contract) and adds:

- **`Fixtures`** — sample projects for generator tests
- **`Sigs`** — opt-in generator signature helpers
- **`Primitive/toText`** — a helper for rendering primitive types

A minimal generator looks like this:

```dhall
let Sdk = https://raw.githubusercontent.com/pgenie-io/gen-sdk/<tag>/src/package.dhall

in  Sdk.module
      { major = 1, minor = 0 }
      ./Config.dhall
      ./compile.dhall
```

For a real-world example see [haskell-hasql.gen](https://github.com/pgenie-io/haskell-hasql.gen).
