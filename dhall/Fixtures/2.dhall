let _109 = < Optional | Single | Multiple >

let _108 =
      < Bit
      | Bool
      | Box
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

let _107 =
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

let _106 = _109.Multiple

let _105 = _107.Y

let _104 = _107.V

let _103 = _107.U

let _102 = _107.T

let _101 = _107.S

let _100 = _107.R

let _99 = _107.P

let _98 = _107.O

let _97 = _107.N

let _96 = _107.M

let _95 = _107.L

let _94 = _107.K

let _93 = _107.I

let _92 = _107.G

let _91 = _107.F

let _90 = _107.E

let _89 = _107.D

let _88 = _107.C

let _87 = _107.B

let _86 = _107.A

let _85 = { dimensionality : Natural, elementIsNullable : Bool }

let _84 = [ _105 ]

let _83 = [ _89 ]

let _82 = { head : _107, tail : List _107 }

let _81 = None _85

let _80 = < Word : _82 | Number : Natural >

let _79 = _80.Word

let _78 = List _80

let _77 = { head = _97, tail = [ _86, _96, _90 ] }

let _76 = { head = _89, tail = [ _93, _101, _88 ] }

let _75 = [] : _78

let _74 = { head = _98, tail = [ _100, _89, _90, _100 ] }

let _73 = { head = _92, tail = [ _90, _97, _100, _90 ] }

let _72 = { head = _86, tail = [ _95, _87, _103, _96 ] }

let _71 = { head = _103, tail = [ _99, _89, _86, _102, _90 ] }

let _70 = { head = _102, tail = [ _100, _86, _88, _94, _101 ] }

let _69 = { head = _101, tail = [ _90, _95, _90, _88, _102 ] }

let _68 = { head = _91, tail = [ _98, _100, _96, _86, _102 ] }

let _67 = { head = _86, tail = [ _100, _102, _93, _101, _102 ] }

let _66 = { head : _82, tail : _78 }

let _65 = _79 { head = _87, tail = _84 }

let _64 = < Primitive : _108 | Custom : _66 >

let _63 = { head = { head = _93, tail = _83 }, tail = _75 }

let _62 = _64.Primitive

let _61 = _64.Custom

let _60 = { head = _100, tail = [ _90, _95, _90, _86, _101, _90, _89 ] }

let _59 = _79 { head = _107.W, tail = [ _93, _102, _107.H ] }

let _58 = _79 _77

let _57 =
      < Sql : Text
      | Var : { name : _66, rawName : Text, paramIndex : Natural }
      >

let _56 = { head = _100, tail = [ _90, _88, _98, _100, _89, _93, _97, _92 ] }

let _55 = [ _58 ]

let _54 = [ _79 { head = _93, tail = [ _97, _91, _98 ] } ]

let _53 = _57.Var

let _52 = _57.Sql

let _51 = { head = _77, tail = _75 }

let _50 = _79 _72

let _49 = _62 _108.Text

let _48 = { arraySettings : Optional _85, scalar : _64 }

let _47 = _79 _68

let _46 = _52 ", "

