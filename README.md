# gen-sdk

[![Dhall Docs](https://img.shields.io/badge/dhall_docs-master-blue)](https://pgenie-io.github.io/gen-sdk/)

Helper kit for authors of [pGenie](https://pgenie.io) code generators. It layers fixtures and opt-in signature helpers on top of the [`gen-contract`](https://github.com/pgenie-io/gen-contract) schema.

`gen-sdk` itself carries no Haskell — all pGenie generators are written in Dhall. The canonical input model (`Project`) and the generator `module` constructor live in `gen-contract` and are re-exported here for convenience.

## Structure

The entry point is [`src/package.dhall`](src/package.dhall). It re-exports `Project` and `module` from `gen-contract` and adds:

- **`Fixtures`** — sample `Project` values for generator tests. [`src/Fixtures/Exhaustive.dhall`](src/Fixtures/Exhaustive.dhall) exercises the full contract surface.
- **`Sigs`** — opt-in module-shape constructors shared by every generator:
  - `Sigs.Interpreter` — for `Interpreters/` modules
  - `Sigs.Template` — for `Templates/` modules
- **`Primitive/toText`** — helper that renders a PostgreSQL primitive type to its SQL name (e.g. `Int4` → `"int4"`).
