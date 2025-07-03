let subj = ./toTextInSnake.dhall

in  { multiSegment =
          assert
        :     subj
                [ { firstChar = "H", otherChars = "ello" }
                , { firstChar = "W", otherChars = "orld" }
                , { firstChar = "E", otherChars = "xample" }
                ]
          ===  "hello_world_example"
    , singleSegment =
        assert : subj [ { firstChar = "T", otherChars = "est" } ] === "test"
    , emptyName =
        assert : subj ([] : List { firstChar : Text, otherChars : Text }) === ""
    , specialChars =
          assert
        :     subj
                [ { firstChar = "A", otherChars = "PI" }
                , { firstChar = "V", otherChars = "2" }
                , { firstChar = "U", otherChars = "ser" }
                ]
          ===  "api_v2_user"
    }
