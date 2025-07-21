λ(n : Natural) →
λ(m : Natural) →
  let div =
        https://github.com/jcaesar/dhall-div/releases/download/1/quotient.dhall
          sha256:d6a994f4b431081e877a0beac02f5dcc98f3ea5b027986114487578056cb3db9

  in  (div n m).q
