let Self = ./Type.dhall

let Classes = ../../../Classes/package.dhall

let Comparison = Classes.Order.Comparison

let compare
    : Self -> Self -> Comparison
    = \(left : Self) ->
      \(right : Self) ->
        merge
          { A =
              merge
                { A = Comparison.Equal
                , B = Comparison.Smaller
                , C = Comparison.Smaller
                , D = Comparison.Smaller
                , E = Comparison.Smaller
                , F = Comparison.Smaller
                , G = Comparison.Smaller
                , H = Comparison.Smaller
                , I = Comparison.Smaller
                , J = Comparison.Smaller
                , K = Comparison.Smaller
                , L = Comparison.Smaller
                , M = Comparison.Smaller
                , N = Comparison.Smaller
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , B =
              merge
                { A = Comparison.Greater
                , B = Comparison.Equal
                , C = Comparison.Smaller
                , D = Comparison.Smaller
                , E = Comparison.Smaller
                , F = Comparison.Smaller
                , G = Comparison.Smaller
                , H = Comparison.Smaller
                , I = Comparison.Smaller
                , J = Comparison.Smaller
                , K = Comparison.Smaller
                , L = Comparison.Smaller
                , M = Comparison.Smaller
                , N = Comparison.Smaller
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , C =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Equal
                , D = Comparison.Smaller
                , E = Comparison.Smaller
                , F = Comparison.Smaller
                , G = Comparison.Smaller
                , H = Comparison.Smaller
                , I = Comparison.Smaller
                , J = Comparison.Smaller
                , K = Comparison.Smaller
                , L = Comparison.Smaller
                , M = Comparison.Smaller
                , N = Comparison.Smaller
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , D =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Equal
                , E = Comparison.Smaller
                , F = Comparison.Smaller
                , G = Comparison.Smaller
                , H = Comparison.Smaller
                , I = Comparison.Smaller
                , J = Comparison.Smaller
                , K = Comparison.Smaller
                , L = Comparison.Smaller
                , M = Comparison.Smaller
                , N = Comparison.Smaller
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , E =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Equal
                , F = Comparison.Smaller
                , G = Comparison.Smaller
                , H = Comparison.Smaller
                , I = Comparison.Smaller
                , J = Comparison.Smaller
                , K = Comparison.Smaller
                , L = Comparison.Smaller
                , M = Comparison.Smaller
                , N = Comparison.Smaller
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , F =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Equal
                , G = Comparison.Smaller
                , H = Comparison.Smaller
                , I = Comparison.Smaller
                , J = Comparison.Smaller
                , K = Comparison.Smaller
                , L = Comparison.Smaller
                , M = Comparison.Smaller
                , N = Comparison.Smaller
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , G =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Equal
                , H = Comparison.Smaller
                , I = Comparison.Smaller
                , J = Comparison.Smaller
                , K = Comparison.Smaller
                , L = Comparison.Smaller
                , M = Comparison.Smaller
                , N = Comparison.Smaller
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , H =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Equal
                , I = Comparison.Smaller
                , J = Comparison.Smaller
                , K = Comparison.Smaller
                , L = Comparison.Smaller
                , M = Comparison.Smaller
                , N = Comparison.Smaller
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , I =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Equal
                , J = Comparison.Smaller
                , K = Comparison.Smaller
                , L = Comparison.Smaller
                , M = Comparison.Smaller
                , N = Comparison.Smaller
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , J =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Equal
                , K = Comparison.Smaller
                , L = Comparison.Smaller
                , M = Comparison.Smaller
                , N = Comparison.Smaller
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , K =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Equal
                , L = Comparison.Smaller
                , M = Comparison.Smaller
                , N = Comparison.Smaller
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , L =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Equal
                , M = Comparison.Smaller
                , N = Comparison.Smaller
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , M =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Equal
                , N = Comparison.Smaller
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , N =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Greater
                , N = Comparison.Equal
                , O = Comparison.Smaller
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , O =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Greater
                , N = Comparison.Greater
                , O = Comparison.Equal
                , P = Comparison.Smaller
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , P =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Greater
                , N = Comparison.Greater
                , O = Comparison.Greater
                , P = Comparison.Equal
                , Q = Comparison.Smaller
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , Q =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Greater
                , N = Comparison.Greater
                , O = Comparison.Greater
                , P = Comparison.Greater
                , Q = Comparison.Equal
                , R = Comparison.Smaller
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , R =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Greater
                , N = Comparison.Greater
                , O = Comparison.Greater
                , P = Comparison.Greater
                , Q = Comparison.Greater
                , R = Comparison.Equal
                , S = Comparison.Smaller
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , S =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Greater
                , N = Comparison.Greater
                , O = Comparison.Greater
                , P = Comparison.Greater
                , Q = Comparison.Greater
                , R = Comparison.Greater
                , S = Comparison.Equal
                , T = Comparison.Smaller
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , T =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Greater
                , N = Comparison.Greater
                , O = Comparison.Greater
                , P = Comparison.Greater
                , Q = Comparison.Greater
                , R = Comparison.Greater
                , S = Comparison.Greater
                , T = Comparison.Equal
                , U = Comparison.Smaller
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , U =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Greater
                , N = Comparison.Greater
                , O = Comparison.Greater
                , P = Comparison.Greater
                , Q = Comparison.Greater
                , R = Comparison.Greater
                , S = Comparison.Greater
                , T = Comparison.Greater
                , U = Comparison.Equal
                , V = Comparison.Smaller
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , V =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Greater
                , N = Comparison.Greater
                , O = Comparison.Greater
                , P = Comparison.Greater
                , Q = Comparison.Greater
                , R = Comparison.Greater
                , S = Comparison.Greater
                , T = Comparison.Greater
                , U = Comparison.Greater
                , V = Comparison.Equal
                , W = Comparison.Smaller
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , W =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Greater
                , N = Comparison.Greater
                , O = Comparison.Greater
                , P = Comparison.Greater
                , Q = Comparison.Greater
                , R = Comparison.Greater
                , S = Comparison.Greater
                , T = Comparison.Greater
                , U = Comparison.Greater
                , V = Comparison.Greater
                , W = Comparison.Equal
                , X = Comparison.Smaller
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , X =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Greater
                , N = Comparison.Greater
                , O = Comparison.Greater
                , P = Comparison.Greater
                , Q = Comparison.Greater
                , R = Comparison.Greater
                , S = Comparison.Greater
                , T = Comparison.Greater
                , U = Comparison.Greater
                , V = Comparison.Greater
                , W = Comparison.Greater
                , X = Comparison.Equal
                , Y = Comparison.Smaller
                , Z = Comparison.Smaller
                }
                right
          , Y =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Greater
                , N = Comparison.Greater
                , O = Comparison.Greater
                , P = Comparison.Greater
                , Q = Comparison.Greater
                , R = Comparison.Greater
                , S = Comparison.Greater
                , T = Comparison.Greater
                , U = Comparison.Greater
                , V = Comparison.Greater
                , W = Comparison.Greater
                , X = Comparison.Greater
                , Y = Comparison.Equal
                , Z = Comparison.Smaller
                }
                right
          , Z =
              merge
                { A = Comparison.Greater
                , B = Comparison.Greater
                , C = Comparison.Greater
                , D = Comparison.Greater
                , E = Comparison.Greater
                , F = Comparison.Greater
                , G = Comparison.Greater
                , H = Comparison.Greater
                , I = Comparison.Greater
                , J = Comparison.Greater
                , K = Comparison.Greater
                , L = Comparison.Greater
                , M = Comparison.Greater
                , N = Comparison.Greater
                , O = Comparison.Greater
                , P = Comparison.Greater
                , Q = Comparison.Greater
                , R = Comparison.Greater
                , S = Comparison.Greater
                , T = Comparison.Greater
                , U = Comparison.Greater
                , V = Comparison.Greater
                , W = Comparison.Greater
                , X = Comparison.Greater
                , Y = Comparison.Greater
                , Z = Comparison.Equal
                }
                right
          }
          left

in  { compare } : Classes.Order.Type Self
