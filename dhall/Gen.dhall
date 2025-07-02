let Prelude = ./Prelude.dhall

let Result = ./Result.dhall

let Map = Prelude.Map.Type

let GeneratedFiles = Map Text Text

in  \(config : Type) ->
      { parseConfig : ./JsonParser.dhall config
      , generate : config -> ./Project.dhall -> Result Text GeneratedFiles
      }
