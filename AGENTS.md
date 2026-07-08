# AGENTS.md

This repository is the helper kit (SDK) for pGenie code generator authors. The
contract/schema itself lives in the sibling `gen-contract` repository.

## What this repo contains

- `src/` contains fixtures and helper signatures for generator authors. The
  canonical input model (`Project`) and the generator `module` constructor are
  imported from `gen-contract/dhall/`.
- No Haskell. All pGenie generators are written in Dhall, and this repo has no
  consumers that need a Haskell projection of the model — that lives in
  `gen-contract` (minimal model) and `pgenie` (runtime bridge).

## Working rules

- Do not duplicate the contract from `gen-contract`. Import `Project` and
  `module` from `../gen-contract/dhall/` in Dhall.
- Do not reintroduce a Haskell package here. If a generator author or test
  needs Haskell-side fixtures, that belongs in the consuming repo (`pgenie`),
  not here.
- Prefer Dhall formatting and validation for `src/` changes.

## Validation

- Run `dhall type --file src/package.dhall` and type-check any Dhall files
  that changed.
