{-
Tests for toTextInKebab function
Converts to kebab-case (e.g., "hello-world")
-}
let Self = ./Type.dhall

let toTextInKebab = ./toTextInKebab.dhall

let testName
    : Self
    = [ { firstChar = "H", otherChars = "ello" }
      , { firstChar = "W", otherChars = "orld" }
      , { firstChar = "E", otherChars = "xample" }
      ]

let singleSegmentName
    : Self
    = [ { firstChar = "T", otherChars = "est" } ]

let emptyName
    : Self
    = [] : Self

let specialCharsName
    : Self
    = [ { firstChar = "A", otherChars = "PI" }
      , { firstChar = "V", otherChars = "2" }
      , { firstChar = "U", otherChars = "ser" }
      ]

let testToTextInKebab =
      assert : toTextInKebab testName === "hello-world-example"

let testToTextInKebabSingle =
      assert : toTextInKebab singleSegmentName === "test"

let testToTextInKebabEmpty = assert : toTextInKebab emptyName === ""

let testSpecialCharsKebab =
      assert : toTextInKebab specialCharsName === "aPI-v2-user"

in  { testToTextInKebab
    , testToTextInKebabSingle
    , testToTextInKebabEmpty
    , testSpecialCharsKebab
    }
