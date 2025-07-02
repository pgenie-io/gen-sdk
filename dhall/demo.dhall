-- A demonstration of an adapter.
let Prelude =
      https://prelude.dhall-lang.org/v23.1.0/package.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

let Gen = ./package.dhall

let Result = ./Result.dhall

let Config = {}

let parseConfig
    : Gen.Json -> Result.Type Gen.JsonParsingError Config
    = \(json : Gen.Json) ->
        (Result.Type Gen.JsonParsingError Config).Success {=}

let generate
    : Config ->
      Gen.Project ->
        Result.Type Gen.GenerationError Gen.GeneratedFiles
    = \(config : Config) ->
      \(project : Gen.Project) ->
        (Result.Type Gen.GenerationError Gen.GeneratedFiles).Success
          [ { mapKey = "file.txt", mapValue = "This is a generated file." } ]

in  Gen.construct Config { parseConfig, generate }
