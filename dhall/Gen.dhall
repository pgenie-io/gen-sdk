let types = ./types.dhall

let Result =
      \(Failure : Type) ->
      \(Success : Type) ->
        < Failure : Failure | Success : Success >

let Json =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v23.1.0/Prelude/JSON/Type.dhall

let JsonPath = List Text

let ParsingError = { message : Text, path : JsonPath }

let JsonParser = \(res : Type) -> JsonPath -> Json -> Result ParsingError res

let Map =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v23.1.0/Prelude/Map/Type.dhall

let GeneratedFiles = Map Text Text

in  \(config : Type) ->
      { parseConfig : Json -> Result Text config
      , generate : config -> types.Project -> Result Text GeneratedFiles
      }
