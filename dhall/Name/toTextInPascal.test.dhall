let subj = ./toTextInPascal.dhall

in  { multiSegment =
          assert
        :     subj
                [ { firstChar = "H", otherChars = "ello" }
                , { firstChar = "W", otherChars = "orld" }
                , { firstChar = "E", otherChars = "xample" }
                ]
          ===  "HelloWorldExample"
    , singleSegment =
        assert : subj [ { firstChar = "T", otherChars = "est" } ] === "Test"
    , emptyName =
        assert : subj ([] : List { firstChar : Text, otherChars : Text }) === ""
    , specialChars =
          assert
        :     subj
                [ { firstChar = "A", otherChars = "PI" }
                , { firstChar = "V", otherChars = "2" }
                , { firstChar = "U", otherChars = "ser" }
                ]
          ===  "APIV2User"
    }
