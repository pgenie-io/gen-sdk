{-
# Segment Tests

Tests for the Segment module functions:
- `toTextInLower`: Converts segment to lowercase text
- `toTextInUpper`: Converts segment to uppercase first letter text

Test cases include:
- Regular segments with multiple characters
- Single character segments
- Segments with numbers and special characters

## Test Structure

All tests use Dhall's `assert` mechanism, which will fail compilation if any assertion is false. This provides compile-time verification that all functions work correctly.
-}
{ toTextInLower = ./toTextInLower.test.dhall
, toTextInUpper = ./toTextInUpper.test.dhall
}
