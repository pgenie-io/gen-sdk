let Self = ./Type.dhall

let Prelude = ./Prelude.dhall

let Char = ./Char/package.dhall

let NameSegment = ../../Name/Segment/package.dhall

in  \(self : Self) ->
        { firstChar = Char.toText self.head
        , otherChars = Prelude.Text.concatMap Char.Type Char.toText self.tail
        }
      : NameSegment.Type
