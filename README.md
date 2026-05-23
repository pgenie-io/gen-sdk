# gen-sdk

[![Continuous Docs for Dhall](https://img.shields.io/badge/dhall_docs-master-blue)](https://pgenie-io.github.io/gen-sdk/dhall/)
[![Continuous Docs for Haskell](https://img.shields.io/badge/haskell_docs-master-blue)](https://pgenie-io.github.io/gen-sdk/haskell/)

Shared contract and SDK for [pGenie](https://pgenie.io) code generators.

The repository has two consumers of the same model:

- The **Dhall contract** is what generator authors write against. It defines the generator input schema, fixtures, contract versioning, and the `module` constructor used to assemble a generator package.
- The **Haskell library** is used by the pGenie CLI app to load generators, validate the contract version, and invoke the compiled generator code at runtime or through Template Haskell.

> [!IMPORTANT]
> This library relies on a fork of Dhall that provides primitives for `Natural/equal` and `Natural/lessThan`. These have been [PRd](https://github.com/dhall-lang/dhall-haskell/pull/2739) into the main repo. Until they get merged you will need to use the custom Dhall binary provided in https://github.com/nikita-volkov/dhall-haskell.

## Structure

### `dhall/`

The Dhall side is the contract for generator authors. It is the source of truth for the codegen model and the helper API used by generators. See the [Dhall docs](https://pgenie-io.github.io/gen-sdk/dhall/) for the full reference.

The entry point is `package.dhall`, which exposes:

- **`Project`** — the input model describing a PostgreSQL project: queries, custom types, primitive types, migrations, and related metadata
- **`ContractVersion`** — the versioning schema for the generator contract
- **`module`** — the constructor used to assemble a generator module from a contract version, a config type, and a compile function
- **`Fixtures`** — sample projects for generator tests

A minimal generator looks like this:

```dhall
let Sdk = https://raw.githubusercontent.com/pgenie-io/gen-sdk/<tag>/dhall/package.dhall

in  Sdk.module
      { major = 1, minor = 0 }
      ./Config.dhall
      ./compile.dhall
```

For a real-world example see [haskell-hasql.gen](https://github.com/pgenie-io/haskell-hasql.gen).

### `haskell/`

The Haskell side is the bridge used by the pGenie CLI app. It loads generator code, checks contract compatibility, decodes generator configuration, and exposes the same generator model to runtime and Template Haskell callers. See the [Haskell docs](https://pgenie-io.github.io/gen-sdk/haskell/) for details.

## Why they live together

The Dhall contract and the Haskell bridge need to agree on the same model. Keeping them in one repository makes it easier to keep the schema, the loader, and the compatibility tests in sync so changes to the contract are validated end-to-end before release.
