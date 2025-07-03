{-
# Name Tests

Tests for the Name module functions are now in dedicated test files.
Each test file imports the function and tests it externally.

## Running Tests

For individual functions:
```bash
dhall --file=dhall/Name/toTextInKebab.test.dhall
dhall --file=dhall/Name/toTextInCamel.test.dhall
dhall --file=dhall/Name/toTextInPascal.test.dhall
dhall --file=dhall/Name/toTextInSnake.test.dhall
```

For all tests:
```bash
dhall --file=dhall/Name/test.dhall
```

## Test Structure

Each test file:
- Imports the function with `let self = ./functionName.dhall`
- Contains descriptive test names with `assert` statements
- Returns `{}` to indicate successful completion

This provides clean separation between implementation and testing while
maintaining comprehensive test coverage.
-}
{ Segment/test = ./Segment/test.dhall
, toTextInKebab = ./toTextInKebab.test.dhall
, toTextInCamel = ./toTextInCamel.test.dhall
, toTextInPascal = ./toTextInPascal.test.dhall
, toTextInSnake = ./toTextInSnake.test.dhall
}
