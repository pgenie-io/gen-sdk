-- A demonstration of an adapter.
let Prelude =
      https://prelude.dhall-lang.org/v23.1.0/package.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

let Gen = ./package.dhall

let Result = ./Result.dhall

let Config = Natural

let gen
    : Gen.Gen
    = Gen.compileGen
        Config
        { parseConfig =
            \(json : Gen.Json) ->
              (Result.Type Gen.JsonParsingError Config).Success 0
        , generate =
            \(config : Config) ->
            \(project : Gen.Project) ->
              (Result.Type Gen.GenerationError Gen.GeneratedFiles).Success
                [ { mapKey = "file.txt"
                  , mapValue = "This is a generated file."
                  }
                ]
        }

in  gen
