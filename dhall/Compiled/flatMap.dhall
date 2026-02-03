let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/Type.dhall

let Result = ./Result/Type.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(f : A -> Compiled B) ->
    \(a : Compiled A) ->
      merge
        { Ok =
            \(aResult : A) ->
              let b = f aResult

              in  { warnings = a.warnings # b.warnings, result = b.result }
        , Err =
            \(err : Report) ->
              { warnings = a.warnings, result = (Result B).Err err }
        }
        a.result
      : Compiled B
