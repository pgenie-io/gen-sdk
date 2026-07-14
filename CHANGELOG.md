# v3.0.0

## Breaking

- Pinned `gen-contract` to v5.0.0. `Scalar.Custom` now carries a `CustomTypeRef` (`{ name, pgSchema, pgName, index }`, resolvable into `Project.customTypes`) instead of a bare `Name`.
- Added `CustomTypes.{supportedCustomTypes, supportedCustomTypesReasoned, customTypeIsSupported, queryIsSupported}`, built on one topological left fold over `Project.customTypes`, for generators to detect and skip (with a warning) custom types and queries that transitively depend on a kind of custom type they don't support.
- Extended `Fixtures.Exhaustive` with a domain custom type and a composite-over-domain custom type, in a non-`public` schema with a `pgName` that diverges from its identifier's snake_case, to exercise both the new support-fold helpers and authentic-`pgSchema`/`pgName` resolution in downstream generators.
- Pinned `gen-contract`'s inlined `Value` shape: `dimensionality : Natural` and `elementIsNullable : Bool` now sit directly on `Value` (no more `arraySettings : Optional ArraySettings`), with `dimensionality = 0` meaning a bare scalar. Updated `Fixtures.Exhaustive` accordingly.

## Non-breaking

- Renamed `demos/` to `fixtures/` in the generator-repository conventions documented in `docs/generator-architecture.md`, aligning the directory name with the `Sdk.Fixtures` module it exercises. The local verification output directory is now `generated-output/` instead of `demos/Exhaustive/`.

# v2.0.0

## Breaking

- `Sigs.Interpreter` and `Sigs.Template` module-shape constructors are now called directly as functions instead of through a `.module` field — use `Sigs.interpreter Config Input Output run` / `Sigs.template Params run` in place of `Sigs.Interpreter.module ...` / `Sigs.Template.module ...`.

## Non-breaking

- Add a `Sigs.generator` module-shape constructor (`Config`, `defaultConfig`, `interpret` → `{ contractVersion, Config, compile }`).
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
