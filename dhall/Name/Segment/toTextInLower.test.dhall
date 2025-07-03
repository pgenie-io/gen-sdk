{-
Tests for toTextInLower function
Converts segment to lowercase text
-}
let Self = ./Type.dhall

let toTextInLower = ./toTextInLower.dhall

let testSegment
    : Self
    = { firstChar = "H", otherChars = "ello" }

let testEmptyOtherChars
    : Self
    = { firstChar = "A", otherChars = "" }

let testSpecialChars
    : Self
    = { firstChar = "1", otherChars = "23abc" }

let testToTextInLower = assert : toTextInLower testSegment === "hello"

let testToTextInLowerSingle = assert : toTextInLower testEmptyOtherChars === "a"

let testToTextInLowerSpecial =
      assert : toTextInLower testSpecialChars === "123abc"

in  { testToTextInLower, testToTextInLowerSingle, testToTextInLowerSpecial }
