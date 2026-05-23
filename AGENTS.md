# AGENTS.md

This repository is the shared SDK and contract for pGenie code generators.

## What this repo contains

- `dhall/` is the generator contract: the canonical Dhall input model, fixtures, versioning, and the `module` constructor used by generator authors.
- `haskell/` is the runtime bridge used by the pGenie CLI to load, validate, and invoke generators, including Template Haskell bundling.

## Working rules

- Treat `dhall/Project.dhall` and the Haskell model under `haskell/library/PGenieGen/Model*` as a synchronized pair.
- When changing the contract, update the compatibility tests in `haskell/model-test/Main.hs` so record fields and union alternatives stay aligned.
- Keep edits focused; do not touch generated build artifacts in `dist-newstyle/` unless the task explicitly requires regeneration.
- Prefer Dhall formatting and validation for `dhall/` changes.

## Validation

- Use `./build.bash` for the repo's full build path.
- The repository also has Cabal test suites for model compatibility, integration, and bundling.
