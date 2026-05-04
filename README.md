# gen-sdk

[![Continuous Docs for Dhall](https://img.shields.io/badge/dhall_docs-master-blue)](https://pgenie-io.github.io/gen-sdk/dhall/)
[![Continuous Docs for Haskell](https://img.shields.io/badge/haskell_docs-master-blue)](https://pgenie-io.github.io/gen-sdk/haskell/)

SDK for building [pGenie](https://github.com/pgenie-io/pgenie) code generators.

> [!IMPORTANT]
> This library relies on a fork of Dhall that provides primitives for `Natural/equal` and `Natural/lessThan`. These have been [PRd](https://github.com/dhall-lang/dhall-haskell/pull/2739) into the main repo. Until they get merged you will need to use the custom Dhall binary provided in https://github.com/nikita-volkov/dhall-haskell.

## Structure

The repository contains two components distributed together:

### `dhall/`

The primary component for generator authors. It provides the Dhall API that code generators are written against — type definitions, the module constructor, and utilities for producing compilable output. See the [Dhall docs](https://pgenie-io.github.io/gen-sdk/dhall/) for the full API reference.

The entry point is `package.dhall`, which exposes:

- **`Project`** — the input model describing a PostgreSQL project (queries, custom types, primitive types, etc.)
- **`Compiled`** — the output model carrying generated files along with warnings and errors
- **`File`** / **`Files`** — types representing generated output files
- **`ContractVersion`** — versioning schema for the generator contract
- **`module`** — constructor function for assembling a generator module from a contract version, a config type, and a compile function
- **`Fixtures`** — sample projects for use in generator tests

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

The Haskell library used by [pGenie](https://github.com/pgenie-io/pgenie) itself to load and invoke generators at runtime and at compile time (via Template Haskell). Generator authors do not need this component. See the [Haskell docs](https://pgenie-io.github.io/gen-sdk/haskell/) for details.

## Why they live together

Both components share the same ephemeral bridge model between Haskell and Dhall — the Haskell types and the Dhall types must stay in sync. Co-locating them in one repository and testing them together in CI ensures that any change to the shared model is validated end-to-end before being released.
