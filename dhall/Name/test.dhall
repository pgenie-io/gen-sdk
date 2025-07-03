{-
# Name Tests

This directory contains comprehensive tests for the Name module.

## Running Tests

To run all tests:
```bash
dhall --file=dhall/Name/test.dhall
```

## Test Coverage

### Name Tests

Tests for the Name module functions:
- `toTextInKebab`: Converts to kebab-case (e.g., "hello-world")
- `toTextInCamel`: Converts to camelCase (e.g., "helloWorld")
- `toTextInPascal`: Converts to PascalCase (e.g., "HelloWorld")
- `toTextInSnake`: Converts to snake_case (e.g., "hello_world")

Test cases include:
- Multi-segment names
- Single segment names
- Empty names
- Names with mixed case and numbers

## Test Structure

All tests use Dhall's `assert` mechanism, which will fail compilation if any assertion is false. This provides compile-time verification that all functions work correctly.

The test suite is organized as:
- Individual test files for each function
- A main `test.dhall` file that imports and runs all tests
- Clear test naming and comprehensive coverage of edge cases

## Example Test Results

When run successfully, the test suite will output a record showing all assertions passed:

```dhall
{ segment = { /* all segment function tests */ }
, /* all name function tests */
}
```
-}
{ segment = ./Segment/test.dhall
, toTextInKebab = ./toTextInKebab.test.dhall
, toTextInCamel = ./toTextInCamel.test.dhall
, toTextInPascal = ./toTextInPascal.test.dhall
, toTextInSnake = ./toTextInSnake.test.dhall
}
