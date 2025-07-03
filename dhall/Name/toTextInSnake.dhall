let Self = ./Type.dhall

let Prelude = ../Prelude.dhall

let Segment = ./Segment/package.dhall

let def =
      \(self : Self) ->
        Prelude.Text.concatSep
          "_"
          (Prelude.List.map Segment.Type Text Segment.toTextInLower self)

let test =
      let multiSegment =
              assert
            :     def
                    [ { firstChar = "H", otherChars = "ello" }
                    , { firstChar = "W", otherChars = "orld" }
                    , { firstChar = "E", otherChars = "xample" }
                    ]
              ===  "hello_world_example"

      let singleSegment =
            assert : def [ { firstChar = "T", otherChars = "est" } ] === "test"

      let emptyName = assert : def ([] : Self) === ""

      let specialChars =
              assert
            :     def
                    [ { firstChar = "A", otherChars = "PI" }
                    , { firstChar = "V", otherChars = "2" }
                    , { firstChar = "U", otherChars = "ser" }
                    ]
              ===  "aPI_v2_user"

      in  {}

in  def
