let Prelude = ../Deps/Prelude.dhall

let Contract = ../Deps/Contract.dhall

let Lude = ../Deps/Lude.dhall

let Declarations =
      { customTypes : List Contract.CustomType, queries : List Contract.Query }

let name =
      \(inCamelCase : Text) ->
      \(inPascalCase : Text) ->
      \(inKebabCase : Text) ->
      \(inTrainCase : Text) ->
      \(inScreamingKebabCase : Text) ->
      \(inSnakeCase : Text) ->
      \(inCamelSnakeCase : Text) ->
      \(inScreamingSnakeCase : Text) ->
          { inCamelCase
          , inPascalCase
          , inKebabCase
          , inTrainCase
          , inScreamingKebabCase
          , inSnakeCase
          , inCamelSnakeCase
          , inScreamingSnakeCase
          }
        : Contract.Name

let scalarQueries =
      \(scalar : Contract.Scalar) ->
      \(inCamelCase : Text) ->
      \(inPascalCase : Text) ->
      \(inKebabCase : Text) ->
      \(inTrainCase : Text) ->
      \(inScreamingKebabCase : Text) ->
      \(inSnakeCase : Text) ->
      \(inCamelSnakeCase : Text) ->
      \(inScreamingSnakeCase : Text) ->
        let primitiveName =
              name
                inCamelCase
                inPascalCase
                inKebabCase
                inTrainCase
                inScreamingKebabCase
                inSnakeCase
                inCamelSnakeCase
                inScreamingSnakeCase

        let scalarTypeSig =
              Lude.Text.replaceIfEqual "char" "\"char\"" inSnakeCase

        let query =
              \(nullable : Bool) ->
              \(dimensionality : Natural) ->
              \(elementIsNullable : Bool) ->
                let typeSig =
                          scalarTypeSig
                      ++  Prelude.Text.replicate dimensionality "[]"

                let member =
                      { name = primitiveName
                      , pgName = inSnakeCase
                      , isNullable = nullable
                      , value =
                        { arraySettings =
                            if    Natural/isZero dimensionality
                            then  None Contract.ArraySettings
                            else  Some { dimensionality, elementIsNullable }
                        , scalar
                        }
                      }

                let dimensionality = Natural/show dimensionality

                let nullable = if nullable then "1" else "0"

                let elementIsNullable = if elementIsNullable then "1" else "0"

                let name =
                      name
                        "select${inPascalCase}${nullable}${dimensionality}${elementIsNullable}"
                        "Select${inPascalCase}${nullable}${dimensionality}${elementIsNullable}"
                        "select-${inKebabCase}-${nullable}-${dimensionality}-${elementIsNullable}"
                        "Select-${inTrainCase}-${nullable}-${dimensionality}-${elementIsNullable}"
                        "SELECT-${inScreamingKebabCase}-${nullable}-${dimensionality}-${elementIsNullable}"
                        "select_${inSnakeCase}_${nullable}_${dimensionality}_${elementIsNullable}"
                        "Select_${inCamelSnakeCase}_${nullable}_${dimensionality}_${elementIsNullable}"
                        "SELECT_${inScreamingSnakeCase}_${nullable}_${dimensionality}_${elementIsNullable}"

                in  { name
                    , srcPath = "./queries/${name.inSnakeCase}.sql"
                    , identity = True
                    , idempotent = True
                    , params = [ member ]
                    , result =
                        Contract.Result.Rows
                          { cardinality =
                              Contract.ResultRowsCardinality.Multiple
                          , columns =
                            { head = member, tail = [] : List Contract.Member }
                          }
                    , fragments =
                      [ Contract.QueryFragment.Sql "select "
                      , Contract.QueryFragment.Var
                          { name = primitiveName
                          , rawName = inSnakeCase
                          , paramIndex = 0
                          }
                      , Contract.QueryFragment.Sql "::${typeSig}"
                      ]
                    }

        in  [ query True 0 False
            , query True 1 False
            , query True 2 False
            , query True 1 True
            , query True 2 True
            , query False 0 False
            , query False 1 False
            , query False 2 False
            , query False 1 True
            , query False 2 True
            ]

