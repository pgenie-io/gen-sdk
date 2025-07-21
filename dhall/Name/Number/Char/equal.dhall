let Self = ./Type.dhall

let Handler = ./Handler/package.dhall Bool False

in  \(left : Self) ->
    \(right : Self) ->
      merge
        { Zero = merge Handler::{ Zero = True } right
        , One = merge Handler::{ One = True } right
        , Two = merge Handler::{ Two = True } right
        , Three = merge Handler::{ Three = True } right
        , Four = merge Handler::{ Four = True } right
        , Five = merge Handler::{ Five = True } right
        , Six = merge Handler::{ Six = True } right
        , Seven = merge Handler::{ Seven = True } right
        , Eight = merge Handler::{ Eight = True } right
        , Nine = merge Handler::{ Nine = True } right
        }
        left
