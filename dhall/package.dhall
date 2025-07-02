let Prelude =
      https://prelude.dhall-lang.org/v23.1.0/package.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

let Result =
      \(Failure : Type) ->
      \(Success : Type) ->
        < Failure : Failure | Success : Success >

let Json = Prelude.JSON.Type

let JsonPath = List Text

let JsonParsingError = { path : JsonPath, message : Text }

let JsonParser =
      \(res : Type) -> JsonPath -> Json -> Result JsonParsingError res

let Name = List Text

let Version = { major : Natural, minor : Natural, patch : Natural }

let Project = { name : Name, version : Version }

let Map = Prelude.Map.Type

let GeneratedFiles = Map Text Text

let Gen =
      \(config : Type) ->
        { parseConfig : JsonParser config
        , generate : config -> Project -> Result Text GeneratedFiles
        }

in  { Gen, JsonPath, Name, Version, JsonParsingError, Project, JsonParser }
