let Self =
      \(Failure : Type) ->
      \(Success : Type) ->
        < Failure : Failure | Success : Success >

let mapError
    : forall (Failure1 : Type) ->
      forall (Failure2 : Type) ->
      forall (Success : Type) ->
      (Failure1 -> Failure2) ->
      Self Failure1 Success ->
        Self Failure2 Success
    = \(Failure1 : Type) ->
      \(Failure2 : Type) ->
      \(Success : Type) ->
      \(f : Failure1 -> Failure2) ->
      \(result : Self Failure1 Success) ->
        merge
          { Failure =
              \(failure1 : Failure1) ->
                (Self Failure2 Success).Failure (f failure1)
          , Success =
              \(success : Success) -> (Self Failure2 Success).Success success
          }
          result

let mapSuccess
    : forall (Failure : Type) ->
      forall (Success1 : Type) ->
      forall (Success2 : Type) ->
      (Success1 -> Success2) ->
      Self Failure Success1 ->
        Self Failure Success2
    = \(Failure : Type) ->
      \(Success1 : Type) ->
      \(Success2 : Type) ->
      \(f : Success1 -> Success2) ->
      \(result : Self Failure Success1) ->
        merge
          { Failure =
              \(failure : Failure) -> (Self Failure Success2).Failure failure
          , Success =
              \(success1 : Success1) ->
                (Self Failure Success2).Success (f success1)
          }
          result

let andThen
    : forall (Failure : Type) ->
      forall (Success1 : Type) ->
      forall (Success2 : Type) ->
      (Success1 -> Self Failure Success2) ->
      Self Failure Success1 ->
        Self Failure Success2
    = \(Failure : Type) ->
      \(Success1 : Type) ->
      \(Success2 : Type) ->
      \(f : Success1 -> Self Failure Success2) ->
      \(result : Self Failure Success1) ->
        merge
          { Failure =
              \(failure : Failure) -> (Self Failure Success2).Failure failure
          , Success = \(success1 : Success1) -> f success1
          }
          result

in  { Type = Self, mapError, mapSuccess, andThen }
