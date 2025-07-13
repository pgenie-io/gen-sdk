module Main (main) where

import Data.Aeson qualified as Aeson
import Data.Aeson.QQ.Simple (aesonQQ)
import Data.List.NonEmpty qualified as NonEmpty
import Data.Text (Text)
import Data.Text.IO qualified as Text
import PGenieGen.V1 qualified as PGenieGen
import PGenieGen.V1.Project qualified as Project
import Prelude

main :: IO ()
main = do
  gen <- PGenieGen.load location configJson
  case gen input of
    PGenieGen.ResultSuccess successResult -> do
      putStrLn "Generation succeeded!"
      print successResult
    PGenieGen.ResultFailure errMsg -> do
      putStrLn "Generation failed!"
      Text.putStrLn errMsg

location :: PGenieGen.Location
location = PGenieGen.LocationPath "./dhall/DemoAdapter"

configJson :: Aeson.Value
configJson =
  [aesonQQ| 
    { "a": 1, "b": "2", "c": false, "d": [] } 
  |]

input :: Project.Project
input =
  Project.Project
    { name = makeSimpleName "demo_project",
      version = Project.Version {major = 1, minor = 0, patch = 0},
      customTypes = [],
      queries = [exampleQuery]
    }
  where
    -- Helper function to create a simple name from text
    makeSimpleName :: Text -> Project.Name
    makeSimpleName _text =
      Project.Name
        { head = NonEmpty.fromList [Project.WordCharA, Project.WordCharB],
          tail = []
        }

    -- Example query
    exampleQuery :: Project.Query
    exampleQuery =
      Project.Query
        { name = makeSimpleName "get_user",
          srcPath = "queries/get_user.sql",
          params = [userIdParam],
          result = Just userResult,
          fragments = [Project.QueryFragmentSql "SELECT id, name, email FROM users WHERE id = ", Project.QueryFragmentVar (makeSimpleName "user_id")]
        }

    -- Parameter for user ID
    userIdParam :: Project.Field
    userIdParam =
      Project.Field
        { name = makeSimpleName "user_id",
          value =
            Project.Value
              { isNullable = False,
                dimensional =
                  Project.Dimensional
                    { dimensionality = 0,
                      scalar = Project.ScalarPrimitive Project.PrimitiveInt4
                    }
              }
        }

    -- Result structure for user query
    userResult :: Project.ResultRows
    userResult =
      Project.ResultRows
        { category = Project.ResultRowsCategoryOptional,
          row =
            NonEmpty.fromList
              [ Project.Field
                  { name = makeSimpleName "id",
                    value =
                      Project.Value
                        { isNullable = False,
                          dimensional =
                            Project.Dimensional
                              { dimensionality = 0,
                                scalar = Project.ScalarPrimitive Project.PrimitiveInt4
                              }
                        }
                  },
                Project.Field
                  { name = makeSimpleName "name",
                    value =
                      Project.Value
                        { isNullable = False,
                          dimensional =
                            Project.Dimensional
                              { dimensionality = 0,
                                scalar = Project.ScalarPrimitive Project.PrimitiveText
                              }
                        }
                  },
                Project.Field
                  { name = makeSimpleName "email",
                    value =
                      Project.Value
                        { isNullable = True,
                          dimensional =
                            Project.Dimensional
                              { dimensionality = 0,
                                scalar = Project.ScalarPrimitive Project.PrimitiveText
                              }
                        }
                  }
              ]
        }
