let Self = ./Type.dhall

let Prelude = ../Prelude.dhall

let Segment = ./Segment/package.dhall

let def =
      \(self : Self) ->
        let segments =
              Prelude.List.map Segment.Type Text Segment.toTextInUpper self

        in  Prelude.Text.concat segments

let test =
      let multiSegment =
              assert
            :     def
                    [ { firstChar = "H", otherChars = "ello" }
                    , { firstChar = "W", otherChars = "orld" }
                    , { firstChar = "E", otherChars = "xample" }
                    ]
              ===  "HelloWorldExample"

      let singleSegment =
            assert : def [ { firstChar = "T", otherChars = "est" } ] === "Test"

      let emptyName = assert : def ([] : Self) === ""

      let specialChars =
              assert
            :     def
                    [ { firstChar = "A", otherChars = "PI" }
                    , { firstChar = "V", otherChars = "2" }
                    , { firstChar = "U", otherChars = "ser" }
                    ]
              ===  "APIV2User"

      in  {}

in  def
