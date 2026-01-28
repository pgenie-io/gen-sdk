let Sdk = ./package.dhall

let Config = { foo : Text, bar : Natural }

in  Sdk.module
      { major = 1, minor = 0 }
      Config
      ( \(config : Config) ->
        \(project : Sdk.Project.Project) ->
          Sdk.Compiled.ok
            (List Sdk.File.Type)
            [ { path = "output.txt"
              , content =
                  ''
                  foo: ${config.foo}
                  bar: ${Natural/show config.bar}
                  ''
              }
            ]
      )
