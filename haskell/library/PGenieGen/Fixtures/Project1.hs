-- | Integration with generator adapters.
module PGenieGen.Fixtures.Project1 where

import Cases qualified
import Data.Char qualified as Char
import Data.List.NonEmpty qualified as NonEmpty
import Data.Text qualified as Text
import PGenieGen.Model
import PGenieGen.Model.Input qualified as Input
import PGenieGen.Prelude

input :: Input
input =
  Input.Project
    { space = textName "demo",
      name = textName "demo_project",
      version = Input.Version {major = 1, minor = 0, patch = 0},
      customTypes = [],
      queries = [exampleQuery],
      migrations =
        [ Input.Migration
            { name = "001_create_users",
              sql = "CREATE TABLE users (id SERIAL PRIMARY KEY, name TEXT NOT NULL, email TEXT);"
            }
        ]
    }
  where
    -- Helper function to create a name from text with all case renderings
    textName :: Text -> Input.Name
    textName source =
      Input.Name
        { inCamelCase = Cases.camelize source,
          inPascalCase = Cases.process Cases.title Cases.camel source,
          inKebabCase = Cases.spinalize source,
          inTrainCase = Cases.process Cases.title Cases.spinal source,
          inScreamingKebabCase = Cases.process Cases.upper Cases.spinal source,
          inSnakeCase = Cases.snakify source,
          inCamelSnakeCase = Cases.process Cases.title Cases.snake source,
          inScreamingSnakeCase = Cases.process Cases.upper Cases.snake source
        }

    -- Example query
    exampleQuery :: Input.Query
    exampleQuery =
      Input.Query
        { name = textName "get_user",
          srcPath = "queries/get_user.sql",
          idempotent = True,
          params = [userIdParam],
          result = Just userResult,
          fragments =
            [ Input.QueryFragmentSql "SELECT id, name, email FROM users WHERE id = ",
              Input.QueryFragmentVar
                ( Input.Var
                    { name = textName "user_id",
                      rawName = "user_id",
                      paramIndex = 1
                    }
                )
            ]
        }

    -- Parameter for user ID
    userIdParam :: Input.Member
    userIdParam =
      Input.Member
        { name = textName "user_id",
          pgName = "user_id",
          isNullable = False,
          value =
            Input.Value
              { arraySettings = Nothing,
                scalar = Input.ScalarPrimitive Input.PrimitiveInt4
              }
        }

    -- Result structure for user query
    userResult :: Input.ResultRows
    userResult =
      Input.ResultRows
        { cardinality = Input.ResultRowsCardinalityOptional,
          columns =
            NonEmpty.fromList
              [ Input.Member
                  { name = textName "id",
                    pgName = "id",
                    isNullable = False,
                    value =
                      Input.Value
                        { arraySettings = Nothing,
                          scalar = Input.ScalarPrimitive Input.PrimitiveInt4
                        }
                  },
                Input.Member
                  { name = textName "name",
                    pgName = "name",
                    isNullable = False,
                    value =
                      Input.Value
                        { arraySettings = Nothing,
                          scalar = Input.ScalarPrimitive Input.PrimitiveText
                        }
                  },
                Input.Member
                  { name = textName "email",
                    pgName = "email",
                    isNullable = True,
                    value =
                      Input.Value
                        { arraySettings = Nothing,
                          scalar = Input.ScalarPrimitive Input.PrimitiveText
                        }
                  }
              ]
        }
