let foldl
    : forall (a : Type) ->
      List a ->
      forall (b : Type) ->
      (b -> a -> b) ->
      b ->
      b
    = \(a : Type) ->
      \(xs : List a) ->
      \(b : Type) ->
      \(cons : b -> a -> b) ->
      \(nil : b) ->
        List/fold
          a
          xs
          (b -> b)
          (\(x : a) -> \(k : b -> b) -> \(acc : b) -> k (cons acc x))
          (\(acc : b) -> acc)
          nil

in  foldl