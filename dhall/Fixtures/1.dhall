let _90 = < Optional | Single | Multiple >

let _89 =
      < Bit
      | Bool
      | Box
      | Box2D
      | Box3D
      | Bpchar
      | Bytea
      | Char
      | Cidr
      | Circle
      | Citext
      | Date
      | Datemultirange
      | Daterange
      | Float4
      | Float8
      | Geography
      | Geometry
      | Hstore
      | Inet
      | Int2
      | Int4
      | Int4multirange
      | Int4range
      | Int8
      | Int8multirange
      | Int8range
      | Interval
      | Json
      | Jsonb
      | Line
      | Lseg
      | Ltree
      | Macaddr
      | Macaddr8
      | Money
      | Name
      | Numeric
      | Nummultirange
      | Numrange
      | Oid
      | Path
      | PgLsn
      | PgSnapshot
      | Point
      | Polygon
      | Text
      | Time
      | Timestamp
      | Timestamptz
      | Timetz
      | Tsmultirange
      | Tsquery
      | Tsrange
      | Tstzmultirange
      | Tstzrange
      | Tsvector
      | Uuid
      | Varbit
      | Varchar
      | Xml
      >

let _88 =
      < A
      | B
      | C
      | D
      | E
      | F
      | G
      | H
      | I
      | J
      | K
      | L
      | M
      | N
      | O
      | P
      | Q
      | R
      | S
      | T
      | U
      | V
      | W
      | X
      | Y
      | Z
      >

let _87 = _90.Multiple

let _86 = _88.Y

let _85 = _88.V

let _84 = _88.U

let _83 = _88.T

let _82 = _88.S

let _81 = _88.R

let _80 = _88.P

let _79 = _88.O

let _78 = _88.N

let _77 = _88.M

let _76 = _88.L

let _75 = _88.K

let _74 = _88.I

let _73 = _88.G

let _72 = _88.F

let _71 = _88.E

let _70 = _88.D

let _69 = _88.C

let _68 = _88.B

let _67 = _88.A

let _66 = { dimensionality : Natural, elementIsNullable : Bool }

let _65 = [ _86 ]

let _64 = [ _70 ]

let _63 = { head : _88, tail : List _88 }

let _62 = None _66

let _61 = < Word : _63 | Number : Natural >

let _60 = _61.Word

let _59 = List _61

let _58 = { head = _78, tail = [ _67, _77, _71 ] }

let _57 = { head = _70, tail = [ _74, _82, _69 ] }

let _56 = [] : _59

let _55 = { head = _67, tail = [ _76, _68, _84, _77 ] }

let _54 = { head = _84, tail = [ _80, _70, _67, _83, _71 ] }

let _53 = { head = _83, tail = [ _81, _67, _69, _75, _82 ] }

let _52 = { head = _82, tail = [ _71, _76, _71, _69, _83 ] }

let _51 = { head = _72, tail = [ _79, _81, _77, _67, _83 ] }

let _50 = { head = _67, tail = [ _81, _83, _74, _82, _83 ] }

let _49 = { head : _63, tail : _59 }

let _48 = _60 { head = _68, tail = _65 }

let _47 = < Primitive : _89 | Custom : _49 >

let _46 = { head = { head = _74, tail = _64 }, tail = _56 }

let _45 = _47.Primitive

let _44 = _47.Custom

let _43 = { head = _81, tail = [ _71, _76, _71, _67, _82, _71, _70 ] }

let _42 = _60 _58

let _41 =
      < Sql : Text
      | Var : { name : _49, rawName : Text, paramIndex : Natural }
      >

let _40 = { head = _81, tail = [ _71, _69, _79, _81, _70, _74, _78, _73 ] }

let _39 = [ _60 { head = _74, tail = [ _78, _72, _79 ] } ]

let _38 = _41.Var

let _37 = _41.Sql

let _36 = { head = _58, tail = _56 }

let _35 = _60 _55

let _34 = _45 _89.Text

let _33 = { arraySettings : Optional _66, scalar : _47 }

let _32 = _60 _51

let _31 = _37 ", "

let _30 =
      _37
        ''

        where id = ''

let _29 = { head = _51, tail = _56 }

let _28 = { head = _50, tail = _56 }

let _27 = { arraySettings = _62, scalar = _34 }

