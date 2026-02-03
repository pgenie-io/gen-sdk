let Result = ./Type.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(f : A -> B) ->
    \(result : Result A) ->
      merge
        { Ok = \(a : A) -> (Result B).Ok (f a), Err = (Result B).Err }
        result
      : Result B
