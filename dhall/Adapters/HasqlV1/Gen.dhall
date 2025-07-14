-- A demonstration of an adapter.
let Prelude =
      https://prelude.dhall-lang.org/v23.1.0/package.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

let Gen = ../Gen.dhall

let Project = Gen.Project

let Name = ../StrictName/package.dhall

let Algebras = ./Algebras/package.dhall

let Module = Algebras.Module.Type

let Config = ./Config.dhall

let Modules = ./Gen/Modules/package.dhall

let Files = ./Gen/Files/package.dhall

let generate
    : Gen.Generate Config
    = \(config : Config) ->
      \(project : Project.Project) ->
        let packageName = Name.toTextInKebab project.name

        let projectNamespace = Name.toTextInPascal project.name

        let statementModules =
              Prelude.List.map
                Project.Query
                Modules.Statement.Output
                ( \(query : Project.Query) ->
                    Modules.Statement.compile { projectNamespace, query }
                )
                project.queries

        let statementsModule =
              Modules.Statements.compile
                { projectNamespace
                , compiledStatementModules = statementModules
                }

        let files
            : List Gen.File
            = let moduleFiles
                  : List Gen.File
                  = let moduleFile =
                          \(x : Module) ->
                            { path = x.path, content = x.content }

                    let statementsFile = moduleFile statementsModule

                    let statementFiles =
                          Prelude.List.map
                            Module
                            Gen.File
                            moduleFile
                            statementModules

                    let unprefixed = [ statementsFile ] # statementFiles

                    in  Prelude.List.map
                          Gen.File
                          Gen.File
                          ( \(x : Gen.File) ->
                              x // { path = "library/${x.path}" }
                          )
                          unprefixed

              let cabalFile
                  : Gen.File
                  = let publicModules = [ statementsModule.namespace ]

                    let privateModules =
                          Prelude.List.map
                            Module
                            Text
                            (\(x : Module) -> x.namespace)
                            statementModules

                    let input = { packageName, publicModules, privateModules }

                    in  Files.Cabal.compile input

              in  [ cabalFile ] # moduleFiles

        in  Gen.Result.Success { warnings = [] : List Gen.Warning, files }

in  Gen.Gen Config generate
