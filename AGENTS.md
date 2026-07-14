# AGENTS.md

This repository is the helper kit (SDK) for pGenie code generator authors. The
contract/schema itself lives in the sibling `gen-contract` repository.

## What this repo contains

- `src/` contains fixtures and helper signatures for generator authors. The
  canonical input model (`Project`) and the generator `module` constructor are
  imported from `gen-contract/src/package.dhall`.
- No Haskell. All pGenie generators are written in Dhall, and this repo has no
  consumers that need a Haskell projection of the model — that lives in
  `gen-contract` (minimal model) and `pgenie` (runtime bridge).

## Working rules

- Do not duplicate the contract from `gen-contract`. Import `Project` and
  `module` from the pinned remote import in `src/Deps/Contract.dhall`
  (a `https://raw.githubusercontent.com/pgenie-io/gen-contract/...` URL with
  a `sha256` integrity check) — never a local filesystem path.
- Do not reintroduce a Haskell package here. If a generator author or test
  needs Haskell-side fixtures, that belongs in the consuming repo (`pgenie`),
  not here.
- Prefer Dhall formatting and validation for `src/` changes.
- Never reference `gen-contract` or any other sibling `pgenie-io` repository via a local filesystem path (`../gen-contract/...`). Always use a pinned remote import (`https://raw.githubusercontent.com/pgenie-io/<repo>/<tag>/...` with a `sha256`), as `src/Deps/Contract.dhall` already does.

## Validation

- Run `dhall type --file src/package.dhall` and type-check any Dhall files
  that changed.
