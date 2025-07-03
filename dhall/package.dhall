let Prelude =
      https://prelude.dhall-lang.org/v23.1.0/package.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

let Result = ./Result.dhall

let Json = Prelude.JSON.Type

let JsonPath = List Text

let JsonParsingError = { path : JsonPath, message : Text }

let Name = (./Name/package.dhall).Type

let Version = { major : Natural, minor : Natural, patch : Natural }

let Project = { name : Name, version : Version }

let GenerationError = { path : List Text, message : Text }

let Map = Prelude.Map.Type

let GeneratedFiles = Map Text Text

let GenParams =
      \(config : Type) ->
        { parseConfig : Json -> Result.Type JsonParsingError config
        , generate :
            config -> Project -> Result.Type GenerationError GeneratedFiles
        }

let GenError = < Config : JsonParsingError | Generation : GenerationError >

let GenResult = Result.Type GenError GeneratedFiles

let Gen = Json -> Project -> GenResult

let construct
    : forall (Config : Type) -> GenParams Config -> Gen
    = \(Config : Type) ->
      \(gen : GenParams Config) ->
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
          (gen.parseConfig configJson)

in  { Json
    , JsonParsingError
    , JsonPath
    , GenerationError
    , GeneratedFiles
    , GenError
    , GenResult
    , GenParams
    , Gen
    , construct
    , Name
    , Version
    , Project
    }
