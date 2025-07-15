-- Function checking whether the second digit is less than the first.
let Self = ./Type.dhall

in  \(left : Self) ->
    \(right : Self) ->
      merge
        { Zero =
            merge
              { Zero = False
              , One = True
              , Two = True
              , Three = True
              , Four = True
              , Five = True
              , Six = True
              , Seven = True
              , Eight = True
              , Nine = True
              }
              left
        , One =
            merge
              { Zero = False
              , One = False
              , Two = True
              , Three = True
              , Four = True
              , Five = True
              , Six = True
              , Seven = True
              , Eight = True
              , Nine = True
              }
              left
        , Two =
            merge
              { Zero = False
              , One = False
              , Two = False
              , Three = True
              , Four = True
              , Five = True
              , Six = True
              , Seven = True
              , Eight = True
              , Nine = True
              }
              left
        , Three =
            merge
              { Zero = False
              , One = False
              , Two = False
              , Three = False
              , Four = True
              , Five = True
              , Six = True
              , Seven = True
              , Eight = True
              , Nine = True
              }
              left
        , Four =
            merge
              { Zero = False
              , One = False
              , Two = False
              , Three = False
              , Four = False
              , Five = True
              , Six = True
              , Seven = True
              , Eight = True
              , Nine = True
              }
              left
        , Five =
            merge
              { Zero = False
              , One = False
              , Two = False
              , Three = False
              , Four = False
              , Five = False
              , Six = True
              , Seven = True
              , Eight = True
              , Nine = True
              }
              left
        , Six =
            merge
              { Zero = False
              , One = False
              , Two = False
              , Three = False
              , Four = False
              , Five = False
              , Six = False
              , Seven = True
              , Eight = True
              , Nine = True
              }
              left
        , Seven =
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
              , Nine = True
              }
              left
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
              , Eight = False
              , Nine = True
              }
              left
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
              , Nine = False
              }
              left
        }
        right
