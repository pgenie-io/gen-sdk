let Self = ./Type.dhall

let Prelude = ../Prelude.dhall

let Segment = ./Segment/package.dhall

let def =
      \(self : Self) ->
        merge
          { Some =
              \(head : Segment.Type) ->
                let tail = Prelude.List.drop 1 Segment.Type self

                let tailMapped =
                      Prelude.List.map
                        Segment.Type
                        Text
                        Segment.toTextInUpper
                        tail

                in  Segment.toTextInLower head ++ Prelude.Text.concat tailMapped
          , None = ""
          }
          (Prelude.List.head Segment.Type self)

let test =
      let multiSegment =
              assert
            :     def
                    [ { firstChar = "H", otherChars = "ello" }
                    , { firstChar = "W", otherChars = "orld" }
                    , { firstChar = "E", otherChars = "xample" }
                    ]
              ===  "helloWorldExample"

      let singleSegment =
            assert : def [ { firstChar = "T", otherChars = "est" } ] === "test"

      let emptyName = assert : def ([] : Self) === ""

      let specialChars =
              assert
            :     def
                    [ { firstChar = "a", otherChars = "pi" }
                    , { firstChar = "v", otherChars = "2" }
                    , { firstChar = "u", otherChars = "ser" }
                    ]
              ===  "apiV2User"

      in  {}

in  def
