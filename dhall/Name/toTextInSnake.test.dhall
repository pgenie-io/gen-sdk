{-
Tests for toTextInSnake function
Converts to snake_case (e.g., "hello_world")
-}
let Self = ./Type.dhall

let toTextInSnake = ./toTextInSnake.dhall

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

let testToTextInSnake =
      assert : toTextInSnake testName === "hello_world_example"

let testToTextInSnakeSingle =
      assert : toTextInSnake singleSegmentName === "test"

let testToTextInSnakeEmpty = assert : toTextInSnake emptyName === ""

let testSpecialCharsSnake =
      assert : toTextInSnake specialCharsName === "aPI_v2_user"

in  { testToTextInSnake
    , testToTextInSnakeSingle
    , testToTextInSnakeEmpty
    , testSpecialCharsSnake
    }
