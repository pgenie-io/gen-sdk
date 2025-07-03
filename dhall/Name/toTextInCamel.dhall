let Self = ./Type.dhall

let Prelude = ../Prelude.dhall

let Segment = ./Segment/package.dhall

in  \(self : Self) ->
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
