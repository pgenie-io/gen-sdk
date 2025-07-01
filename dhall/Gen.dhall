let Prelude = ./Prelude.dhall

let types = ./types.dhall

let Result =
      \(Failure : Type) ->
      \(Success : Type) ->
        < Failure : Failure | Success : Success >

let Json = Prelude.JSON.Type

let JsonPath = List Text

let ParsingError = { message : Text, path : JsonPath }

let JsonParser = \(res : Type) -> JsonPath -> Json -> Result ParsingError res

let Map = Prelude.Map.Type

let GeneratedFiles = Map Text Text

in  \(config : Type) ->
      { parseConfig : Json -> Result Text config
      , generate : config -> types.Project -> Result Text GeneratedFiles
      }
