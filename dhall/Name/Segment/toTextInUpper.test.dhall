{-
Tests for toTextInUpper function
Converts segment to uppercase first letter text
-}
let Self = ./Type.dhall

let toTextInUpper = ./toTextInUpper.dhall

let testSegment
    : Self
    = { firstChar = "H", otherChars = "ello" }

let testEmptyOtherChars
    : Self
    = { firstChar = "A", otherChars = "" }

let testSpecialChars
    : Self
    = { firstChar = "1", otherChars = "23abc" }

let testToTextInUpper = assert : toTextInUpper testSegment === "Hello"

let testToTextInUpperSingle = assert : toTextInUpper testEmptyOtherChars === "A"

let testToTextInUpperSpecial =
      assert : toTextInUpper testSpecialChars === "123abc"

in  { testToTextInUpper, testToTextInUpperSingle, testToTextInUpperSpecial }
