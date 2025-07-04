let Prelude = ./Prelude.dhall

let Char = ./Char/package.dhall

in  Prelude.NonEmpty.Type Char.Type
