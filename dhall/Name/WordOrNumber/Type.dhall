let Word = ../Word/package.dhall

let Number = ../Number/package.dhall

in  < Number : Number.Type | Word : Word.Type >