let _26 = { arraySettings = _62, scalar = _45 _89.Int4 }

let _25 = { arraySettings = _62, scalar = _45 _89.Date }

let _24 = { head = _43, tail = _56 }

let _23 = { head = _40, tail = _56 }

let _22 = { head = _57, tail = _39 }

let _21 = { head = { head = _83, tail = [ _81, _67, _69, _75 ] }, tail = _39 }

let _20 = { head = _55, tail = [ _32 ] }

let _19 = { head = _40, tail = _39 }

let _18 = { name : _49, pgName : Text, isNullable : Bool, value : _33 }

let _17 = _38 { name = _46, rawName = "id", paramIndex = 1 }

let _16 = List _18

let _15 = _38 { name = _36, rawName = "name", paramIndex = 0 }

let _14 =
      { name = _46
      , pgName = "id"
      , isNullable = False
      , value = { arraySettings = _62, scalar = _45 _89.Int8 }
      }

let _13 = { name = _36, pgName = "name", isNullable = False, value = _27 }

let _12 = [ _13 ]

let _11 = { name = _24, pgName = "released", isNullable = True, value = _25 }

let _10 = { arraySettings = _62, scalar = _44 _20 }

let _9 = { arraySettings = _62, scalar = _44 _19 }

let _8 =
      { name = { head = _57, tail = _56 }
      , pgName = "disc"
      , isNullable = True
      , value = { arraySettings = _62, scalar = _44 _22 }
      }

let _7 =
      { name = { head = _53, tail = _56 }
      , pgName = "tracks"
      , isNullable = True
      , value =
        { arraySettings = Some { dimensionality = 1, elementIsNullable = False }
        , scalar = _44 _21
        }
      }

let _6 =
      < Composite : _16
      | Enum : List { name : _49, pgName : Text }
      | Domain : _33
      >

let _5 = _6.Composite

let _4 = { name = _29, pgName = "format", isNullable = True, value = _10 }

let _3 = { name = _29, pgName = "format", isNullable = False, value = _10 }

let _2 = { name = _23, pgName = "recording", isNullable = True, value = _9 }

let _1 =
      Some
        { cardinality = _87
        , columns = { head = _14, tail = [ _13, _11, _4, _2 ] }
        }