let primitiveQueries =
      \(primitive : Contract.Primitive) ->
        scalarQueries (Contract.Scalar.Primitive primitive)

let customTypeDeclarations =
      \(definition : Contract.CustomTypeDefinition) ->
      \(inCamelCase : Text) ->
      \(inPascalCase : Text) ->
      \(inKebabCase : Text) ->
      \(inTrainCase : Text) ->
      \(inScreamingKebabCase : Text) ->
      \(inSnakeCase : Text) ->
      \(inCamelSnakeCase : Text) ->
      \(inScreamingSnakeCase : Text) ->
      \(pgSchema : Text) ->
      \(pgName : Text) ->
      \(index : Natural) ->
        let typeName =
              name
                inCamelCase
                inPascalCase
                inKebabCase
                inTrainCase
                inScreamingKebabCase
                inSnakeCase
                inCamelSnakeCase
                inScreamingSnakeCase

        in    { customTypes = [ { name = typeName, pgSchema, pgName, definition } ]
              , queries =
                  scalarQueries
                    (Contract.Scalar.Custom { name = typeName, pgSchema, pgName, index })
                    inCamelCase
                    inPascalCase
                    inKebabCase
                    inTrainCase
                    inScreamingKebabCase
                    inSnakeCase
                    inCamelSnakeCase
                    inScreamingSnakeCase
              }
            : Declarations

let enumDeclarations =
      \(values : List Contract.EnumVariant) ->
        customTypeDeclarations (Contract.CustomTypeDefinition.Enum values)

let compositeDeclarations =
      \(members : List Contract.Member) ->
        customTypeDeclarations (Contract.CustomTypeDefinition.Composite members)

let domainDeclarations =
      \(value : Contract.Value) ->
        customTypeDeclarations (Contract.CustomTypeDefinition.Domain value)

let moodDeclarations =
      enumDeclarations
        [ { name = name "sad" "Sad" "sad" "Sad" "SAD" "sad" "Sad" "SAD"
          , pgName = "sad"
          }
        , { name = name "ok" "Ok" "ok" "Ok" "OK" "ok" "Ok" "OK", pgName = "ok" }
        , { name =
              name
                "happy"
                "Happy"
                "happy"
                "Happy"
                "HAPPY"
                "happy"
                "Happy"
                "HAPPY"
          , pgName = "happy"
          }
        ]
        "mood"
        "Mood"
        "mood"
        "Mood"
        "MOOD"
        "mood"
        "Mood"
        "MOOD"
        "public"
        "mood"
        0

let coordinatesDeclarations =
      compositeDeclarations
        [ { name = name "x" "X" "x" "X" "X" "x" "X" "X"
          , pgName = "x"
          , isNullable = True
          , value =
            { arraySettings = None Contract.ArraySettings
            , scalar = Contract.Scalar.Primitive Contract.Primitive.Float8
            }
          }
        , { name = name "y" "Y" "y" "Y" "Y" "y" "Y" "Y"
          , pgName = "y"
          , isNullable = True
          , value =
            { arraySettings = None Contract.ArraySettings
            , scalar = Contract.Scalar.Primitive Contract.Primitive.Float8
            }
          }
        ]
        "coordinate"
        "Coordinate"
        "coordinate"
        "Coordinate"
        "COORDINATE"
        "coordinate"
        "Coordinate"
        "COORDINATE"
        "public"
        "coordinate"
        1

let temperatureCelsiusDeclarations =
      domainDeclarations
        { arraySettings = None Contract.ArraySettings
        , scalar = Contract.Scalar.Primitive Contract.Primitive.Float8
        }
        "temperatureCelsius"
        "TemperatureCelsius"
        "temperature-celsius"
        "Temperature-Celsius"
        "TEMPERATURE-CELSIUS"
        "temperature_celsius"
        "Temperature_Celsius"
        "TEMPERATURE_CELSIUS"
        "measurements"
        "temp_c"
        2

