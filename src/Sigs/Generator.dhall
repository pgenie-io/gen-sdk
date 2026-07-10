let Contract = ../Deps/Contract.dhall

let module =
      \(Config : Type) ->
      \(defaultConfig : Config) ->
      \(interpret : Config -> Contract.Project -> Contract.Output) ->
        let compile =
              \(config : Optional Config) ->
                merge
                  { None = interpret defaultConfig, Some = interpret }
                  config

        in    { contractVersion = Contract.contractVersion, compile }
            : Contract.Generator Config

in  { module }
