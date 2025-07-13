let Prelude = ./Prelude.dhall

let Project = ./ProjectModel.dhall

let Warning =
      < UnsupportedType : { type : Project.Value, query : Project.Query } >

let File = { path : Text, content : Text }

let Result =
      < Failure | Success : { warnings : List Warning, files : List File } >

let Gen
    : Type -> Type
    = \(Config : Type) -> Config -> Project.Project -> Result

in  { Project, Warning, File, Result, Gen }