let weatherReadingDeclarations =
      compositeDeclarations
        [ { name =
              name
                "temperature"
                "Temperature"
                "temperature"
                "Temperature"
                "TEMPERATURE"
                "temperature"
                "Temperature"
                "TEMPERATURE"
          , pgName = "temperature"
          , isNullable = False
          , value =
            { arraySettings = None Contract.ArraySettings
            , scalar =
                Contract.Scalar.Custom
                  { name =
                      name
                        "temperatureCelsius"
                        "TemperatureCelsius"
                        "temperature-celsius"
                        "Temperature-Celsius"
                        "TEMPERATURE-CELSIUS"
                        "temperature_celsius"
                        "Temperature_Celsius"
                        "TEMPERATURE_CELSIUS"
                  , pgSchema = "measurements"
                  , pgName = "temp_c"
                  , index = 2
                  }
            }
          }
        ]
        "weatherReading"
        "WeatherReading"
        "weather-reading"
        "Weather-Reading"
        "WEATHER-READING"
        "weather_reading"
        "Weather_Reading"
        "WEATHER_READING"
        "public"
        "weather_reading"
        3

let idempotentNonIdentityQuery
    : Contract.Query
    = { name =
          name
            "setApplicationName"
            "SetApplicationName"
            "set-application-name"
            "Set-Application-Name"
            "SET-APPLICATION-NAME"
            "set_application_name"
            "Set_Application_Name"
            "SET_APPLICATION_NAME"
      , srcPath = "./queries/set_application_name.sql"
      , identity = False
      , idempotent = True
      , params = [] : List Contract.Member
      , result = Contract.Result.Void
      , fragments =
        [ Contract.QueryFragment.Sql "set application_name = 'pgenie_fixture'" ]
      }

let nonIdempotentNonIdentityQuery
    : Contract.Query
    = { name =
          name
            "notifyFixtureChannel"
            "NotifyFixtureChannel"
            "notify-fixture-channel"
            "Notify-Fixture-Channel"
            "NOTIFY-FIXTURE-CHANNEL"
            "notify_fixture_channel"
            "Notify_Fixture_Channel"
            "NOTIFY_FIXTURE_CHANNEL"
      , srcPath = "./queries/notify_fixture_channel.sql"
      , identity = False
      , idempotent = False
      , params = [] : List Contract.Member
      , result = Contract.Result.Void
      , fragments =
        [ Contract.QueryFragment.Sql "notify fixture_channel, 'fixture'" ]
      }