in  { space =
      { head = { head = _77, tail = _65 }
      , tail = [ _60 { head = _82, tail = [ _80, _67, _69, _71 ] } ]
      }
    , name =
      { head = { head = _77, tail = [ _84, _82, _74, _69 ] }
      , tail =
        [ _60 { head = _69, tail = [ _67, _83, _67, _76, _79, _73, _84, _71 ] }
        ]
      }
    , version = { major = 1, minor = 0, patch = 0 }
    , customTypes =
      [ { name = _20
        , pgSchema = "public"
        , pgName = "album_format"
        , definition =
            _6.Enum
              [ { name =
                  { head = { head = _85, tail = [ _74, _78, _86, _76 ] }
                  , tail = _56
                  }
                , pgName = "Vinyl"
                }
              , { name = { head = { head = _69, tail = _64 }, tail = _56 }
                , pgName = "CD"
                }
              , { name =
                  { head =
                    { head = _69, tail = [ _67, _82, _82, _71, _83, _83, _71 ] }
                  , tail = _56
                  }
                , pgName = "Cassette"
                }
              , { name =
                  { head =
                    { head = _70, tail = [ _74, _73, _74, _83, _67, _76 ] }
                  , tail = _56
                  }
                , pgName = "Digital"
                }
              , { name =
                  { head = { head = _70, tail = [ _85, _70 ] }
                  , tail = [ _60 { head = _67, tail = [ _84, _70, _74, _79 ] } ]
                  }
                , pgName = "DVD-Audio"
                }
              , { name =
                  { head = { head = _82, tail = [ _67, _69, _70 ] }
                  , tail = _56
                  }
                , pgName = "SACD"
                }
              ]
        }
      , { name = _22
        , pgSchema = "public"
        , pgName = "disc_info"
        , definition =
            _5
              [ { name = _36, pgName = "name", isNullable = True, value = _27 }
              , _2
              ]
        }
      , { name = _19
        , pgSchema = "public"
        , pgName = "recording_info"
        , definition =
            _5
              [ { name =
                  { head = { head = _82, tail = [ _83, _84, _70, _74, _79 ] }
                  , tail = [ _42 ]
                  }
                , pgName = "studio_name"
                , isNullable = True
                , value = _27
                }
              , { name =
                  { head = { head = _69, tail = [ _74, _83, _86 ] }
                  , tail = _56
                  }
                , pgName = "city"
                , isNullable = True
                , value = _27
                }
              , { name =
                  { head =
                    { head = _69, tail = [ _79, _84, _78, _83, _81, _86 ] }
                  , tail = _56
                  }
                , pgName = "country"
                , isNullable = True
                , value = _27
                }
              , { name =
                  { head =
                    { head = _81, tail = [ _71, _69, _79, _81, _70, _71, _70 ] }
                  , tail = [ _60 { head = _70, tail = [ _67, _83, _71 ] } ]
                  }
                , pgName = "recorded_date"
                , isNullable = True
                , value = _25
                }
              ]
        }
      , { name = _21
        , pgSchema = "public"
        , pgName = "track_info"
        , definition =
            _5
              [ { name =
                  { head = { head = _83, tail = [ _74, _83, _76, _71 ] }
                  , tail = _56
                  }
                , pgName = "title"
                , isNullable = True
                , value = _27
                }
              , { name =
                  { head =
                    { head = _70, tail = [ _84, _81, _67, _83, _74, _79, _78 ] }
                  , tail =
                    [ _60
                        { head = _82, tail = [ _71, _69, _79, _78, _70, _82 ] }
                    ]
                  }
                , pgName = "duration_seconds"
                , isNullable = True
                , value = _26
                }
              , { name =
                  { head = { head = _83, tail = [ _67, _73, _82 ] }
                  , tail = _56
                  }
                , pgName = "tags"
                , isNullable = True
                , value =
                  { arraySettings = Some
                    { dimensionality = 1, elementIsNullable = True }
                  , scalar = _34
                  }
                }
              ]
        }
      ]
    , queries =
      [ { name =
          { head = { head = _74, tail = [ _78, _82, _71, _81, _83 ] }
          , tail = [ _35 ]
          }
        , srcPath = "./queries/insert_album.sql"
        , idempotent = False
        , params =
          [ _13
          , { name = _24, pgName = "released", isNullable = False, value = _25 }
          , _3
          , { name = _23, pgName = "recording", isNullable = False, value = _9 }
          ]
        , result = Some
          { cardinality = _90.Single
          , columns = { head = _14, tail = [] : _16 }
          }
        , fragments =
          [ _37
              ''
              insert into album (name, released, format, recording)
              values (''
          , _15
          , _31
          , _38 { name = _24, rawName = "released", paramIndex = 1 }
          , _31
          , _38 { name = _29, rawName = "format", paramIndex = 2 }
          , _31
          , _38 { name = _23, rawName = "recording", paramIndex = 3 }
          , _37
              ''
              )
              returning id''
          ]
        }
      , { name = { head = _52, tail = [ _35, _48, _32 ] }
        , srcPath = "./queries/select_album_by_format.sql"
        , idempotent = True
        , params = [ _3 ]
        , result = _1
        , fragments =
          [ _37
              ''
              select
                id,
                name,
                released,
                format,
                recording
              from album
              where format = ''
          , _38 { name = _29, rawName = "format", paramIndex = 0 }
          ]
        }
      , { name = { head = _52, tail = [ _35, _48, _42 ] }
        , srcPath = "./queries/select_album_by_name.sql"
        , idempotent = True
        , params = _12
        , result = _1
        , fragments =
          [ _37
              ''
              select
                id,
                name,
                released,
                format,
                recording
              from album
              where name = ''
          , _15
          ]
        }
      , { name =
          { head = _52
          , tail =
            [ _35, _60 { head = _88.W, tail = [ _74, _83, _88.H ] }, _60 _53 ]
          }
        , srcPath = "./queries/select_album_with_tracks.sql"
        , idempotent = True
        , params = [ _14 ]
        , result = Some
          { cardinality = _87
          , columns = { head = _14, tail = [ _13, _7, _8 ] }
          }
        , fragments =
          [ _37
              ''
              select id, name, tracks, disc
              from album
              where id = ''
          , _38 { name = _46, rawName = "id", paramIndex = 0 }
          ]
        }
      , { name =
          { head = _52
          , tail =
            [ _60 { head = _73, tail = [ _71, _78, _81, _71 ] }, _48, _60 _50 ]
          }
        , srcPath = "./queries/select_genre_by_artist.sql"
        , idempotent = True
        , params =
          [ { name = _28, pgName = "artist", isNullable = False, value = _26 } ]
        , result = Some
          { cardinality = _87
          , columns =
            { head =
              { name = _46, pgName = "id", isNullable = False, value = _26 }
            , tail = _12
            }
          }
        , fragments =
          [ _37
              ''
              select id, genre.name
              from genre
              left join album_genre on album_genre.genre = genre.id
              left join album_artist on album_artist.album = album_genre.album
              where album_artist.artist = ''
          , _38 { name = _28, rawName = "artist", paramIndex = 0 }
          ]
        }
      , { name =
          { head = _54
          , tail =
            [ _35
            , _60 _40
            , _60
                { head = _81
                , tail = [ _71, _83, _84, _81, _78, _74, _78, _73 ]
                }
            ]
          }
        , srcPath = "./queries/update_album_recording_returning.sql"
        , idempotent = False
        , params = [ _2, _14 ]
        , result = Some
          { cardinality = _87
          , columns = { head = _14, tail = [ _13, _11, _4, _2, _7, _8 ] }
          }
        , fragments =
          [ _37
              ''
              -- Update album recording information
              update album
              set recording = ''
          , _38 { name = _23, rawName = "recording", paramIndex = 0 }
          , _30
          , _17
          , _37
              ''

              returning *''
          ]
        }
      , { name = { head = _54, tail = [ _35, _60 _43 ] }
        , srcPath = "./queries/update_album_released.sql"
        , idempotent = False
        , params = [ _11, _14 ]
        , result =
            None { cardinality : _90, columns : { head : _18, tail : _16 } }
        , fragments =
          [ _37
              ''
              update album
              set released = ''
          , _38 { name = _24, rawName = "released", paramIndex = 0 }
          , _30
          , _17
          ]
        }
      ]
    , migrations =
      [ { name = "1"
        , sql =
            ''

            create table "genre" (
              "id" int4 not null generated always as identity primary key,
              "name" text not null unique
            );

            create table "artist" (
              "id" int4 not null generated always as identity primary key,
              "name" text not null
            );

            create table "album" (
              "id" int4 not null generated always as identity primary key,
              -- Album name.
              "name" text not null,
              -- The date the album was first released.
              "released" date null
            );

            create table "album_genre" (
              "album" int4 not null references "album",
              "genre" int4 not null references "genre"
            );

            create table "album_artist" (
              "album" int4 not null references "album",
              "artist" int4 not null references "artist",
              -- Whether it is the primary artist
              "primary" bool not null,
              primary key ("album", "artist")
            );
            ''
        }
      , { name = "2"
        , sql =
            ''
            -- In this migration we're changing the type of the album "id" column
            -- from "int4" to "int8".
            -- Since this column is referenced from other tables, we also update them.


            alter table album
            alter column id type int8;

            alter table album_genre
            alter column album type int8;

            alter table album_artist
            alter column album type int8;
            ''
        }
      , { name = "3"
        , sql =
            ''
            -- Add enumeration type for album formats
            create type album_format as enum (
              'Vinyl',
              'CD',
              'Cassette',
              'Digital',
              'DVD-Audio',
              'SACD'
            );

            -- Add composite type for recording session information
            create type recording_info as (
              studio_name text,
              city text,
              country text,
              recorded_date date
            );

            -- Add format column to album table
            alter table album
            add column format album_format null;

            -- Add recording information to album table
            alter table album
            add column recording recording_info null;
            ''
        }
      , { name = "4"
        , sql =
            ''
            -- Composite with array fields: a track in an album
            create type track_info as (
              title text,
              duration_seconds int4,
              tags text[]
            );

            -- Composite with composites: disc information referencing a recording
            create type disc_info as (
              name text,
              recording recording_info
            );

            -- Edge case: array of composites column
            alter table album
            add column tracks track_info[] null;

            -- Edge case: composite with composites column
            alter table album
            add column disc disc_info null;
            ''
        }
      , { name = "5"
        , sql =
            ''
            CREATE INDEX ON album (recording);
            ''
        }
      ]
    }
