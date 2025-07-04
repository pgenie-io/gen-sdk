let subj = ./toTextInCamel.dhall

let Word = ./Word/package.dhall

let WordOrNumber = ./WordOrNumber/package.dhall

let Number = ./Number/package.dhall

let WordChar = ./Word/Char/package.dhall

let NumberChar = ./Number/Char/package.dhall

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
          ===  "hello"
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
          ===  "helloWorldExample"
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
          ===  "apiV2"
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
          ===  "user123Name"
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
          ===  "aBC"
    , emptyTail =
          assert
        :     subj
                { head =
                  { head = WordChar.Type.T
                  , tail = [ WordChar.Type.E, WordChar.Type.S, WordChar.Type.T ]
                  }
                , tail = [] : List WordOrNumber.Type
                }
          ===  "test"
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
          ===  "getUser42Data"
    , longWord =
          assert
        :     subj
                { head =
                  { head = WordChar.Type.S
                  , tail =
                    [ WordChar.Type.U
                    , WordChar.Type.P
                    , WordChar.Type.E
                    , WordChar.Type.R
                    , WordChar.Type.C
                    , WordChar.Type.A
                    , WordChar.Type.L
                    , WordChar.Type.I
                    , WordChar.Type.F
                    , WordChar.Type.R
                    , WordChar.Type.A
                    , WordChar.Type.G
                    , WordChar.Type.I
                    , WordChar.Type.L
                    , WordChar.Type.I
                    , WordChar.Type.S
                    , WordChar.Type.T
                    , WordChar.Type.I
                    , WordChar.Type.C
                    ]
                  }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = WordChar.Type.E
                      , tail =
                        [ WordChar.Type.X
                        , WordChar.Type.P
                        , WordChar.Type.I
                        , WordChar.Type.A
                        , WordChar.Type.L
                        , WordChar.Type.I
                        , WordChar.Type.D
                        , WordChar.Type.O
                        , WordChar.Type.C
                        , WordChar.Type.I
                        , WordChar.Type.O
                        , WordChar.Type.U
                        , WordChar.Type.S
                        ]
                      }
                  ]
                }
          ===  "supercalifragilisticExpialidocious"
    }
