# v0.12.0

## Non-breaking

- Add generic `Sigs.Interpreter`/`Sigs.Template` module-shape constructors, and document the `Sigs`/`InterpreterConfig` convention that replaces the old `Algebras` pattern.

# v0.11.0

## Breaking

- Updated to Lude v5.0.0
  - The `Compiled` abstraction is now `Result {warnings : List Report, value : a}` instead of `{warnings : List Report, value : Result a}`

- Updated the contract version to 4.0
