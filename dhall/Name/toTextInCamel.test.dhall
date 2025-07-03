{-
Tests for toTextInCamel function
Converts to camelCase (e.g., "helloWorld")
-}
let Self = ./Type.dhall

let toTextInCamel = ./toTextInCamel.dhall

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

let testToTextInCamel = assert : toTextInCamel testName === "helloWorldExample"

let testToTextInCamelSingle =
      assert : toTextInCamel singleSegmentName === "test"

let testToTextInCamelEmpty = assert : toTextInCamel emptyName === ""

let testSpecialCharsCamel =
      assert : toTextInCamel specialCharsName === "aPIV2User"

in  { testToTextInCamel
    , testToTextInCamelSingle
    , testToTextInCamelEmpty
    , testSpecialCharsCamel
    }
