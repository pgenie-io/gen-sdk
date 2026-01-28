module Main (main) where

import Control.Monad (forM_)
import Data.Aeson qualified as Aeson
import Data.Aeson.QQ.Simple (aesonQQ)
import Data.List.NonEmpty qualified as NonEmpty
import Data.Text (Text)
import Data.Text.IO qualified as Text
import PGenieGen.V1 qualified as PGenieGen
import PGenieGen.V1.Project qualified as Project
import System.Exit
import Prelude

main :: IO ()
main = do
  gen <- PGenieGen.load location configJson

  success <- case gen input of
    PGenieGen.ResultSuccess success -> pure success
    PGenieGen.ResultFailure errMsg -> do
      putStrLn "Generation failed!"
      Text.putStrLn errMsg
      exitFailure

  forM_ success.warnings \warning -> do
    print warning

  forM_ success.files \(PGenieGen.File path content) -> do
    Text.putStrLn (path <> ":")
    Text.putStrLn content
    Text.putStrLn "---"

location :: PGenieGen.Location
location = PGenieGen.LocationUrl "https://raw.githubusercontent.com/pgenie-io/haskell-hasql.gen/refs/heads/master/src"

configJson :: Aeson.Value
configJson =
  [aesonQQ| 
    {
      "hasqlVersionOverride": "1.9.1.2"
    } 
  |]

input :: Project.Project
input =
  Project.Project
    { name = textName "demo_project",
      version = Project.Version {major = 1, minor = 0, patch = 0},
      customTypes = [],
      queries = [exampleQuery]
    }
  where
    -- Helper function to create a simple name from text
    textName :: Text -> Project.Name
    textName _text =
      Project.Name
        { head = NonEmpty.fromList [Project.WordCharA, Project.WordCharB],
          tail = []
        }

    -- Example query
    exampleQuery :: Project.Query
    exampleQuery =
      Project.Query
        { name = textName "get_user",
          srcPath = "queries/get_user.sql",
          params = [userIdParam],
          result = Just userResult,
          fragments = [Project.QueryFragmentSql "SELECT id, name, email FROM users WHERE id = ", Project.QueryFragmentVar (textName "user_id")]
        }

    -- Parameter for user ID
    userIdParam :: Project.Field
    userIdParam =
      Project.Field
        { name = textName "user_id",
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
        { cardinality = Project.ResultRowsCategoryOptional,
          columns =
            NonEmpty.fromList
              [ Project.Field
                  { name = textName "id",
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
                  { name = textName "name",
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
                  { name = textName "email",
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
