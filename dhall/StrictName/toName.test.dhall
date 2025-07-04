let subj = ./toName.dhall

let Word = ./Word/package.dhall

let WordOrNumber = ./WordOrNumber/package.dhall

let Number = ./Number/package.dhall

let WordChar = ./Word/Char/package.dhall

let NumberChar = ./Number/Char/package.dhall

let NameSegment = ../Name/Segment/package.dhall

in  { singleWord =
          assert
        :     subj
                { head =
                  { head = WordChar.Type.H
                  , tail =
                    [ WordChar.Type.E
                    , WordChar.Type.L
                    , WordChar.Type.L
                    , WordChar.Type.O
                    ]
                  }
                , tail = [] : List WordOrNumber.Type
                }
          ===  [ { firstChar = "h", otherChars = "ello" } ]
    , multipleWords =
          assert
        :     subj
                { head =
                  { head = WordChar.Type.H
                  , tail =
                    [ WordChar.Type.E
                    , WordChar.Type.L
                    , WordChar.Type.L
                    , WordChar.Type.O
                    ]
                  }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = WordChar.Type.W
                      , tail =
                        [ WordChar.Type.O
                        , WordChar.Type.R
                        , WordChar.Type.L
                        , WordChar.Type.D
                        ]
                      }
                  , WordOrNumber.Type.Word
                      { head = WordChar.Type.E
                      , tail =
                        [ WordChar.Type.X
                        , WordChar.Type.A
                        , WordChar.Type.M
                        , WordChar.Type.P
                        , WordChar.Type.L
                        , WordChar.Type.E
                        ]
                      }
                  ]
                }
          ===  [ { firstChar = "h", otherChars = "ello" }
               , { firstChar = "w", otherChars = "orld" }
               , { firstChar = "e", otherChars = "xample" }
               ]
    , wordWithNumber =
          assert
        :     subj
                { head =
                  { head = WordChar.Type.A
                  , tail = [ WordChar.Type.P, WordChar.Type.I ]
                  }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = WordChar.Type.V, tail = [] : List WordChar.Type }
                  , WordOrNumber.Type.Number
                      { head = NumberChar.Type.Two
                      , tail = [] : List NumberChar.Type
                      }
                  ]
                }
          ===  [ { firstChar = "a", otherChars = "pi" }
               , { firstChar = "v", otherChars = "" }
               , { firstChar = "2", otherChars = "" }
               ]
    , numberInTail =
          assert
        :     subj
                { head =
                  { head = WordChar.Type.U
                  , tail = [ WordChar.Type.S, WordChar.Type.E, WordChar.Type.R ]
                  }
                , tail =
                  [ WordOrNumber.Type.Number
                      { head = NumberChar.Type.One
                      , tail = [ NumberChar.Type.Two, NumberChar.Type.Three ]
                      }
                  , WordOrNumber.Type.Word
                      { head = WordChar.Type.N
                      , tail =
                        [ WordChar.Type.A, WordChar.Type.M, WordChar.Type.E ]
                      }
                  ]
                }
          ===  [ { firstChar = "u", otherChars = "ser" }
               , { firstChar = "1", otherChars = "23" }
               , { firstChar = "n", otherChars = "ame" }
               ]
    , singleCharWord =
          assert
        :     subj
                { head =
                  { head = WordChar.Type.A, tail = [] : List WordChar.Type }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = WordChar.Type.B, tail = [] : List WordChar.Type }
                  , WordOrNumber.Type.Word
                      { head = WordChar.Type.C, tail = [] : List WordChar.Type }
                  ]
                }
          ===  [ { firstChar = "a", otherChars = "" }
               , { firstChar = "b", otherChars = "" }
               , { firstChar = "c", otherChars = "" }
               ]
    , emptyTail =
          assert
        :     subj
                { head =
                  { head = WordChar.Type.T
                  , tail = [ WordChar.Type.E, WordChar.Type.S, WordChar.Type.T ]
                  }
                , tail = [] : List WordOrNumber.Type
                }
          ===  [ { firstChar = "t", otherChars = "est" } ]
    , mixedWordsAndNumbers =
          assert
        :     subj
                { head =
                  { head = WordChar.Type.G
                  , tail = [ WordChar.Type.E, WordChar.Type.T ]
                  }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = WordChar.Type.U
                      , tail =
                        [ WordChar.Type.S, WordChar.Type.E, WordChar.Type.R ]
                      }
                  , WordOrNumber.Type.Number
                      { head = NumberChar.Type.Four
                      , tail = [ NumberChar.Type.Two ]
                      }
                  , WordOrNumber.Type.Word
                      { head = WordChar.Type.D
                      , tail =
                        [ WordChar.Type.A, WordChar.Type.T, WordChar.Type.A ]
                      }
                  ]
                }
          ===  [ { firstChar = "g", otherChars = "et" }
               , { firstChar = "u", otherChars = "ser" }
               , { firstChar = "4", otherChars = "2" }
               , { firstChar = "d", otherChars = "ata" }
               ]
    , numbersOnly =
          assert
        :     subj
                { head =
                  { head = WordChar.Type.V, tail = [] : List WordChar.Type }
                , tail =
                  [ WordOrNumber.Type.Number
                      { head = NumberChar.Type.One
                      , tail = [] : List NumberChar.Type
                      }
                  , WordOrNumber.Type.Number
                      { head = NumberChar.Type.Two
                      , tail = [] : List NumberChar.Type
                      }
                  , WordOrNumber.Type.Number
                      { head = NumberChar.Type.Three
                      , tail = [] : List NumberChar.Type
                      }
                  ]
                }
          ===  [ { firstChar = "v", otherChars = "" }
               , { firstChar = "1", otherChars = "" }
               , { firstChar = "2", otherChars = "" }
               , { firstChar = "3", otherChars = "" }
               ]
    , longNumbers =
          assert
        :     subj
                { head =
                  { head = WordChar.Type.Y
                  , tail = [ WordChar.Type.E, WordChar.Type.A, WordChar.Type.R ]
                  }
                , tail =
                  [ WordOrNumber.Type.Number
                      { head = NumberChar.Type.Two
                      , tail =
                        [ NumberChar.Type.Zero
                        , NumberChar.Type.Two
                        , NumberChar.Type.Five
                        ]
                      }
                  ]
                }
          ===  [ { firstChar = "y", otherChars = "ear" }
               , { firstChar = "2", otherChars = "025" }
               ]
    }
