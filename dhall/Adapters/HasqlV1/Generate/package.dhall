let Prelude = ../Prelude.dhall

let Gen = ../../../Gen.dhall

let Project = Gen.Project

let Config = ../Config.dhall

let Package = ./Package/package.dhall

let generate
    : Gen.Generate Config
    = \(config : Config) ->
      \(project : Project.Project) ->
        let files = Package.compile project

        in  Gen.Result.Success { warnings = [] : List Gen.Warning, files }

in  generate
