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

let GenerationError = { path : List Text, message : Text }

let Map = Prelude.Map.Type

let GeneratedFiles = Map Text Text

let Gen =
      \(config : Type) ->
        { configParser : JsonPath -> Json -> Result JsonParsingError config
        , generate : config -> Project -> Result GenerationError GeneratedFiles
        }

let GenError = < Config : JsonParsingError | Generation : GenerationError >

let GenResult = Result GenError GeneratedFiles

let runGen
    : forall (Config : Type) -> Gen Config -> Json -> Project -> GenResult
    = \(Config : Type) ->
      \(gen : Gen Config) ->
      \(configJson : Json) ->
      \(project : Project) ->
        merge
          { Failure =
              \(err : JsonParsingError) ->
                GenResult.Failure (GenError.Config err)
          , Success =
              \(config : Config) ->
                merge
                  { Failure =
                      \(err : GenerationError) ->
                        GenResult.Failure (GenError.Generation err)
                  , Success =
                      \(files : GeneratedFiles) -> GenResult.Success files
                  }
                  (gen.generate config project)
          }
          (gen.configParser ([] : JsonPath) configJson)

in  { Result
    , JsonPath
    , Json
    , JsonParsingError
    , JsonParser
    , GenerationError
    , GenError
    , GenResult
    , Gen
    , runGen
    , GeneratedFiles
    , Name
    , Version
    , Project
    }