let multiParamColQuery
    : Contract.Query
    = let textMember =
            \(memberName : Contract.Name) ->
            \(pgName : Text) ->
            \(isNullable : Bool) ->
              { name = memberName
              , pgName
              , isNullable
              , value =
                { arraySettings = None Contract.ArraySettings
                , scalar = Contract.Scalar.Primitive Contract.Primitive.Text
                }
              }

      let int8Member =
            \(memberName : Contract.Name) ->
            \(pgName : Text) ->
            \(isNullable : Bool) ->
              { name = memberName
              , pgName
              , isNullable
              , value =
                { arraySettings = None Contract.ArraySettings
                , scalar = Contract.Scalar.Primitive Contract.Primitive.Int8
                }
              }

      let param1 =
            textMember
              ( name
                  "param1"
                  "Param1"
                  "param-1"
                  "Param-1"
                  "PARAM-1"
                  "param_1"
                  "Param_1"
                  "PARAM_1"
              )
              "param_1"
              False

      let param2 =
            int8Member
              ( name
                  "param2"
                  "Param2"
                  "param-2"
                  "Param-2"
                  "PARAM-2"
                  "param_2"
                  "Param_2"
                  "PARAM_2"
              )
              "param_2"
              False

      let col1 =
            textMember
              ( name
                  "col1"
                  "Col1"
                  "col-1"
                  "Col-1"
                  "COL-1"
                  "col_1"
                  "Col_1"
                  "COL_1"
              )
              "col_1"
              False

      let col2 =
            int8Member
              ( name
                  "col2"
                  "Col2"
                  "col-2"
                  "Col-2"
                  "COL-2"
                  "col_2"
                  "Col_2"
                  "COL_2"
              )
              "col_2"
              False

      in  { name =
              name
                "selectTexts"
                "SelectTexts"
                "select-texts"
                "Select-Texts"
                "SELECT-TEXTS"
                "select_texts"
                "Select_Texts"
                "SELECT_TEXTS"
          , srcPath = "./queries/select_texts.sql"
          , identity = True
          , idempotent = True
          , params = [ param1, param2 ]
          , result =
              Contract.Result.Rows
                { cardinality = Contract.ResultRowsCardinality.Multiple
                , columns = { head = col1, tail = [ col2 ] }
                }
          , fragments =
            [ Contract.QueryFragment.Sql "select "
            , Contract.QueryFragment.Var
                { name = param1.name, rawName = "param_1", paramIndex = 0 }
            , Contract.QueryFragment.Sql "::text, "
            , Contract.QueryFragment.Var
                { name = param2.name, rawName = "param_2", paramIndex = 1 }
            , Contract.QueryFragment.Sql "::int8"
            ]
          }

