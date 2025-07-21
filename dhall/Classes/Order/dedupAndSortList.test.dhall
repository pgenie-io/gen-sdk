let Prelude = ./Prelude.dhall

let dedupAndSortList = ./dedupAndSortList.dhall

let Order = ./Type.dhall

let PreludeInstances = ./PreludeInstances/package.dhall

in  { dedupAndSortListFunction =
      { emptyList =
            assert
          :     dedupAndSortList
                  Natural
                  PreludeInstances.natural
                  ([] : List Natural)
            ===  ([] : List Natural)
      , singleElement =
            assert
          : dedupAndSortList Natural PreludeInstances.natural [ 5 ] === [ 5 ]
      , alreadySorted =
            assert
          :     dedupAndSortList
                  Natural
                  PreludeInstances.natural
                  [ 1, 2, 3, 4, 5 ]
            ===  [ 1, 3, 5, 4, 2 ]
      , reverseOrder =
            assert
          :     dedupAndSortList
                  Natural
                  PreludeInstances.natural
                  [ 5, 4, 3, 2, 1 ]
            ===  [ 5, 3, 1, 2, 4 ]
      , withDuplicates =
            assert
          :     dedupAndSortList
                  Natural
                  PreludeInstances.natural
                  [ 3, 1, 4, 1, 5, 9, 2, 6, 5, 3 ]
            ===  [ 2, 3, 4, 5, 3, 5, 6, 9, 1, 1 ]
      , randomOrder =
            assert
          :     dedupAndSortList
                  Natural
                  PreludeInstances.natural
                  [ 7, 2, 9, 1, 5 ]
            ===  [ 7, 9, 5, 2, 1 ]
      }
    }
