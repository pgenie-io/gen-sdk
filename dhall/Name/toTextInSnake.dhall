let Self = ./Type.dhall

let Prelude = ./Prelude.dhall

let Word = ./Word/package.dhall

let WordOrNumber = ./WordOrNumber/package.dhall

in  \(self : Self) ->
      let headText = Word.toTextInLower self.head

      let tailTexts =
            Prelude.List.map
              WordOrNumber.Type
              Text
              WordOrNumber.toTextInLower
              self.tail

      in  Prelude.Text.concatSep "_" ([ headText ] # tailTexts)