in  { space =
        name
          "mySpace"
          "MySpace"
          "my-space"
          "My-Space"
          "MY-SPACE"
          "my_space"
          "My_Space"
          "MY_SPACE"
    , name =
        name
          "musicCatalogue"
          "MusicCatalogue"
          "music-catalogue"
          "Music-Catalogue"
          "MUSIC-CATALOGUE"
          "music_catalogue"
          "Music_Catalogue"
          "MUSIC_CATALOGUE"
    , version = { major = 1, minor = 0, patch = 1 }
    , customTypes =
        Prelude.List.concat
          Contract.CustomType
          [ moodDeclarations.customTypes
          , coordinatesDeclarations.customTypes
          , temperatureCelsiusDeclarations.customTypes
          , weatherReadingDeclarations.customTypes
          ]
    , queries =
        Prelude.List.concat
          Contract.Query
          [ primitiveQueries
              Contract.Primitive.Bit
              "bit"
              "Bit"
              "bit"
              "Bit"
              "BIT"
              "bit"
              "Bit"
              "BIT"
          , primitiveQueries
              Contract.Primitive.Bool
              "bool"
              "Bool"
              "bool"
              "Bool"
              "BOOL"
              "bool"
              "Bool"
              "BOOL"
          , primitiveQueries
              Contract.Primitive.Box
              "box"
              "Box"
              "box"
              "Box"
              "BOX"
              "box"
              "Box"
              "BOX"
          , primitiveQueries
              Contract.Primitive.Bpchar
              "bpchar"
              "Bpchar"
              "bpchar"
              "Bpchar"
              "BPCHAR"
              "bpchar"
              "Bpchar"
              "BPCHAR"
          , primitiveQueries
              Contract.Primitive.Bytea
              "bytea"
              "Bytea"
              "bytea"
              "Bytea"
              "BYTEA"
              "bytea"
              "Bytea"
              "BYTEA"
          , primitiveQueries
              Contract.Primitive.Char
              "char"
              "Char"
              "char"
              "Char"
              "CHAR"
              "char"
              "Char"
              "CHAR"
          , primitiveQueries
              Contract.Primitive.Cidr
              "cidr"
              "Cidr"
              "cidr"
              "Cidr"
              "CIDR"
              "cidr"
              "Cidr"
              "CIDR"
          , primitiveQueries
              Contract.Primitive.Circle
              "circle"
              "Circle"
              "circle"
              "Circle"
              "CIRCLE"
              "circle"
              "Circle"
              "CIRCLE"
          , primitiveQueries
              Contract.Primitive.Citext
              "citext"
              "Citext"
              "citext"
              "Citext"
              "CITEXT"
              "citext"
              "Citext"
              "CITEXT"
          , primitiveQueries
              Contract.Primitive.Date
              "date"
              "Date"
              "date"
              "Date"
              "DATE"
              "date"
              "Date"
              "DATE"
          , primitiveQueries
              Contract.Primitive.Datemultirange
              "datemultirange"
              "Datemultirange"
              "datemultirange"
              "Datemultirange"
              "DATEMULTIRANGE"
              "datemultirange"
              "Datemultirange"
              "DATEMULTIRANGE"
          , primitiveQueries
              Contract.Primitive.Daterange
              "daterange"
              "Daterange"
              "daterange"
              "Daterange"
              "DATERANGE"
              "daterange"
              "Daterange"
              "DATERANGE"
          , primitiveQueries
              Contract.Primitive.Float4
              "float4"
              "Float4"
              "float4"
              "Float4"
              "FLOAT4"
              "float4"
              "Float4"
              "FLOAT4"
          , primitiveQueries
              Contract.Primitive.Float8
              "float8"
              "Float8"
              "float8"
              "Float8"
              "FLOAT8"
              "float8"
              "Float8"
              "FLOAT8"
          , primitiveQueries
              Contract.Primitive.Hstore
              "hstore"
              "Hstore"
              "hstore"
              "Hstore"
              "HSTORE"
              "hstore"
              "Hstore"
              "HSTORE"
          , primitiveQueries
              Contract.Primitive.Inet
              "inet"
              "Inet"
              "inet"
              "Inet"
              "INET"
              "inet"
              "Inet"
              "INET"
          , primitiveQueries
              Contract.Primitive.Int2
              "int2"
              "Int2"
              "int2"
              "Int2"
              "INT2"
              "int2"
              "Int2"
              "INT2"
          , primitiveQueries
              Contract.Primitive.Int4
              "int4"
              "Int4"
              "int4"
              "Int4"
              "INT4"
              "int4"
              "Int4"
              "INT4"
          , primitiveQueries
              Contract.Primitive.Int4multirange
              "int4multirange"
              "Int4multirange"
              "int4multirange"
              "Int4multirange"
              "INT4MULTIRANGE"
              "int4multirange"
              "Int4multirange"
              "INT4MULTIRANGE"
          , primitiveQueries
              Contract.Primitive.Int4range
              "int4range"
              "Int4range"
              "int4range"
              "Int4range"
              "INT4RANGE"
              "int4range"
              "Int4range"
              "INT4RANGE"
          , primitiveQueries
              Contract.Primitive.Int8
              "int8"
              "Int8"
              "int8"
              "Int8"
              "INT8"
              "int8"
              "Int8"
              "INT8"
          , primitiveQueries
              Contract.Primitive.Int8multirange
              "int8multirange"
              "Int8multirange"
              "int8multirange"
              "Int8multirange"
              "INT8MULTIRANGE"
              "int8multirange"
              "Int8multirange"
              "INT8MULTIRANGE"
          , primitiveQueries
              Contract.Primitive.Int8range
              "int8range"
              "Int8range"
              "int8range"
              "Int8range"
              "INT8RANGE"
              "int8range"
              "Int8range"
              "INT8RANGE"
          , primitiveQueries
              Contract.Primitive.Interval
              "interval"
              "Interval"
              "interval"
              "Interval"
              "INTERVAL"
              "interval"
              "Interval"
              "INTERVAL"
          , primitiveQueries
              Contract.Primitive.Json
              "json"
              "Json"
              "json"
              "Json"
              "JSON"
              "json"
              "Json"
              "JSON"
          , primitiveQueries
              Contract.Primitive.Jsonb
              "jsonb"
              "Jsonb"
              "jsonb"
              "Jsonb"
              "JSONB"
              "jsonb"
              "Jsonb"
              "JSONB"
          , primitiveQueries
              Contract.Primitive.Line
              "line"
              "Line"
              "line"
              "Line"
              "LINE"
              "line"
              "Line"
              "LINE"
          , primitiveQueries
              Contract.Primitive.Lseg
              "lseg"
              "Lseg"
              "lseg"
              "Lseg"
              "LSEG"
              "lseg"
              "Lseg"
              "LSEG"
          , primitiveQueries
              Contract.Primitive.Ltree
              "ltree"
              "Ltree"
              "ltree"
              "Ltree"
              "LTREE"
              "ltree"
              "Ltree"
              "LTREE"
          , primitiveQueries
              Contract.Primitive.Macaddr
              "macaddr"
              "Macaddr"
              "macaddr"
              "Macaddr"
              "MACADDR"
              "macaddr"
              "Macaddr"
              "MACADDR"
          , primitiveQueries
              Contract.Primitive.Macaddr8
              "macaddr8"
              "Macaddr8"
              "macaddr8"
              "Macaddr8"
              "MACADDR8"
              "macaddr8"
              "Macaddr8"
              "MACADDR8"
          , primitiveQueries
              Contract.Primitive.Money
              "money"
              "Money"
              "money"
              "Money"
              "MONEY"
              "money"
              "Money"
              "MONEY"
          , primitiveQueries
              Contract.Primitive.Name
              "name"
              "Name"
              "name"
              "Name"
              "NAME"
              "name"
              "Name"
              "NAME"
          , primitiveQueries
              Contract.Primitive.Numeric
              "numeric"
              "Numeric"
              "numeric"
              "Numeric"
              "NUMERIC"
              "numeric"
              "Numeric"
              "NUMERIC"
          , primitiveQueries
              Contract.Primitive.Nummultirange
              "nummultirange"
              "Nummultirange"
              "nummultirange"
              "Nummultirange"
              "NUMMULTIRANGE"
              "nummultirange"
              "Nummultirange"
              "NUMMULTIRANGE"
          , primitiveQueries
              Contract.Primitive.Numrange
              "numrange"
              "Numrange"
              "numrange"
              "Numrange"
              "NUMRANGE"
              "numrange"
              "Numrange"
              "NUMRANGE"
          , primitiveQueries
              Contract.Primitive.Oid
              "oid"
              "Oid"
              "oid"
              "Oid"
              "OID"
              "oid"
              "Oid"
              "OID"
          , primitiveQueries
              Contract.Primitive.Path
              "path"
              "Path"
              "path"
              "Path"
              "PATH"
              "path"
              "Path"
              "PATH"
          , primitiveQueries
              Contract.Primitive.PgLsn
              "pgLsn"
              "PgLsn"
              "pg-lsn"
              "Pg-Lsn"
              "PG-LSN"
              "pg_lsn"
              "Pg_Lsn"
              "PG_LSN"
          , primitiveQueries
              Contract.Primitive.PgSnapshot
              "pgSnapshot"
              "PgSnapshot"
              "pg-snapshot"
              "Pg-Snapshot"
              "PG-SNAPSHOT"
              "pg_snapshot"
              "Pg_Snapshot"
              "PG_SNAPSHOT"
          , primitiveQueries
              Contract.Primitive.Point
              "point"
              "Point"
              "point"
              "Point"
              "POINT"
              "point"
              "Point"
              "POINT"
          , primitiveQueries
              Contract.Primitive.Polygon
              "polygon"
              "Polygon"
              "polygon"
              "Polygon"
              "POLYGON"
              "polygon"
              "Polygon"
              "POLYGON"
          , primitiveQueries
              Contract.Primitive.Text
              "text"
              "Text"
              "text"
              "Text"
              "TEXT"
              "text"
              "Text"
              "TEXT"
          , primitiveQueries
              Contract.Primitive.Time
              "time"
              "Time"
              "time"
              "Time"
              "TIME"
              "time"
              "Time"
              "TIME"
          , primitiveQueries
              Contract.Primitive.Timestamp
              "timestamp"
              "Timestamp"
              "timestamp"
              "Timestamp"
              "TIMESTAMP"
              "timestamp"
              "Timestamp"
              "TIMESTAMP"
          , primitiveQueries
              Contract.Primitive.Timestamptz
              "timestamptz"
              "Timestamptz"
              "timestamptz"
              "Timestamptz"
              "TIMESTAMPTZ"
              "timestamptz"
              "Timestamptz"
              "TIMESTAMPTZ"
          , primitiveQueries
              Contract.Primitive.Timetz
              "timetz"
              "Timetz"
              "timetz"
              "Timetz"
              "TIMETZ"
              "timetz"
              "Timetz"
              "TIMETZ"
          , primitiveQueries
              Contract.Primitive.Tsmultirange
              "tsmultirange"
              "Tsmultirange"
              "tsmultirange"
              "Tsmultirange"
              "TSMULTIRANGE"
              "tsmultirange"
              "Tsmultirange"
              "TSMULTIRANGE"
          , primitiveQueries
              Contract.Primitive.Tsquery
              "tsquery"
              "Tsquery"
              "tsquery"
              "Tsquery"
              "TSQUERY"
              "tsquery"
              "Tsquery"
              "TSQUERY"
          , primitiveQueries
              Contract.Primitive.Tsrange
              "tsrange"
              "Tsrange"
              "tsrange"
              "Tsrange"
              "TSRANGE"
              "tsrange"
              "Tsrange"
              "TSRANGE"
          , primitiveQueries
              Contract.Primitive.Tstzmultirange
              "tstzmultirange"
              "Tstzmultirange"
              "tstzmultirange"
              "Tstzmultirange"
              "TSTZMULTIRANGE"
              "tstzmultirange"
              "Tstzmultirange"
              "TSTZMULTIRANGE"
          , primitiveQueries
              Contract.Primitive.Tstzrange
              "tstzrange"
              "Tstzrange"
              "tstzrange"
              "Tstzrange"
              "TSTZRANGE"
              "tstzrange"
              "Tstzrange"
              "TSTZRANGE"
          , primitiveQueries
              Contract.Primitive.Tsvector
              "tsvector"
              "Tsvector"
              "tsvector"
              "Tsvector"
              "TSVECTOR"
              "tsvector"
              "Tsvector"
              "TSVECTOR"
          , primitiveQueries
              Contract.Primitive.Uuid
              "uuid"
              "Uuid"
              "uuid"
              "Uuid"
              "UUID"
              "uuid"
              "Uuid"
              "UUID"
          , primitiveQueries
              Contract.Primitive.Varbit
              "varbit"
              "Varbit"
              "varbit"
              "Varbit"
              "VARBIT"
              "varbit"
              "Varbit"
              "VARBIT"
          , primitiveQueries
              Contract.Primitive.Varchar
              "varchar"
              "Varchar"
              "varchar"
              "Varchar"
              "VARCHAR"
              "varchar"
              "Varchar"
              "VARCHAR"
          , primitiveQueries
              Contract.Primitive.Xml
              "xml"
              "Xml"
              "xml"
              "Xml"
              "XML"
              "xml"
              "Xml"
              "XML"
          , moodDeclarations.queries
          , coordinatesDeclarations.queries
          , temperatureCelsiusDeclarations.queries
          , weatherReadingDeclarations.queries
          , [ idempotentNonIdentityQuery
            , nonIdempotentNonIdentityQuery
            , multiParamColQuery
            ]
          ]
    , migrations =
      [ { name = "1"
        , sql =
            ''
            create extension ltree;
            create extension hstore;
            create extension citext;
            ''
        }
      , { name = "2"
        , sql =
            ''
            create type mood as enum ('sad', 'ok', 'happy');
            create type coordinate as (x float8, y float8);
            create schema measurements;
            create domain measurements.temp_c as float8;
            create type weather_reading as (temperature measurements.temp_c);
            ''
        }
      ]
    }
