let Self = ./Type.dhall

let Prelude = ./Prelude.dhall

let Char = ./Char/package.dhall

in  \(self : Self) ->
          Char.toTextInUpper self.head
      ++  Prelude.Text.concatMap Char.Type Char.toTextInLower self.tail
