-- Function checking whether the first digit is less than the second.
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
              right
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
              right
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
              right
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
              right
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
              right
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
              right
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
              , Seven = False
              , Eight = True
              , Nine = True
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
              , Eight = False
              , Nine = True
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
              , Nine = False
              }
              right
        }
        left
