let Contract = ../Deps/Contract.dhall

let Prelude = ../Deps/Prelude.dhall

let foldl = ./foldl.dhall

let Verdict = Optional Contract.CustomTypeRef

let verdictAt =
      \(verdicts : List Verdict) ->
      \(index : Natural) ->
        Prelude.Optional.fold
          Verdict
          (Prelude.List.index index Verdict verdicts)
          Verdict
          (\(v : Verdict) -> v)
          (None Contract.CustomTypeRef)

let valueVerdict =
      \(verdictsSoFar : List Verdict) ->
      \(value : Contract.Value) ->
        merge
          { Primitive = \(_ : Contract.Primitive) -> None Contract.CustomTypeRef
          , Custom =
              \(ref : Contract.CustomTypeRef) ->
                verdictAt verdictsSoFar ref.index
          }
          value.scalar

let firstUnsupported =
      \(verdictsSoFar : List Verdict) ->
      \(values : List Contract.Value) ->
        List/fold
          Contract.Value
          values
          Verdict
          ( \(value : Contract.Value) ->
            \(acc : Verdict) ->
              merge
                { Some = \(rootCause : Contract.CustomTypeRef) -> Some rootCause
                , None = valueVerdict verdictsSoFar value
                }
                acc
          )
          (None Contract.CustomTypeRef)

let supportedCustomTypesReasoned
    : (Contract.CustomTypeDefinition -> Bool) ->
      List Contract.CustomType ->
        List Verdict
    = \(kindIsSupported : Contract.CustomTypeDefinition -> Bool) ->
      \(customTypes : List Contract.CustomType) ->
        foldl
          Contract.CustomType
          customTypes
          (List Verdict)
          ( \(verdictsSoFar : List Verdict) ->
            \(customType : Contract.CustomType) ->
              let selfCause =
                    Some
                      { name = customType.name
                      , pgSchema = customType.pgSchema
                      , pgName = customType.pgName
                      , index = Prelude.List.length Verdict verdictsSoFar
                      }

              in    verdictsSoFar
                  # [ if    kindIsSupported customType.definition == False
                      then  selfCause
                      else  merge
                              { Composite =
                                  \(members : List Contract.Member) ->
                                    firstUnsupported
                                      verdictsSoFar
                                      ( Prelude.List.map
                                          Contract.Member
                                          Contract.Value
                                          (\(m : Contract.Member) -> m.value)
                                          members
                                      )
                              , Enum =
                                  \(_ : List Contract.EnumVariant) ->
                                    None Contract.CustomTypeRef
                              , Domain =
                                  \(value : Contract.Value) ->
                                    valueVerdict verdictsSoFar value
                              }
                              customType.definition
                    ]
          )
          ([] : List Verdict)

in  supportedCustomTypesReasoned
