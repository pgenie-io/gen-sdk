let Word = ./Word/package.dhall

let WordOrNumber = ./WordOrNumber/package.dhall

in  { head : Word.Type, tail : List WordOrNumber.Type }
