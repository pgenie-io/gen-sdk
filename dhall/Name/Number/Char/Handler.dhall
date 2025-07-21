\(Result : Type) ->
\(defaultResult : Result) ->
  let Self =
        { Zero : Result
        , One : Result
        , Two : Result
        , Three : Result
        , Four : Result
        , Five : Result
        , Six : Result
        , Seven : Result
        , Eight : Result
        , Nine : Result
        }

  let default =
        { Zero = defaultResult
        , One = defaultResult
        , Two = defaultResult
        , Three = defaultResult
        , Four = defaultResult
        , Five = defaultResult
        , Six = defaultResult
        , Seven = defaultResult
        , Eight = defaultResult
        , Nine = defaultResult
        }

  in  { Type = Self, default }
