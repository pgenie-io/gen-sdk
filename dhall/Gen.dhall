let Prelude = ./Prelude.dhall

let Project = ./ProjectModel.dhall

let Warning =
      < UnsupportedType : { value : Project.Value, query : Project.Query }
      | Other : Text
      >

let File = { path : Text, content : Text }

let Result =
      < Failure : Text
      | Success : { warnings : List Warning, files : List File }
      >

let Generate
    : Type -> Type
    = \(Config : Type) -> Config -> Project.Project -> Result

let Gen =
      \(Config : Type) ->
      \(generate : Generate Config) ->
        { Config, Project, generate }

in  { Project, Warning, File, Result, Generate, Gen }
