let Prelude = ../../dhall/Prelude.dhall

let Sdk = ../../dhall/package.dhall

let Config = { foo : Text, bar : Optional Natural }

in  Sdk.module
      { major = 1, minor = 0 }
      Config
      ( \(config : Config) ->
        \(project : Sdk.Project.Project) ->
          Sdk.Compiled.ok
            (List Sdk.File.Type)
            [ { path = "output.yaml"
              , content =
                  ''
                  config:
                    foo: ${config.foo}
                    bar: ${Prelude.Optional.fold
                             Natural
                             config.bar
                             Text
                             Natural/show
                             "null"}
                  ''
              }
            ]
      )
