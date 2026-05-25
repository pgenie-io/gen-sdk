let Prelude = ../Deps/Prelude.dhall

let Project = ../Project.dhall

let Declarations =
      { customTypes : List Project.CustomType, queries : List Project.Query }

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
        : Project.Name

let scalarQueries =
      \(scalar : Project.Scalar) ->
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
              if Text/equal inSnakeCase "char" then "\"char\"" else inSnakeCase

        let column =
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
                            then  None Project.ArraySettings
                            else  Some { dimensionality, elementIsNullable }
                        , scalar
                        }
                      }

                let dimensionality = Natural/show dimensionality

                let nullable = if nullable then "1" else "0"

                let elementIsNullable = if elementIsNullable then "1" else "0"

                let memberName =
                      name
                        "${inCamelCase}${nullable}${dimensionality}${elementIsNullable}"
                        "${inPascalCase}${nullable}${dimensionality}${elementIsNullable}"
                        "${inKebabCase}-${nullable}-${dimensionality}-${elementIsNullable}"
                        "${inTrainCase}-${nullable}-${dimensionality}-${elementIsNullable}"
                        "${inScreamingKebabCase}-${nullable}-${dimensionality}-${elementIsNullable}"
                        "${inSnakeCase}_${nullable}_${dimensionality}_${elementIsNullable}"
                        "${inCamelSnakeCase}_${nullable}_${dimensionality}_${elementIsNullable}"
                        "${inScreamingSnakeCase}_${nullable}_${dimensionality}_${elementIsNullable}"

                let member =
                          member
                      //  { name = memberName
                          , pgName =
                              "${inSnakeCase}_${nullable}_${dimensionality}_${elementIsNullable}"
                          }

                in  { member, typeSig }

        let col100 = column True 0 False

        let col110 = column True 1 False

        let col120 = column True 2 False

        let col111 = column True 1 True

        let col121 = column True 2 True

        let col000 = column False 0 False

        let col010 = column False 1 False

        let col020 = column False 2 False

        let col011 = column False 1 True

        let col021 = column False 2 True

        let queryName =
              name
                "select${inPascalCase}"
                "Select${inPascalCase}"
                "select-${inKebabCase}"
                "Select-${inTrainCase}"
                "SELECT-${inScreamingKebabCase}"
                "select_${inSnakeCase}"
                "Select_${inCamelSnakeCase}"
                "SELECT_${inScreamingSnakeCase}"

        in  [ { name = queryName
              , srcPath = "./queries/${queryName.inSnakeCase}.sql"
              , identity = True
              , idempotent = True
              , params =
                [ col100.member
                , col110.member
                , col120.member
                , col111.member
                , col121.member
                , col000.member
                , col010.member
                , col020.member
                , col011.member
                , col021.member
                ]
              , result =
                  Project.Result.Rows
                    { cardinality = Project.ResultRowsCardinality.Multiple
                    , columns =
                      { head = col100.member
                      , tail =
                        [ col110.member
                        , col120.member
                        , col111.member
                        , col121.member
                        , col000.member
                        , col010.member
                        , col020.member
                        , col011.member
                        , col021.member
                        ]
                      }
                    }
              , fragments =
                [ Project.QueryFragment.Sql "select "
                , Project.QueryFragment.Var
                    { name = col100.member.name
                    , rawName = col100.member.pgName
                    , paramIndex = 0
                    }
                , Project.QueryFragment.Sql "::${col100.typeSig}, "
                , Project.QueryFragment.Var
                    { name = col110.member.name
                    , rawName = col110.member.pgName
                    , paramIndex = 1
                    }
                , Project.QueryFragment.Sql "::${col110.typeSig}, "
                , Project.QueryFragment.Var
                    { name = col120.member.name
                    , rawName = col120.member.pgName
                    , paramIndex = 2
                    }
                , Project.QueryFragment.Sql "::${col120.typeSig}, "
                , Project.QueryFragment.Var
                    { name = col111.member.name
                    , rawName = col111.member.pgName
                    , paramIndex = 3
                    }
                , Project.QueryFragment.Sql "::${col111.typeSig}, "
                , Project.QueryFragment.Var
                    { name = col121.member.name
                    , rawName = col121.member.pgName
                    , paramIndex = 4
                    }
                , Project.QueryFragment.Sql "::${col121.typeSig}, "
                , Project.QueryFragment.Var
                    { name = col000.member.name
                    , rawName = col000.member.pgName
                    , paramIndex = 5
                    }
                , Project.QueryFragment.Sql "::${col000.typeSig}, "
                , Project.QueryFragment.Var
                    { name = col010.member.name
                    , rawName = col010.member.pgName
                    , paramIndex = 6
                    }
                , Project.QueryFragment.Sql "::${col010.typeSig}, "
                , Project.QueryFragment.Var
                    { name = col020.member.name
                    , rawName = col020.member.pgName
                    , paramIndex = 7
                    }
                , Project.QueryFragment.Sql "::${col020.typeSig}, "
                , Project.QueryFragment.Var
                    { name = col011.member.name
                    , rawName = col011.member.pgName
                    , paramIndex = 8
                    }
                , Project.QueryFragment.Sql "::${col011.typeSig}, "
                , Project.QueryFragment.Var
                    { name = col021.member.name
                    , rawName = col021.member.pgName
                    , paramIndex = 9
                    }
                , Project.QueryFragment.Sql "::${col021.typeSig}"
                ]
              }
            ]

