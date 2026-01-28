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
location = PGenieGen.LocationPath "./haskell/demo"

configJson :: Aeson.Value
configJson =
  [aesonQQ| 
    {
      "foo": "Foo!"
    } 
  |]

input :: Project.Project
input =
  Project.Project
    { owner = textName "demo",
      name = textName "demo_project",
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
    userIdParam :: Project.Member
    userIdParam =
      Project.Member
        { name = textName "user_id",
          pgName = "user_id",
          isNullable = False,
          value =
            Project.Value
              { dimensionality = 0,
                scalar = Project.ScalarPrimitive Project.PrimitiveInt4
              }
        }

    -- Result structure for user query
    userResult :: Project.ResultRows
    userResult =
      Project.ResultRows
        { cardinality = Project.ResultRowsCategoryOptional,
          columns =
            NonEmpty.fromList
              [ Project.Member
                  { name = textName "id",
                    pgName = "id",
                    isNullable = False,
                    value =
                      Project.Value
                        { dimensionality = 0,
                          scalar = Project.ScalarPrimitive Project.PrimitiveInt4
                        }
                  },
                Project.Member
                  { name = textName "name",
                    pgName = "name",
                    isNullable = False,
                    value =
                      Project.Value
                        { dimensionality = 0,
                          scalar = Project.ScalarPrimitive Project.PrimitiveText
                        }
                  },
                Project.Member
                  { name = textName "email",
                    pgName = "email",
                    isNullable = True,
                    value =
                      Project.Value
                        { dimensionality = 0,
                          scalar = Project.ScalarPrimitive Project.PrimitiveText
                        }
                  }
              ]
        }
