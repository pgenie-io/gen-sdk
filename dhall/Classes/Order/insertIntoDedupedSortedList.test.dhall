let Prelude = ./Prelude.dhall

let insertIntoDedupedSortedList = ./insertIntoDedupedSortedList.dhall

let Order = ./Type.dhall

let PreludeInstances = ./PreludeInstances/package.dhall

in  { insertIntoDedupedSortedListFunction =
      { insertIntoEmpty =
            assert
          :     insertIntoDedupedSortedList
                  Natural
                  PreludeInstances.natural
                  5
                  ([] : List Natural)
            ===  [ 5 ]
      , insertAtBeginning =
            assert
          :     insertIntoDedupedSortedList
                  Natural
                  PreludeInstances.natural
                  1
                  [ 2, 3, 4 ]
            ===  [ 1, 4, 3, 2 ]
      , insertInMiddle =
            assert
          :     insertIntoDedupedSortedList
                  Natural
                  PreludeInstances.natural
                  3
                  [ 1, 2, 4, 5 ]
            ===  [ 3, 5, 4, 2, 1 ]
      , insertAtEnd =
            assert
          :     insertIntoDedupedSortedList
                  Natural
                  PreludeInstances.natural
                  6
                  [ 1, 2, 3, 4, 5 ]
            ===  [ 6, 5, 4, 3, 2, 1 ]
      , insertDuplicate =
            assert
          :     insertIntoDedupedSortedList
                  Natural
                  PreludeInstances.natural
                  3
                  [ 3 ]
            ===  [ 3, 3 ]
      }
    }
