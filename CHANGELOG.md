# Upcoming

## Breaking

- `Sigs.Interpreter` and `Sigs.Template` module-shape constructors are now called directly as functions instead of through a `.module` field — use `Sigs.interpreter Config Input Output run` / `Sigs.template Params run` in place of `Sigs.Interpreter.module ...` / `Sigs.Template.module ...`.

## Non-breaking

- Add a `Sigs.Generator` module-shape constructor (`Config`, `defaultConfig`, `interpret` → `{ contractVersion, compile }`), taking over the module-constructor role that `gen-contract` is dropping so it can stay types-only.
- Bump the pinned `gen-contract` dependency to the commit that extracts the module constructor.
- Document generator-repository conventions in `docs/generator-architecture.md`: drop the `Deps/` package aggregator (each module imports only the `Deps/*.dhall` files it uses), adopt `demos/` (not `tests/`) for fixture drivers, and stop committing materialised demo output (CI verifies it transiently).

# v1.0.0

## Breaking

- Extracted the generator contract (`Project` schema, `module` constructor, and the Lude-based output types) into the new `gen-contract` repository; `dhall/package.dhall` now re-exports `Project` and `module` from `gen-contract` instead of defining them locally.
- Removed the Haskell package entirely (`PGenieGen.Fixtures.Project1`, `PGenieGen.Prelude`). This repo is now Dhall-only — all pGenie generators are written in Dhall, and the sole consumer of the Haskell fixture (`pgenie`'s test suites) now carries it in-house.
- Renamed the `dhall/` directory to `src/`. Update imports of `package.dhall` (and any other file under the old `dhall/` path) to `src/`.

## Non-breaking

- Removed leftover local Haskell build artifacts (`dist/`, `dist-newstyle/`) now that the repo carries no Haskell package.
- Restructured CI/CD: added a reusable `ci.yml` (Dhall type-checking), and `bump.yml`/`release.yml` workflows that automate tagged GitHub releases of the frozen, resolved `src/package.dhall`, following the same pattern as `java.gen`.
- `Sigs.Interpreter`'s `Report`/`File`/`Result` now import from
  gen-contract's `Report`/`File`/`Output` instead of redefining them
  locally. No shape change.
- Add `Output.toFileMap` to convert `Output` to a `Prelude.Map Text Text` for writing to disk.

# v0.12.0

## Non-breaking

- Add generic `Sigs.Interpreter`/`Sigs.Template` module-shape constructors, and document the `Sigs`/`InterpreterConfig` convention that replaces the old `Algebras` pattern.

# v0.11.0

## Breaking

- Updated to Lude v5.0.0
  - The `Compiled` abstraction is now `Result {warnings : List Report, value : a}` instead of `{warnings : List Report, value : Result a}`

- Updated the contract version to 4.0
