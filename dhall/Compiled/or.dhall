let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/Type.dhall

let Result = ./Result/Type.dhall

in  \(A : Type) ->
    \(left : Compiled A) ->
    \(right : Compiled A) ->
      merge
        { Ok = \(leftResult : A) -> left
        , Err =
            \(err : Report) ->
              { warnings = left.warnings # right.warnings
              , result = right.result
              }
        }
        left.result
