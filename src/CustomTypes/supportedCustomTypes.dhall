let Contract = ../Deps/Contract.dhall

let Prelude = ../Deps/Prelude.dhall

let foldl = ./foldl.dhall

let optionalIndex =
      \(xs : List Bool) ->
      \(i : Natural) ->
        Prelude.Optional.fold Bool (Prelude.List.index i Bool xs) Bool (\(b : Bool) -> b) False

let valueIsSupported =
      \(supportedSoFar : List Bool) ->
      \(value : Contract.Value) ->
        merge
          { Primitive = \(_ : Contract.Primitive) -> True
          , Custom =
              \(ref : Contract.CustomTypeRef) -> optionalIndex supportedSoFar ref.index
          }
          value.scalar

let definitionOwnDepsSupported =
      \(supportedSoFar : List Bool) ->
      \(definition : Contract.CustomTypeDefinition) ->
        merge
          { Composite =
              \(members : List Contract.Member) ->
                Prelude.List.all
                  Contract.Member
                  (\(member : Contract.Member) -> valueIsSupported supportedSoFar member.value)
                  members
          , Enum = \(_ : List Contract.EnumVariant) -> True
          , Domain = \(value : Contract.Value) -> valueIsSupported supportedSoFar value
          }
          definition

let supportedCustomTypes
    : (Contract.CustomTypeDefinition -> Bool) ->
      List Contract.CustomType ->
      List Bool
    = \(kindIsSupported : Contract.CustomTypeDefinition -> Bool) ->
      \(customTypes : List Contract.CustomType) ->
        foldl
          Contract.CustomType
          customTypes
          (List Bool)
          ( \(supportedSoFar : List Bool) ->
            \(customType : Contract.CustomType) ->
                supportedSoFar
              # [     kindIsSupported customType.definition
                  &&  definitionOwnDepsSupported supportedSoFar customType.definition
                ]
          )
          ([] : List Bool)

in  supportedCustomTypes