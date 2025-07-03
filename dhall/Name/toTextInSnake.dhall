let Self = ./Type.dhall

let Prelude = ../Prelude.dhall

let Segment = ./Segment/package.dhall

in  \(self : Self) ->
      Prelude.Text.concatSep
        "_"
        (Prelude.List.map Segment.Type Text Segment.toTextInLower self)
