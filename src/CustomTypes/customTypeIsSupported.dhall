let Contract = ../Deps/Contract.dhall

let Prelude = ../Deps/Prelude.dhall

let customTypeIsSupported
    : List Bool -> Contract.CustomTypeRef -> Bool
    = \(supported : List Bool) ->
      \(ref : Contract.CustomTypeRef) ->
        Prelude.Optional.fold
          Bool
          (Prelude.List.index ref.index Bool supported)
          Bool
          (\(b : Bool) -> b)
          False

in  customTypeIsSupported
