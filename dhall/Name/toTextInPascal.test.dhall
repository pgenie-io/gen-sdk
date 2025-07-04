let subj = ./toTextInPascal.dhall

let Name = ./Type.dhall

let Segment = ./Segment/Type.dhall

let seg = ./Segment/fromParts.dhall

in  { multiSegment =
          assert
        :     subj [ seg "h" "ello", seg "w" "orld", seg "e" "xample" ]
          ===  "HelloWorldExample"
    , singleSegment = assert : subj [ seg "T" "est" ] === "Test"
    , emptyName = assert : subj ([] : Name) === ""
    , specialChars =
          assert
        : subj [ seg "a" "pi", seg "v" "2", seg "u" "ser" ] === "ApiV2User"
    }
