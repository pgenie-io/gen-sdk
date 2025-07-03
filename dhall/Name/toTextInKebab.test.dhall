let subj = ./toTextInKebab.dhall

in  { multiSegment =
          assert
        :     subj
                [ { firstChar = "H", otherChars = "ello" }
                , { firstChar = "W", otherChars = "orld" }
                , { firstChar = "E", otherChars = "xample" }
                ]
          ===  "hello-world-example"
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
          ===  "api-v2-user"
    }
