let Self = ./Type.dhall

let Prelude = ./Prelude.dhall

let Word = ./Word/package.dhall

let WordOrNumber = ./WordOrNumber/package.dhall

in  \(self : Self) ->
          Word.toTextInUpper self.head
      ++  Prelude.Text.concatMap
            WordOrNumber.Type
            WordOrNumber.toTextInUpper
            self.tail
