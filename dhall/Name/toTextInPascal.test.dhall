{-
Tests for toTextInPascal function
Converts to PascalCase (e.g., "HelloWorld")
-}
let Self = ./Type.dhall

let toTextInPascal = ./toTextInPascal.dhall

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

let testToTextInPascal =
      assert : toTextInPascal testName === "HelloWorldExample"

let testToTextInPascalSingle =
      assert : toTextInPascal singleSegmentName === "Test"

let testToTextInPascalEmpty = assert : toTextInPascal emptyName === ""

let testSpecialCharsPascal =
      assert : toTextInPascal specialCharsName === "APIV2User"

in  { testToTextInPascal
    , testToTextInPascalSingle
    , testToTextInPascalEmpty
    , testSpecialCharsPascal
    }
