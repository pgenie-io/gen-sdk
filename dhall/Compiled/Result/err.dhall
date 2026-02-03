let Result = ./Type.dhall

let Report = ../Report/Type.dhall

in    ( \(A : Type) ->
        \(path : List Text) ->
        \(message : Text) ->
          (Result A).Err { path, message }
      )
    : forall (A : Type) -> List Text -> Text -> Result A
