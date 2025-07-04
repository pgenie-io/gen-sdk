let Number = ../Number/package.dhall

let Word = ../Word/package.dhall

in  ./fold.dhall Text Word.toTextInLower Number.toText
