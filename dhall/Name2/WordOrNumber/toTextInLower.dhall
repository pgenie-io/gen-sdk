let Self = ./Type.dhall

let Prelude = ./Prelude.dhall

let Number = ../Number/package.dhall

let Word = ../Word/package.dhall

in  \(self : Self) ->
      merge { Word = Word.toTextInLower, Number = Number.toText } self
