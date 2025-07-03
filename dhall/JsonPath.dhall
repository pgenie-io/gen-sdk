let Self = List Text

let prepend = \(what : Self) -> \(to : Self) -> what # to

in  { Type = Self, default = [] : Self, prepend }
