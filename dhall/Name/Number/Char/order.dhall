let Self = ./Type.dhall

let Classes = ./Classes.dhall

let Comparison = Classes.Order.Comparison

let compare
    : Self -> Self -> Comparison
    = \(left : Self) ->
      \(right : Self) ->
        merge
          { Zero =
              merge
                { Zero = Comparison.Equal
                , One = Comparison.Smaller
                , Two = Comparison.Smaller
                , Three = Comparison.Smaller
                , Four = Comparison.Smaller
                , Five = Comparison.Smaller
                , Six = Comparison.Smaller
                , Seven = Comparison.Smaller
                , Eight = Comparison.Smaller
                , Nine = Comparison.Smaller
                }
                right
          , One =
              merge
                { Zero = Comparison.Greater
                , One = Comparison.Equal
                , Two = Comparison.Smaller
                , Three = Comparison.Smaller
                , Four = Comparison.Smaller
                , Five = Comparison.Smaller
                , Six = Comparison.Smaller
                , Seven = Comparison.Smaller
                , Eight = Comparison.Smaller
                , Nine = Comparison.Smaller
                }
                right
          , Two =
              merge
                { Zero = Comparison.Greater
                , One = Comparison.Greater
                , Two = Comparison.Equal
                , Three = Comparison.Smaller
                , Four = Comparison.Smaller
                , Five = Comparison.Smaller
                , Six = Comparison.Smaller
                , Seven = Comparison.Smaller
                , Eight = Comparison.Smaller
                , Nine = Comparison.Smaller
                }
                right
          , Three =
              merge
                { Zero = Comparison.Greater
                , One = Comparison.Greater
                , Two = Comparison.Greater
                , Three = Comparison.Equal
                , Four = Comparison.Smaller
                , Five = Comparison.Smaller
                , Six = Comparison.Smaller
                , Seven = Comparison.Smaller
                , Eight = Comparison.Smaller
                , Nine = Comparison.Smaller
                }
                right
          , Four =
              merge
                { Zero = Comparison.Greater
                , One = Comparison.Greater
                , Two = Comparison.Greater
                , Three = Comparison.Greater
                , Four = Comparison.Equal
                , Five = Comparison.Smaller
                , Six = Comparison.Smaller
                , Seven = Comparison.Smaller
                , Eight = Comparison.Smaller
                , Nine = Comparison.Smaller
                }
                right
          , Five =
              merge
                { Zero = Comparison.Greater
                , One = Comparison.Greater
                , Two = Comparison.Greater
                , Three = Comparison.Greater
                , Four = Comparison.Greater
                , Five = Comparison.Equal
                , Six = Comparison.Smaller
                , Seven = Comparison.Smaller
                , Eight = Comparison.Smaller
                , Nine = Comparison.Smaller
                }
                right
          , Six =
              merge
                { Zero = Comparison.Greater
                , One = Comparison.Greater
                , Two = Comparison.Greater
                , Three = Comparison.Greater
                , Four = Comparison.Greater
                , Five = Comparison.Greater
                , Six = Comparison.Equal
                , Seven = Comparison.Smaller
                , Eight = Comparison.Smaller
                , Nine = Comparison.Smaller
                }
                right
          , Seven =
              merge
                { Zero = Comparison.Greater
                , One = Comparison.Greater
                , Two = Comparison.Greater
                , Three = Comparison.Greater
                , Four = Comparison.Greater
                , Five = Comparison.Greater
                , Six = Comparison.Greater
                , Seven = Comparison.Equal
                , Eight = Comparison.Smaller
                , Nine = Comparison.Smaller
                }
                right
          , Eight =
              merge
                { Zero = Comparison.Greater
                , One = Comparison.Greater
                , Two = Comparison.Greater
                , Three = Comparison.Greater
                , Four = Comparison.Greater
                , Five = Comparison.Greater
                , Six = Comparison.Greater
                , Seven = Comparison.Greater
                , Eight = Comparison.Equal
                , Nine = Comparison.Smaller
                }
                right
          , Nine =
              merge
                { Zero = Comparison.Greater
                , One = Comparison.Greater
                , Two = Comparison.Greater
                , Three = Comparison.Greater
                , Four = Comparison.Greater
                , Five = Comparison.Greater
                , Six = Comparison.Greater
                , Seven = Comparison.Greater
                , Eight = Comparison.Greater
                , Nine = Comparison.Equal
                }
                right
          }
          left

in  { compare } : Classes.Order.Type Self
