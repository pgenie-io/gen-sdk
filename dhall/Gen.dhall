let Prelude = ./Prelude.dhall

let ProjectModel = ./ProjectModel.dhall

let Warning =
      < UnsupportedType :
          { type : ProjectModel.Value, query : ProjectModel.Query }
      >

let GenerationResult =
      < Failure
      | Success :
          { warnings : List Warning
          , generatedFiles : List { path : Text, content : Text }
          }
      >

let Gen =
      forall (Config : Type) ->
        { generate : Config -> ProjectModel.Project -> GenerationResult }

in  { Gen }
