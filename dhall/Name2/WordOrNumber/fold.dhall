let Self = ./Type.dhall

let Prelude = ./Prelude.dhall

let Number = ../Number/package.dhall

let Word = ../Word/package.dhall

in  \(Out : Type) ->
    \(fromWord : Word.Type -> Out) ->
    \(fromNumber : Number.Type -> Out) ->
    \(self : Self) ->
      merge { Word = fromWord, Number = fromNumber } self
