let Self = ./Type.dhall

let Prelude = ../Prelude.dhall

let Segment = ./Segment/package.dhall

in  \(self : Self) ->
      let segments =
            Prelude.List.map Segment.Type Text Segment.toTextInUpper self

      in  Prelude.Text.concat segments