let _45 =
      _52
        ''
        )
          AND (''

let _44 =
      _52
        ''

        where id = ''

let _43 = { head = _70, tail = _75 }

let _42 = { head = _68, tail = _75 }

let _41 = { head = _67, tail = _75 }

let _40 = { arraySettings = _81, scalar = _49 }

let _39 = { arraySettings = _81, scalar = _62 _108.Int4 }

let _38 = { arraySettings = _81, scalar = _62 _108.Date }

let _37 = { arraySettings = _81, scalar = _62 _108.Bool }

let _36 = _79 _60

let _35 = { head = _60, tail = _75 }

let _34 = { head = _56, tail = _75 }

let _33 =
      { head = _77, tail = [ _79 { head = _95, tail = [ _93, _94, _90 ] } ] }

let _32 = { head = _76, tail = _54 }

let _31 = { head = { head = _102, tail = [ _100, _86, _88, _94 ] }, tail = _54 }

let _30 = { head = _73, tail = _55 }

let _29 = { head = _67, tail = _55 }

let _28 = { head = _72, tail = [ _47 ] }

let _27 =
      { head = _60
      , tail = [ _79 { head = _86, tail = [ _91, _102, _90, _100 ] } ]
      }

let _26 = { head = _56, tail = _54 }

let _25 = { name : _66, pgName : Text, isNullable : Bool, value : _48 }

let _24 = _53 { name = _63, rawName = "id", paramIndex = 1 }

let _23 = List _25

let _22 = _53 { name = _51, rawName = "name", paramIndex = 0 }

let _21 =
      { name = _63
      , pgName = "id"
      , isNullable = False
      , value = { arraySettings = _81, scalar = _62 _108.Int8 }
      }

let _20 = { head = _74, tail = [ _65, _58 ] }

let _19 = _53 { name = _42, rawName = "format", paramIndex = 2 }

let _18 = { name = _51, pgName = "name", isNullable = False, value = _40 }

let _17 = [ _18 ]

let _16 = { head = _74, tail = [ _65, _36 ] }

let _15 = _53 { name = _33, rawName = "name_like", paramIndex = 4 }

let _14 =
      { arraySettings = Some { dimensionality = 1, elementIsNullable = False }
      , scalar = _61 _31
      }

let _13 = _53 { name = _30, rawName = "genre_name", paramIndex = 1 }

let _12 = { name = _35, pgName = "released", isNullable = True, value = _38 }

let _11 = _53 { name = _29, rawName = "artist_name", paramIndex = 0 }

let _10 = { arraySettings = _81, scalar = _61 _28 }

let _9 = { arraySettings = _81, scalar = _61 _26 }

let _8 = _53 { name = _27, rawName = "released_after", paramIndex = 3 }

let _7 =
      { name = { head = _76, tail = _75 }
      , pgName = "disc"
      , isNullable = True
      , value = { arraySettings = _81, scalar = _61 _32 }
      }

let _6 =
      < Composite : _23
      | Enum : List { name : _66, pgName : Text }
      | Domain : _48
      >

let _5 = _6.Composite

let _4 = { name = _42, pgName = "format", isNullable = True, value = _10 }

let _3 = { name = _42, pgName = "format", isNullable = False, value = _10 }

let _2 = { name = _34, pgName = "recording", isNullable = True, value = _9 }

let _1 =
      Some
        { cardinality = _106
        , columns = { head = _21, tail = [ _18, _12, _4, _2 ] }
        }

in  { space =
      { head = { head = _96, tail = _84 }
      , tail = [ _79 { head = _101, tail = [ _99, _86, _88, _90 ] } ]
      }
    , name =
      { head = { head = _96, tail = [ _103, _101, _93, _88 ] }
      , tail =
        [ _79
            { head = _88, tail = [ _86, _102, _86, _95, _98, _92, _103, _90 ] }
        ]
      }
    , version = { major = 1, minor = 0, patch = 0 }
    , customTypes =
      [ { name = _28
        , pgSchema = "public"
        , pgName = "album_format"
        , definition =
            _6.Enum
              [ { name =
                  { head = { head = _104, tail = [ _93, _97, _105, _95 ] }
                  , tail = _75
                  }
                , pgName = "Vinyl"
                }
              , { name = { head = { head = _88, tail = _83 }, tail = _75 }
                , pgName = "CD"
                }
              , { name =
                  { head =
                    { head = _88
                    , tail = [ _86, _101, _101, _90, _102, _102, _90 ]
                    }
                  , tail = _75
                  }
                , pgName = "Cassette"
                }
              , { name =
                  { head =
                    { head = _89, tail = [ _93, _92, _93, _102, _86, _95 ] }
                  , tail = _75
                  }
                , pgName = "Digital"
                }
              , { name =
                  { head = { head = _89, tail = [ _104, _89 ] }
                  , tail =
                    [ _79 { head = _86, tail = [ _103, _89, _93, _98 ] } ]
                  }
                , pgName = "DVD-Audio"
                }
              , { name =
                  { head = { head = _101, tail = [ _86, _88, _89 ] }
                  , tail = _75
                  }
                , pgName = "SACD"
                }
              ]
        }
      , { name = _32
        , pgSchema = "public"
        , pgName = "disc_info"
        , definition =
            _5
              [ { name = _51, pgName = "name", isNullable = True, value = _40 }
              , _2
              ]
        }
      , { name = _26
        , pgSchema = "public"
        , pgName = "recording_info"
        , definition =
            _5
              [ { name =
                  { head = { head = _101, tail = [ _102, _103, _89, _93, _98 ] }
                  , tail = _55
                  }
                , pgName = "studio_name"
                , isNullable = True
                , value = _40
                }
              , { name =
                  { head = { head = _88, tail = [ _93, _102, _105 ] }
                  , tail = _75
                  }
                , pgName = "city"
                , isNullable = True
                , value = _40
                }
              , { name =
                  { head =
                    { head = _88, tail = [ _98, _103, _97, _102, _100, _105 ] }
                  , tail = _75
                  }
                , pgName = "country"
                , isNullable = True
                , value = _40
                }
              , { name =
                  { head =
                    { head = _100
                    , tail = [ _90, _88, _98, _100, _89, _90, _89 ]
                    }
                  , tail = [ _79 { head = _89, tail = [ _86, _102, _90 ] } ]
                  }
                , pgName = "recorded_date"
                , isNullable = True
                , value = _38
                }
              ]
        }
      , { name = _31
        , pgSchema = "public"
        , pgName = "track_info"
        , definition =
            _5
              [ { name =
                  { head = { head = _102, tail = [ _93, _102, _95, _90 ] }
                  , tail = _75
                  }
                , pgName = "title"
                , isNullable = True
                , value = _40
                }
              , { name =
                  { head =
                    { head = _89
                    , tail = [ _103, _100, _86, _102, _93, _98, _97 ]
                    }
                  , tail =
                    [ _79
                        { head = _101
                        , tail = [ _90, _88, _98, _97, _89, _101 ]
                        }
                    ]
                  }
                , pgName = "duration_seconds"
                , isNullable = True
                , value = _39
                }
              , { name =
                  { head = { head = _102, tail = [ _86, _92, _101 ] }
                  , tail = _75
                  }
                , pgName = "tags"
                , isNullable = True
                , value =
                  { arraySettings = Some
                    { dimensionality = 1, elementIsNullable = True }
                  , scalar = _49
                  }
                }
              ]
        }
      ]
    , queries =
      [ { name =
          { head = { head = _93, tail = [ _97, _101, _90, _100, _102 ] }
          , tail = [ _50 ]
          }
        , srcPath = "./queries/insert_album.sql"
        , params =
          [ _18
          , { name = _35, pgName = "released", isNullable = False, value = _38 }
          , _3
          , { name = _34, pgName = "recording", isNullable = False, value = _9 }
          ]
        , result = Some
          { cardinality = _109.Single
          , columns = { head = _21, tail = [] : _23 }
          }
        , fragments =
          [ _52
              ''
              insert into album (name, released, format, recording)
              values (''
          , _22
          , _46
          , _53 { name = _35, rawName = "released", paramIndex = 1 }
          , _46
          , _19
          , _46
          , _53 { name = _34, rawName = "recording", paramIndex = 3 }
          , _52
              ''
              )
              returning id''
          ]
        }
      , { name = { head = _69, tail = [ _50, _65, _47 ] }
        , srcPath = "./queries/select_album_by_format.sql"
        , params = [ _3 ]
        , result = _1
        , fragments =
          [ _52
              ''
              select
                id,
                name,
                released,
                format,
                recording
              from album
              where format = ''
          , _53 { name = _42, rawName = "format", paramIndex = 0 }
          ]
        }
      , { name = { head = _69, tail = [ _50, _65, _58 ] }
        , srcPath = "./queries/select_album_by_name.sql"
        , params = _17
        , result = _1
        , fragments =
          [ _52
              ''
              select
                id,
                name,
                released,
                format,
                recording
              from album
              where name = ''
          , _22
          ]
        }
      , { name =
          { head = _69
          , tail =
            [ _50
            , _59
            , _79 { head = _91, tail = [ _93, _95, _102, _90, _100, _101 ] }
            ]
          }
        , srcPath = "./queries/select_album_with_filters.sql"
        , params =
          [ { name = _29
            , pgName = "artist_name"
            , isNullable = True
            , value = _40
            }
          , { name = _30
            , pgName = "genre_name"
            , isNullable = True
            , value = _40
            }
          , _4
          , { name = _27
            , pgName = "released_after"
            , isNullable = True
            , value = { arraySettings = _81, scalar = _62 _108.Timestamp }
            }
          , { name = _33, pgName = "name_like", isNullable = True, value = _40 }
          , { name = _20
            , pgName = "order_by_name"
            , isNullable = False
            , value = _37
            }
          , { name = _16
            , pgName = "order_by_released"
            , isNullable = False
            , value = _37
            }
          ]
        , result = Some
          { cardinality = _106
          , columns = { head = _21, tail = [ _18, _12, _4 ] }
          }
        , fragments =
          [ _52
              ''
              SELECT
                album.id,
                album.name,
                album.released,
                album.format
              FROM album
              LEFT JOIN album_artist ON album_artist.album = album.id
              LEFT JOIN artist ON artist.id = album_artist.artist
              LEFT JOIN album_genre ON album_genre.album = album.id
              LEFT JOIN genre ON genre.id = album_genre.genre
              WHERE
                (''
          , _11
          , _52 "::text IS NULL OR artist.name = "
          , _11
          , _45
          , _13
          , _52 "::text IS NULL OR genre.name = "
          , _13
          , _45
          , _19
          , _52 "::album_format IS NULL OR album.format = "
          , _19
          , _45
          , _8
          , _52 "::timestamp IS NULL OR album.released >= "
          , _8
          , _45
          , _15
          , _52 "::text IS NULL OR album.name LIKE "
          , _15
          , _52
              ''
              )
              ORDER BY
                CASE WHEN ''
          , _53 { name = _20, rawName = "order_by_name", paramIndex = 5 }
          , _52
              ''
              ${" "}THEN album.name END ASC,
              ${" "} CASE WHEN ''
          , _53 { name = _16, rawName = "order_by_released", paramIndex = 6 }
          , _52 " THEN album.released END DESC"
          ]
        }
      , { name = { head = _69, tail = [ _50, _59, _79 _70 ] }
        , srcPath = "./queries/select_album_with_tracks.sql"
        , params = [ _21 ]
        , result = Some
          { cardinality = _106
          , columns =
            { head = _21
            , tail =
              [ _18
              , { name = _43
                , pgName = "tracks"
                , isNullable = False
                , value = _14
                }
              , _7
              ]
            }
          }
        , fragments =
          [ _52
              ''
              select id, name, tracks, disc
              from album
              where id = ''
          , _53 { name = _63, rawName = "id", paramIndex = 0 }
          ]
        }
      , { name = { head = _69, tail = [ _79 _73, _65, _79 _67 ] }
        , srcPath = "./queries/select_genre_by_artist.sql"
        , params =
          [ { name = _41, pgName = "artist", isNullable = False, value = _39 } ]
        , result = Some
          { cardinality = _106
          , columns =
            { head =
              { name = _63, pgName = "id", isNullable = False, value = _39 }
            , tail = _17
            }
          }
        , fragments =
          [ _52
              ''
              select id, genre.name
              from genre
              left join album_genre on album_genre.genre = genre.id
              left join album_artist on album_artist.album = album_genre.album
              where album_artist.artist = ''
          , _53 { name = _41, rawName = "artist", paramIndex = 0 }
          ]
        }
      , { name =
          { head = _71
          , tail =
            [ _50
            , _79 _56
            , _79
                { head = _100
                , tail = [ _90, _102, _103, _100, _97, _93, _97, _92 ]
                }
            ]
          }
        , srcPath = "./queries/update_album_recording_returning.sql"
        , params = [ _2, _21 ]
        , result = Some
          { cardinality = _106
          , columns =
            { head = _21
            , tail =
              [ _18
              , _12
              , _4
              , _2
              , { name = _43
                , pgName = "tracks"
                , isNullable = True
                , value = _14
                }
              , _7
              ]
            }
          }
        , fragments =
          [ _52
              ''
              -- Update album recording information
              update album
              set recording = ''
          , _53 { name = _34, rawName = "recording", paramIndex = 0 }
          , _44
          , _24
          , _52
              ''

              returning *''
          ]
        }
      , { name = { head = _71, tail = [ _50, _36 ] }
        , srcPath = "./queries/update_album_released.sql"
        , params = [ _12, _21 ]
        , result =
            None { cardinality : _109, columns : { head : _25, tail : _23 } }
        , fragments =
          [ _52
              ''
              update album
              set released = ''
          , _53 { name = _35, rawName = "released", paramIndex = 0 }
          , _44
          , _24
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
