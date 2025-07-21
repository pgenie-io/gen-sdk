let Prelude = ../Prelude.dhall

let Equality = ../../Equality/package.dhall

let Order = ../Type.dhall

let Comparison = ../Comparison.dhall

let compare
    : Natural -> Natural -> Comparison
    = \(left : Natural) ->
      \(right : Natural) ->
        if    Prelude.Natural.lessThan left right
        then  Comparison.Smaller
        else  if Prelude.Natural.lessThan right left
        then  Comparison.Greater
        else  Comparison.Equal

in  { compare } : Order Natural
