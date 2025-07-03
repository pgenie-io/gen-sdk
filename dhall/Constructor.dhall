-- Package for construction of generators.
-- Has separate versioning from the interface.
let Prelude = ./Prelude.dhall

let Result = ./Result.dhall

let ProjectModel = ./ProjectModel.dhall

let JsonPath = ./JsonPath.dhall

let Json = Prelude.JSON.Type

let JsonParsingError = { path : JsonPath.Type, message : Text }

let GenerationError = { path : List Text, message : Text }

let GeneratedFiles = Prelude.Map.Type Text Text

let Params =
      \(Config : Type) ->
        { parseConfig : Json -> Result.Type JsonParsingError Config
        , generate :
            Config ->
            ProjectModel.Project ->
              Result.Type GenerationError GeneratedFiles
        }

let GenError = < Config : JsonParsingError | Generation : GenerationError >

let GenResult = Result.Type GenError GeneratedFiles

let Gen = Json -> ProjectModel.Project -> GenResult

let construct
    : forall (Config : Type) -> Params Config -> Gen
    = \(Config : Type) ->
      \(params : Params Config) ->
      \(configJson : Json) ->
      \(project : ProjectModel.Project) ->
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
                  (params.generate config project)
          }
          (params.parseConfig configJson)

in  forall (Config : Type) -> Params Config -> Gen
