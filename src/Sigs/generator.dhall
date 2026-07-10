let Contract = ../Deps/Contract.dhall

in  \(Config : Type) ->
    \(defaultConfig : Config) ->
    \(interpret : Config -> Contract.Project -> Contract.Output) ->
      let compile =
            \(config : Optional Config) ->
              merge { None = interpret defaultConfig, Some = interpret } config

      in  Contract.module Config compile
