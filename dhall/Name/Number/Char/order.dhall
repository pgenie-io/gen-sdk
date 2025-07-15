let Self = ./Type.dhall

let Classes = ./Classes.dhall

in    { equality = ./equality.dhall, lessThan = ./lessThan.dhall }
    : Classes.Order.Order Self
