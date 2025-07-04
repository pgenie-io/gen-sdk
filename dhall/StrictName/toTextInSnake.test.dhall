let subj = ./toTextInSnake.dhall

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
          ===  "hello_world_example"
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
          ===  "api_v_2"
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
          ===  "user_123_name"
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
          ===  "a_b_c"
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
          ===  "get_user_42_data"
    }
