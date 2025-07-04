let Number = ../Number/package.dhall

let Word = ../Word/package.dhall

in  ./fold.dhall Text Word.toTextInUpper Number.toText
