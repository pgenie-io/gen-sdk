let subj = ./toTextInSnake.dhall

in  { multiSegment =
          assert
        :     subj
                [ { firstChar = "h", otherChars = "ello" }
                , { firstChar = "w", otherChars = "orld" }
                , { firstChar = "e", otherChars = "xample" }
                ]
          ===  "hello_world_example"
    , singleSegment =
        assert : subj [ { firstChar = "t", otherChars = "est" } ] === "test"
    , emptyName =
        assert : subj ([] : List { firstChar : Text, otherChars : Text }) === ""
    , specialChars =
          assert
        :     subj
                [ { firstChar = "a", otherChars = "pi" }
                , { firstChar = "v", otherChars = "2" }
                , { firstChar = "u", otherChars = "ser" }
                ]
          ===  "api_v2_user"
    }
