{-
# Segment Tests

Tests for the Segment module functions are now in dedicated test files.
Each test file imports the function and tests it externally.

To run tests for individual functions:
- dhall --file=dhall/Name/Segment/toTextInLower.test.dhall
- dhall --file=dhall/Name/Segment/toTextInUpper.test.dhall

This aggregator imports all test files to run them together.
-}
{ toTextInLower = ./toTextInLower.test.dhall
, toTextInUpper = ./toTextInUpper.test.dhall
}
