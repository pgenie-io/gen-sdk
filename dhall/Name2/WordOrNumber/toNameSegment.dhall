let Number = ../Number/package.dhall

let Word = ../Word/package.dhall

let NameSegment = ../../Name/Segment/package.dhall

in  ./fold.dhall NameSegment.Type Word.toNameSegment Number.toNameSegment
