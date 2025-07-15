let Self = ./Type.dhall

in  \(left : Self) ->
    \(right : Self) ->
      merge
        { Zero =
            merge
              { Zero = True
              , One = False
              , Two = False
              , Three = False
              , Four = False
              , Five = False
              , Six = False
              , Seven = False
              , Eight = False
              , Nine = False
              }
              right
        , One =
            merge
              { Zero = False
              , One = True
              , Two = False
              , Three = False
              , Four = False
              , Five = False
              , Six = False
              , Seven = False
              , Eight = False
              , Nine = False
              }
              right
        , Two =
            merge
              { Zero = False
              , One = False
              , Two = True
              , Three = False
              , Four = False
              , Five = False
              , Six = False
              , Seven = False
              , Eight = False
              , Nine = False
              }
              right
        , Three =
            merge
              { Zero = False
              , One = False
              , Two = False
              , Three = True
              , Four = False
              , Five = False
              , Six = False
              , Seven = False
              , Eight = False
              , Nine = False
              }
              right
        , Four =
            merge
              { Zero = False
              , One = False
              , Two = False
              , Three = False
              , Four = True
              , Five = False
              , Six = False
              , Seven = False
              , Eight = False
              , Nine = False
              }
              right
        , Five =
            merge
              { Zero = False
              , One = False
              , Two = False
              , Three = False
              , Four = False
              , Five = True
              , Six = False
              , Seven = False
              , Eight = False
              , Nine = False
              }
              right
        , Six =
            merge
              { Zero = False
              , One = False
              , Two = False
              , Three = False
              , Four = False
              , Five = False
              , Six = True
              , Seven = False
              , Eight = False
              , Nine = False
              }
              right
        , Seven =
            merge
              { Zero = False
              , One = False
              , Two = False
              , Three = False
              , Four = False
              , Five = False
              , Six = False
              , Seven = True
              , Eight = False
              , Nine = False
              }
              right
        , Eight =
            merge
              { Zero = False
              , One = False
              , Two = False
              , Three = False
              , Four = False
              , Five = False
              , Six = False
              , Seven = False
              , Eight = True
              , Nine = False
              }
              right
        , Nine =
            merge
              { Zero = False
              , One = False
              , Two = False
              , Three = False
              , Four = False
              , Five = False
              , Six = False
              , Seven = False
              , Eight = False
              , Nine = True
              }
              right
        }
        left
