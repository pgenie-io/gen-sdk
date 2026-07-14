let Contract = ../Deps/Contract.dhall

let Prelude = ../Deps/Prelude.dhall

let CustomTypeIsSupported = ./customTypeIsSupported.dhall

let valueIsSupported =
      \(supported : List Bool) ->
      \(value : Contract.Value) ->
        merge
          { Primitive = \(_ : Contract.Primitive) -> True
          , Custom = CustomTypeIsSupported supported
          }
          value.scalar

let memberIsSupported =
      \(supported : List Bool) ->
      \(member : Contract.Member) ->
        valueIsSupported supported member.value

let queryIsSupported
    : List Bool -> Contract.Query -> Bool
    = \(supported : List Bool) ->
      \(query : Contract.Query) ->
            Prelude.List.all
              Contract.Member
              (memberIsSupported supported)
              query.params
        &&  merge
              { Void = True
              , RowsAffected = True
              , Rows =
                  \(rows : Contract.ResultRows) ->
                    Prelude.List.all
                      Contract.Member
                      (memberIsSupported supported)
                      (Prelude.NonEmpty.toList Contract.Member rows.columns)
              }
              query.result

in  queryIsSupported
