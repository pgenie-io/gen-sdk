let Self = ./Type.dhall

let Prelude = ./Prelude.dhall

let Word = ./Word/package.dhall

let WordOrNumber = ./WordOrNumber/package.dhall

let NameSegment = ../Name/Segment/package.dhall

let Name = ../Name/package.dhall

in  \(self : Self) ->
      let head = Word.toNameSegment self.head

      let tail =
            Prelude.List.map
              WordOrNumber.Type
              NameSegment.Type
              WordOrNumber.toNameSegment
              self.tail

      in  [ head ] # tail : Name.Type
