-- Analogue to Haskell's `liftA2`
let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/Type.dhall

let Result = ./Result/Type.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(C : Type) ->
    \(f : A -> B -> C) ->
    \(a : Compiled A) ->
    \(b : Compiled B) ->
      { warnings = a.warnings # b.warnings
      , result =
          merge
            { Ok =
                \(aVal : A) ->
                  merge
                    { Ok = \(bVal : B) -> (Result C).Ok (f aVal bVal)
                    , Err = (Result C).Err
                    }
                    b.result
            , Err = (Result C).Err
            }
            a.result
      }