let primitiveQueries =
      \(primitive : Project.Primitive) ->
        scalarQueries (Project.Scalar.Primitive primitive)

let customTypeDeclarations =
      \(definition : Project.CustomTypeDefinition) ->
      \(inCamelCase : Text) ->
      \(inPascalCase : Text) ->
      \(inKebabCase : Text) ->
      \(inTrainCase : Text) ->
      \(inScreamingKebabCase : Text) ->
      \(inSnakeCase : Text) ->
      \(inCamelSnakeCase : Text) ->
      \(inScreamingSnakeCase : Text) ->
          { customTypes =
            [ { name =
                  name
                    inCamelCase
                    inPascalCase
                    inKebabCase
                    inTrainCase
                    inScreamingKebabCase
                    inSnakeCase
                    inCamelSnakeCase
                    inScreamingSnakeCase
              , pgSchema = "public"
              , pgName = inSnakeCase
              , definition
              }
            ]
          , queries =
              scalarQueries
                ( Project.Scalar.Custom
                    ( name
                        inCamelCase
                        inPascalCase
                        inKebabCase
                        inTrainCase
                        inScreamingKebabCase
                        inSnakeCase
                        inCamelSnakeCase
                        inScreamingSnakeCase
                    )
                )
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
      \(values : List Project.EnumVariant) ->
        customTypeDeclarations (Project.CustomTypeDefinition.Enum values)

let compositeDeclarations =
      \(members : List Project.Member) ->
        customTypeDeclarations (Project.CustomTypeDefinition.Composite members)

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

let coordinatesDeclarations =
      compositeDeclarations
        [ { name = name "x" "X" "x" "X" "X" "x" "X" "X"
          , pgName = "x"
          , isNullable = True
          , value =
            { arraySettings = None Project.ArraySettings
            , scalar = Project.Scalar.Primitive Project.Primitive.Float8
            }
          }
        , { name = name "y" "Y" "y" "Y" "Y" "y" "Y" "Y"
          , pgName = "y"
          , isNullable = True
          , value =
            { arraySettings = None Project.ArraySettings
            , scalar = Project.Scalar.Primitive Project.Primitive.Float8
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

let idempotentNonIdentityQuery
    : Project.Query
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
      , params = [] : List Project.Member
      , result = Project.Result.Void
      , fragments =
        [ Project.QueryFragment.Sql "set application_name = 'pgenie_fixture'" ]
      }

let nonIdempotentNonIdentityQuery
    : Project.Query
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
      , params = [] : List Project.Member
      , result = Project.Result.Void
      , fragments =
        [ Project.QueryFragment.Sql "notify fixture_channel, 'fixture'" ]
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
          Project.CustomType
          [ moodDeclarations.customTypes, coordinatesDeclarations.customTypes ]
    , queries =
        Prelude.List.concat
          Project.Query
          [ primitiveQueries
              Project.Primitive.Bit
              "bit"
              "Bit"
              "bit"
              "Bit"
              "BIT"
              "bit"
              "Bit"
              "BIT"
          , primitiveQueries
              Project.Primitive.Bool
              "bool"
              "Bool"
              "bool"
              "Bool"
              "BOOL"
              "bool"
              "Bool"
              "BOOL"
          , primitiveQueries
              Project.Primitive.Box
              "box"
              "Box"
              "box"
              "Box"
              "BOX"
              "box"
              "Box"
              "BOX"
          , primitiveQueries
              Project.Primitive.Bpchar
              "bpchar"
              "Bpchar"
              "bpchar"
              "Bpchar"
              "BPCHAR"
              "bpchar"
              "Bpchar"
              "BPCHAR"
          , primitiveQueries
              Project.Primitive.Bytea
              "bytea"
              "Bytea"
              "bytea"
              "Bytea"
              "BYTEA"
              "bytea"
              "Bytea"
              "BYTEA"
          , primitiveQueries
              Project.Primitive.Char
              "char"
              "Char"
              "char"
              "Char"
              "CHAR"
              "char"
              "Char"
              "CHAR"
          , primitiveQueries
              Project.Primitive.Cidr
              "cidr"
              "Cidr"
              "cidr"
              "Cidr"
              "CIDR"
              "cidr"
              "Cidr"
              "CIDR"
          , primitiveQueries
              Project.Primitive.Circle
              "circle"
              "Circle"
              "circle"
              "Circle"
              "CIRCLE"
              "circle"
              "Circle"
              "CIRCLE"
          , primitiveQueries
              Project.Primitive.Citext
              "citext"
              "Citext"
              "citext"
              "Citext"
              "CITEXT"
              "citext"
              "Citext"
              "CITEXT"
          , primitiveQueries
              Project.Primitive.Date
              "date"
              "Date"
              "date"
              "Date"
              "DATE"
              "date"
              "Date"
              "DATE"
          , primitiveQueries
              Project.Primitive.Datemultirange
              "datemultirange"
              "Datemultirange"
              "datemultirange"
              "Datemultirange"
              "DATEMULTIRANGE"
              "datemultirange"
              "Datemultirange"
              "DATEMULTIRANGE"
          , primitiveQueries
              Project.Primitive.Daterange
              "daterange"
              "Daterange"
              "daterange"
              "Daterange"
              "DATERANGE"
              "daterange"
              "Daterange"
              "DATERANGE"
          , primitiveQueries
              Project.Primitive.Float4
              "float4"
              "Float4"
              "float4"
              "Float4"
              "FLOAT4"
              "float4"
              "Float4"
              "FLOAT4"
          , primitiveQueries
              Project.Primitive.Float8
              "float8"
              "Float8"
              "float8"
              "Float8"
              "FLOAT8"
              "float8"
              "Float8"
              "FLOAT8"
          , primitiveQueries
              Project.Primitive.Hstore
              "hstore"
              "Hstore"
              "hstore"
              "Hstore"
              "HSTORE"
              "hstore"
              "Hstore"
              "HSTORE"
          , primitiveQueries
              Project.Primitive.Inet
              "inet"
              "Inet"
              "inet"
              "Inet"
              "INET"
              "inet"
              "Inet"
              "INET"
          , primitiveQueries
              Project.Primitive.Int2
              "int2"
              "Int2"
              "int2"
              "Int2"
              "INT2"
              "int2"
              "Int2"
              "INT2"
          , primitiveQueries
              Project.Primitive.Int4
              "int4"
              "Int4"
              "int4"
              "Int4"
              "INT4"
              "int4"
              "Int4"
              "INT4"
          , primitiveQueries
              Project.Primitive.Int4multirange
              "int4multirange"
              "Int4multirange"
              "int4multirange"
              "Int4multirange"
              "INT4MULTIRANGE"
              "int4multirange"
              "Int4multirange"
              "INT4MULTIRANGE"
          , primitiveQueries
              Project.Primitive.Int4range
              "int4range"
              "Int4range"
              "int4range"
              "Int4range"
              "INT4RANGE"
              "int4range"
              "Int4range"
              "INT4RANGE"
          , primitiveQueries
              Project.Primitive.Int8
              "int8"
              "Int8"
              "int8"
              "Int8"
              "INT8"
              "int8"
              "Int8"
              "INT8"
          , primitiveQueries
              Project.Primitive.Int8multirange
              "int8multirange"
              "Int8multirange"
              "int8multirange"
              "Int8multirange"
              "INT8MULTIRANGE"
              "int8multirange"
              "Int8multirange"
              "INT8MULTIRANGE"
          , primitiveQueries
              Project.Primitive.Int8range
              "int8range"
              "Int8range"
              "int8range"
              "Int8range"
              "INT8RANGE"
              "int8range"
              "Int8range"
              "INT8RANGE"
          , primitiveQueries
              Project.Primitive.Interval
              "interval"
              "Interval"
              "interval"
              "Interval"
              "INTERVAL"
              "interval"
              "Interval"
              "INTERVAL"
          , primitiveQueries
              Project.Primitive.Json
              "json"
              "Json"
              "json"
              "Json"
              "JSON"
              "json"
              "Json"
              "JSON"
          , primitiveQueries
              Project.Primitive.Jsonb
              "jsonb"
              "Jsonb"
              "jsonb"
              "Jsonb"
              "JSONB"
              "jsonb"
              "Jsonb"
              "JSONB"
          , primitiveQueries
              Project.Primitive.Line
              "line"
              "Line"
              "line"
              "Line"
              "LINE"
              "line"
              "Line"
              "LINE"
          , primitiveQueries
              Project.Primitive.Lseg
              "lseg"
              "Lseg"
              "lseg"
              "Lseg"
              "LSEG"
              "lseg"
              "Lseg"
              "LSEG"
          , primitiveQueries
              Project.Primitive.Ltree
              "ltree"
              "Ltree"
              "ltree"
              "Ltree"
              "LTREE"
              "ltree"
              "Ltree"
              "LTREE"
          , primitiveQueries
              Project.Primitive.Macaddr
              "macaddr"
              "Macaddr"
              "macaddr"
              "Macaddr"
              "MACADDR"
              "macaddr"
              "Macaddr"
              "MACADDR"
          , primitiveQueries
              Project.Primitive.Macaddr8
              "macaddr8"
              "Macaddr8"
              "macaddr8"
              "Macaddr8"
              "MACADDR8"
              "macaddr8"
              "Macaddr8"
              "MACADDR8"
          , primitiveQueries
              Project.Primitive.Money
              "money"
              "Money"
              "money"
              "Money"
              "MONEY"
              "money"
              "Money"
              "MONEY"
          , primitiveQueries
              Project.Primitive.Name
              "name"
              "Name"
              "name"
              "Name"
              "NAME"
              "name"
              "Name"
              "NAME"
          , primitiveQueries
              Project.Primitive.Numeric
              "numeric"
              "Numeric"
              "numeric"
              "Numeric"
              "NUMERIC"
              "numeric"
              "Numeric"
              "NUMERIC"
          , primitiveQueries
              Project.Primitive.Nummultirange
              "nummultirange"
              "Nummultirange"
              "nummultirange"
              "Nummultirange"
              "NUMMULTIRANGE"
              "nummultirange"
              "Nummultirange"
              "NUMMULTIRANGE"
          , primitiveQueries
              Project.Primitive.Numrange
              "numrange"
              "Numrange"
              "numrange"
              "Numrange"
              "NUMRANGE"
              "numrange"
              "Numrange"
              "NUMRANGE"
          , primitiveQueries
              Project.Primitive.Oid
              "oid"
              "Oid"
              "oid"
              "Oid"
              "OID"
              "oid"
              "Oid"
              "OID"
          , primitiveQueries
              Project.Primitive.Path
              "path"
              "Path"
              "path"
              "Path"
              "PATH"
              "path"
              "Path"
              "PATH"
          , primitiveQueries
              Project.Primitive.PgLsn
              "pgLsn"
              "PgLsn"
              "pg-lsn"
              "Pg-Lsn"
              "PG-LSN"
              "pg_lsn"
              "Pg_Lsn"
              "PG_LSN"
          , primitiveQueries
              Project.Primitive.PgSnapshot
              "pgSnapshot"
              "PgSnapshot"
              "pg-snapshot"
              "Pg-Snapshot"
              "PG-SNAPSHOT"
              "pg_snapshot"
              "Pg_Snapshot"
              "PG_SNAPSHOT"
          , primitiveQueries
              Project.Primitive.Point
              "point"
              "Point"
              "point"
              "Point"
              "POINT"
              "point"
              "Point"
              "POINT"
          , primitiveQueries
              Project.Primitive.Polygon
              "polygon"
              "Polygon"
              "polygon"
              "Polygon"
              "POLYGON"
              "polygon"
              "Polygon"
              "POLYGON"
          , primitiveQueries
              Project.Primitive.Text
              "text"
              "Text"
              "text"
              "Text"
              "TEXT"
              "text"
              "Text"
              "TEXT"
          , primitiveQueries
              Project.Primitive.Time
              "time"
              "Time"
              "time"
              "Time"
              "TIME"
              "time"
              "Time"
              "TIME"
          , primitiveQueries
              Project.Primitive.Timestamp
              "timestamp"
              "Timestamp"
              "timestamp"
              "Timestamp"
              "TIMESTAMP"
              "timestamp"
              "Timestamp"
              "TIMESTAMP"
          , primitiveQueries
              Project.Primitive.Timestamptz
              "timestamptz"
              "Timestamptz"
              "timestamptz"
              "Timestamptz"
              "TIMESTAMPTZ"
              "timestamptz"
              "Timestamptz"
              "TIMESTAMPTZ"
          , primitiveQueries
              Project.Primitive.Timetz
              "timetz"
              "Timetz"
              "timetz"
              "Timetz"
              "TIMETZ"
              "timetz"
              "Timetz"
              "TIMETZ"
          , primitiveQueries
              Project.Primitive.Tsmultirange
              "tsmultirange"
              "Tsmultirange"
              "tsmultirange"
              "Tsmultirange"
              "TSMULTIRANGE"
              "tsmultirange"
              "Tsmultirange"
              "TSMULTIRANGE"
          , primitiveQueries
              Project.Primitive.Tsquery
              "tsquery"
              "Tsquery"
              "tsquery"
              "Tsquery"
              "TSQUERY"
              "tsquery"
              "Tsquery"
              "TSQUERY"
          , primitiveQueries
              Project.Primitive.Tsrange
              "tsrange"
              "Tsrange"
              "tsrange"
              "Tsrange"
              "TSRANGE"
              "tsrange"
              "Tsrange"
              "TSRANGE"
          , primitiveQueries
              Project.Primitive.Tstzmultirange
              "tstzmultirange"
              "Tstzmultirange"
              "tstzmultirange"
              "Tstzmultirange"
              "TSTZMULTIRANGE"
              "tstzmultirange"
              "Tstzmultirange"
              "TSTZMULTIRANGE"
          , primitiveQueries
              Project.Primitive.Tstzrange
              "tstzrange"
              "Tstzrange"
              "tstzrange"
              "Tstzrange"
              "TSTZRANGE"
              "tstzrange"
              "Tstzrange"
              "TSTZRANGE"
          , primitiveQueries
              Project.Primitive.Tsvector
              "tsvector"
              "Tsvector"
              "tsvector"
              "Tsvector"
              "TSVECTOR"
              "tsvector"
              "Tsvector"
              "TSVECTOR"
          , primitiveQueries
              Project.Primitive.Uuid
              "uuid"
              "Uuid"
              "uuid"
              "Uuid"
              "UUID"
              "uuid"
              "Uuid"
              "UUID"
          , primitiveQueries
              Project.Primitive.Varbit
              "varbit"
              "Varbit"
              "varbit"
              "Varbit"
              "VARBIT"
              "varbit"
              "Varbit"
              "VARBIT"
          , primitiveQueries
              Project.Primitive.Varchar
              "varchar"
              "Varchar"
              "varchar"
              "Varchar"
              "VARCHAR"
              "varchar"
              "Varchar"
              "VARCHAR"
          , primitiveQueries
              Project.Primitive.Xml
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
          , [ idempotentNonIdentityQuery, nonIdempotentNonIdentityQuery ]
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
            ''
        }
      ]
    }
