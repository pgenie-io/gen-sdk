let _126 = < Optional | Single | Multiple >

let _125 =
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

let _124 =
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

let _123 = _126.Multiple

let _122 = _124.Y

let _121 = _124.V

let _120 = _124.U

let _119 = _124.T

let _118 = _124.S

let _117 = _124.R

let _116 = _124.P

let _115 = _124.O

let _114 = _124.N

let _113 = _124.M

let _112 = _124.L

let _111 = _124.K

let _110 = _124.I

let _109 = _124.G

let _108 = _124.F

let _107 = _124.E

let _106 = _124.D

let _105 = _124.C

let _104 = _124.B

let _103 = _124.A

let _102 = { dimensionality : Natural, elementIsNullable : Bool }

let _101 = [ _122 ]

let _100 = [ _106 ]

let _99 = Some { dimensionality = 1, elementIsNullable = True }

let _98 = { head : _124, tail : List _124 }

let _97 = None _102

let _96 = { head = _110, tail = _100 }

let _95 = < Word : _98 | Number : Natural >

let _94 = _95.Word

let _93 = List _95

let _92 = { head = _114, tail = [ _103, _113, _107 ] }

let _91 = { head = _106, tail = [ _110, _118, _105 ] }

let _90 = [] : _93

let _89 = { head = _115, tail = [ _117, _106, _107, _117 ] }

let _88 = { head = _109, tail = [ _107, _114, _117, _107 ] }

let _87 = { head = _103, tail = [ _112, _104, _120, _113 ] }

let _86 = { head = _120, tail = [ _116, _106, _103, _119, _107 ] }

let _85 = { head = _119, tail = [ _117, _103, _105, _111, _118 ] }

let _84 = { head = _118, tail = [ _107, _112, _107, _105, _119 ] }

let _83 = { head = _108, tail = [ _115, _117, _113, _103, _119 ] }

let _82 = { head = _103, tail = [ _117, _119, _110, _118, _119 ] }

let _81 = { head : _98, tail : _93 }

let _80 = _94 { head = _104, tail = _101 }

let _79 = { head = _110, tail = [ _114, _105, _112, _120, _106, _107 ] }

let _78 = < Primitive : _125 | Custom : _81 >

let _77 = { head = _96, tail = _90 }

let _76 = _78.Primitive

let _75 = _78.Custom

let _74 = { head = _117, tail = [ _107, _112, _107, _103, _118, _107, _106 ] }

let _73 = _94 { head = _124.W, tail = [ _110, _119, _124.H ] }

let _72 = _94 _92

let _71 =
      < Sql : Text
      | Var : { name : _81, rawName : Text, paramIndex : Natural }
      >

let _70 =
      { head = _117, tail = [ _107, _105, _115, _117, _106, _110, _114, _109 ] }

let _69 = [ _72 ]

let _68 = [ _94 { head = _110, tail = [ _114, _108, _115 ] } ]

let _67 = _71.Var

let _66 = _71.Sql

let _65 = { head = _92, tail = _90 }

let _64 = _94 _87

let _63 = _76 _125.Text

let _62 = { arraySettings : Optional _102, scalar : _78 }

let _61 = _94 _85

let _60 = _94 _83

let _59 = _66 ", "

let _58 =
      _66
        ''
        )
          AND (''

let _57 =
      _66
        ''

        where id = ''

let _56 = [ _60 ]

let _55 = { head = _85, tail = _90 }

let _54 = { head = _83, tail = _90 }

let _53 = { head = _82, tail = _90 }

let _52 = { arraySettings = _97, scalar = _63 }

let _51 = { arraySettings = _97, scalar = _76 _125.Int8 }

let _50 = { arraySettings = _97, scalar = _76 _125.Int4 }

let _49 = { arraySettings = _97, scalar = _76 _125.Date }

let _48 = { arraySettings = _97, scalar = _76 _125.Bool }

let _47 = _94 _74

let _46 = { head = _74, tail = _90 }

let _45 = _94 _70

let _44 = { head = _70, tail = _90 }

let _43 =
      { head = _92
      , tail = [ _94 { head = _112, tail = [ _110, _111, _107 ] } ]
      }

let _42 = { head = _91, tail = _68 }

let _41 =
      { head = { head = _119, tail = [ _117, _103, _105, _111 ] }, tail = _68 }

let _40 = { head = _88, tail = _69 }

let _39 = { head = _82, tail = _69 }

let _38 = { head = _79, tail = _69 }

let _37 = { head = _79, tail = [ _94 _91 ] }

let _36 = { head = _87, tail = _56 }

let _35 =
      { head = _74
      , tail = [ _94 { head = _103, tail = [ _108, _119, _107, _117 ] } ]
      }

let _34 = { head = _70, tail = _68 }

let _33 = { head = _79, tail = [ _61 ] }

let _32 = { head = _79, tail = _56 }

let _31 = { name : _81, pgName : Text, isNullable : Bool, value : _62 }

let _30 = _67 { name = _77, rawName = "id", paramIndex = 1 }

let _29 = _67 { name = _77, rawName = "id", paramIndex = 0 }

let _28 = List _31

let _27 = { head = _79, tail = [ _47 ] }

let _26 = _67 { name = _65, rawName = "name", paramIndex = 0 }

let _25 = { name = _77, pgName = "id", isNullable = False, value = _51 }

let _24 = { head = _79, tail = [ _45 ] }

let _23 = { head = _89, tail = [ _80, _72 ] }

let _22 = _67 { name = _54, rawName = "format", paramIndex = 2 }

let _21 = { name = _65, pgName = "name", isNullable = True, value = _52 }

let _20 = { name = _65, pgName = "name", isNullable = False, value = _52 }

let _19 = [ _20 ]

let _18 = _75 _41

let _17 = { head = _89, tail = [ _80, _47 ] }

let _16 = _67 { name = _43, rawName = "name_like", paramIndex = 4 }

let _15 =
      { arraySettings = Some { dimensionality = 1, elementIsNullable = False }
      , scalar = _18
      }

let _14 = _67 { name = _40, rawName = "genre_name", paramIndex = 1 }

let _13 = { name = _46, pgName = "released", isNullable = True, value = _49 }

let _12 = _67 { name = _39, rawName = "artist_name", paramIndex = 0 }

let _11 = { arraySettings = _97, scalar = _75 _36 }

let _10 = { arraySettings = _97, scalar = _75 _34 }

let _9 = _67 { name = _35, rawName = "released_after", paramIndex = 3 }

let _8 =
      { name = { head = _91, tail = _90 }
      , pgName = "disc"
      , isNullable = True
      , value = { arraySettings = _97, scalar = _75 _42 }
      }

let _7 = { name = _55, pgName = "tracks", isNullable = True, value = _15 }

let _6 =
      < Composite : _28
      | Enum : List { name : _81, pgName : Text }
      | Domain : _62
      >

let _5 = _6.Composite

let _4 = { name = _54, pgName = "format", isNullable = True, value = _11 }

let _3 = { name = _54, pgName = "format", isNullable = False, value = _11 }

let _2 = { name = _44, pgName = "recording", isNullable = True, value = _10 }

let _1 =
      Some
        { cardinality = _123
        , columns = { head = _25, tail = [ _20, _13, _4, _2 ] }
        }

in  { space =
      { head = { head = _113, tail = _101 }
      , tail = [ _94 { head = _118, tail = [ _116, _103, _105, _107 ] } ]
      }
    , name =
      { head = { head = _113, tail = [ _120, _118, _110, _105 ] }
      , tail =
        [ _94
            { head = _105
            , tail = [ _103, _119, _103, _112, _115, _109, _120, _107 ]
            }
        ]
      }
    , version = { major = 1, minor = 0, patch = 0 }
    , customTypes =
      [ { name = _36
        , pgSchema = "public"
        , pgName = "album_format"
        , definition =
            _6.Enum
              [ { name =
                  { head = { head = _121, tail = [ _110, _114, _122, _112 ] }
                  , tail = _90
                  }
                , pgName = "Vinyl"
                }
              , { name = { head = { head = _105, tail = _100 }, tail = _90 }
                , pgName = "CD"
                }
              , { name =
                  { head =
                    { head = _105
                    , tail = [ _103, _118, _118, _107, _119, _119, _107 ]
                    }
                  , tail = _90
                  }
                , pgName = "Cassette"
                }
              , { name =
                  { head =
                    { head = _106
                    , tail = [ _110, _109, _110, _119, _103, _112 ]
                    }
                  , tail = _90
                  }
                , pgName = "Digital"
                }
              , { name =
                  { head = { head = _106, tail = [ _121, _106 ] }
                  , tail =
                    [ _94 { head = _103, tail = [ _120, _106, _110, _115 ] } ]
                  }
                , pgName = "DVD-Audio"
                }
              , { name =
                  { head = { head = _118, tail = [ _103, _105, _106 ] }
                  , tail = _90
                  }
                , pgName = "SACD"
                }
              ]
        }
      , { name = _42
        , pgSchema = "public"
        , pgName = "disc_info"
        , definition = _5 [ _21, _2 ]
        }
      , { name = _34
        , pgSchema = "public"
        , pgName = "recording_info"
        , definition =
            _5
              [ { name =
                  { head =
                    { head = _118, tail = [ _119, _120, _106, _110, _115 ] }
                  , tail = _69
                  }
                , pgName = "studio_name"
                , isNullable = True
                , value = _52
                }
              , { name =
                  { head = { head = _105, tail = [ _110, _119, _122 ] }
                  , tail = _90
                  }
                , pgName = "city"
                , isNullable = True
                , value = _52
                }
              , { name =
                  { head =
                    { head = _105
                    , tail = [ _115, _120, _114, _119, _117, _122 ]
                    }
                  , tail = _90
                  }
                , pgName = "country"
                , isNullable = True
                , value = _52
                }
              , { name =
                  { head =
                    { head = _117
                    , tail = [ _107, _105, _115, _117, _106, _107, _106 ]
                    }
                  , tail = [ _94 { head = _106, tail = [ _103, _119, _107 ] } ]
                  }
                , pgName = "recorded_date"
                , isNullable = True
                , value = _49
                }
              ]
        }
      , { name = _41
        , pgSchema = "public"
        , pgName = "track_info"
        , definition =
            _5
              [ { name =
                  { head = { head = _119, tail = [ _110, _119, _112, _107 ] }
                  , tail = _90
                  }
                , pgName = "title"
                , isNullable = True
                , value = _52
                }
              , { name =
                  { head =
                    { head = _106
                    , tail = [ _120, _117, _103, _119, _110, _115, _114 ]
                    }
                  , tail =
                    [ _94
                        { head = _118
                        , tail = [ _107, _105, _115, _114, _106, _118 ]
                        }
                    ]
                  }
                , pgName = "duration_seconds"
                , isNullable = True
                , value = _50
                }
              , { name =
                  { head = { head = _119, tail = [ _103, _109, _118 ] }
                  , tail = _90
                  }
                , pgName = "tags"
                , isNullable = True
                , value = { arraySettings = _99, scalar = _63 }
                }
              ]
        }
      ]
    , queries =
      [ { name =
          { head = { head = _110, tail = [ _114, _118, _107, _117, _119 ] }
          , tail = [ _64 ]
          }
        , srcPath = "./queries/insert_album.sql"
        , params =
          [ _20
          , { name = _46, pgName = "released", isNullable = False, value = _49 }
          , _3
          , { name = _44
            , pgName = "recording"
            , isNullable = False
            , value = _10
            }
          ]
        , result = Some
          { cardinality = _126.Single
          , columns = { head = _25, tail = [] : _28 }
          }
        , fragments =
          [ _66
              ''
              insert into album (name, released, format, recording)
              values (''
          , _26
          , _59
          , _67 { name = _46, rawName = "released", paramIndex = 1 }
          , _59
          , _22
          , _59
          , _67 { name = _44, rawName = "recording", paramIndex = 3 }
          , _66
              ''
              )
              returning id''
          ]
        }
      , { name = { head = _84, tail = [ _64, _80, _60 ] }
        , srcPath = "./queries/select_album_by_format.sql"
        , params = [ _3 ]
        , result = _1
        , fragments =
          [ _66
              ''
              select
                id,
                name,
                released,
                format,
                recording
              from album
              where format = ''
          , _67 { name = _54, rawName = "format", paramIndex = 0 }
          ]
        }
      , { name = { head = _84, tail = [ _64, _80, _94 _96 ] }
        , srcPath = "./queries/select_album_by_id.sql"
        , params =
          [ { name = _77, pgName = "id", isNullable = True, value = _51 } ]
        , result = Some
          { cardinality = _126.Optional
          , columns =
            { head = _25
            , tail =
              [ _20
              , _13
              , _4
              , _2
              , { name = _55
                , pgName = "tracks"
                , isNullable = True
                , value = { arraySettings = _99, scalar = _18 }
                }
              , _8
              ]
            }
          }
        , fragments =
          [ _66
              ''
              -- Example of a query selecting 0 or 1 row.
              select *
              from album
              where id = ''
          , _29
          , _66
              ''

              limit 1''
          ]
        }
      , { name = { head = _84, tail = [ _64, _80, _72 ] }
        , srcPath = "./queries/select_album_by_name.sql"
        , params = _19
        , result = _1
        , fragments =
          [ _66
              ''
              select
                id,
                name,
                released,
                format,
                recording
              from album
              where name = ''
          , _26
          ]
        }
      , { name =
          { head = _84
          , tail =
            [ _64
            , _94 { head = _108, tail = [ _110, _107, _112, _106, _118 ] }
            ]
          }
        , srcPath = "./queries/select_album_fields.sql"
        , params =
          [ { name = _38
            , pgName = "include_name"
            , isNullable = False
            , value = _48
            }
          , { name = _27
            , pgName = "include_released"
            , isNullable = False
            , value = _48
            }
          , { name = _32
            , pgName = "include_format"
            , isNullable = False
            , value = _48
            }
          , { name = _24
            , pgName = "include_recording"
            , isNullable = False
            , value = _48
            }
          , { name = _33
            , pgName = "include_tracks"
            , isNullable = False
            , value = _48
            }
          , { name = _37
            , pgName = "include_disc"
            , isNullable = False
            , value = _48
            }
          , _25
          ]
        , result = Some
          { cardinality = _123
          , columns = { head = _25, tail = [ _21, _13, _4, _2, _7, _8 ] }
          }
        , fragments =
          [ _66
              ''
              -- Demonstrates static query equivalent of dynamic field selection.
              -- Boolean flags control which fields are included in the result,
              -- returning NULL for fields the caller opts out of.
              SELECT
                album.id,
                CASE WHEN ''
          , _67 { name = _38, rawName = "include_name", paramIndex = 0 }
          , _66
              ''
              ${"  "}    THEN album.name      END AS name,
              ${"  "}CASE WHEN ''
          , _67 { name = _27, rawName = "include_released", paramIndex = 1 }
          , _66
              ''
              ${"  "}THEN album.released  END AS released,
              ${"  "}CASE WHEN ''
          , _67 { name = _32, rawName = "include_format", paramIndex = 2 }
          , _66
              ''
              ${"  "}  THEN album.format    END AS format,
              ${"  "}CASE WHEN ''
          , _67 { name = _24, rawName = "include_recording", paramIndex = 3 }
          , _66
              ''
              ${" "}THEN album.recording END AS recording,
              ${" "} CASE WHEN ''
          , _67 { name = _33, rawName = "include_tracks", paramIndex = 4 }
          , _66
              ''
              ${"  "}  THEN album.tracks    END AS tracks,
              ${"  "}CASE WHEN ''
          , _67 { name = _37, rawName = "include_disc", paramIndex = 5 }
          , _66
              ''
                    THEN album.disc      END AS disc
              FROM album
              WHERE album.id = ''
          , _67 { name = _77, rawName = "id", paramIndex = 6 }
          ]
        }
      , { name =
          { head = _84
          , tail =
            [ _64
            , _73
            , _94 { head = _108, tail = [ _110, _112, _119, _107, _117, _118 ] }
            ]
          }
        , srcPath = "./queries/select_album_with_filters.sql"
        , params =
          [ { name = _39
            , pgName = "artist_name"
            , isNullable = True
            , value = _52
            }
          , { name = _40
            , pgName = "genre_name"
            , isNullable = True
            , value = _52
            }
          , _4
          , { name = _35
            , pgName = "released_after"
            , isNullable = True
            , value = { arraySettings = _97, scalar = _76 _125.Timestamp }
            }
          , { name = _43, pgName = "name_like", isNullable = True, value = _52 }
          , { name = _23
            , pgName = "order_by_name"
            , isNullable = False
            , value = _48
            }
          , { name = _17
            , pgName = "order_by_released"
            , isNullable = False
            , value = _48
            }
          ]
        , result = Some
          { cardinality = _123
          , columns = { head = _25, tail = [ _20, _13, _4 ] }
          }
        , fragments =
          [ _66
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
          , _12
          , _66 "::text IS NULL OR artist.name = "
          , _12
          , _58
          , _14
          , _66 "::text IS NULL OR genre.name = "
          , _14
          , _58
          , _22
          , _66 "::album_format IS NULL OR album.format = "
          , _22
          , _58
          , _9
          , _66 "::timestamp IS NULL OR album.released >= "
          , _9
          , _58
          , _16
          , _66 "::text IS NULL OR album.name LIKE "
          , _16
          , _66
              ''
              )
              ORDER BY
                CASE WHEN ''
          , _67 { name = _23, rawName = "order_by_name", paramIndex = 5 }
          , _66
              ''
              ${" "}THEN album.name END ASC,
              ${" "} CASE WHEN ''
          , _67 { name = _17, rawName = "order_by_released", paramIndex = 6 }
          , _66 " THEN album.released END DESC"
          ]
        }
      , { name = { head = _84, tail = [ _64, _73, _61 ] }
        , srcPath = "./queries/select_album_with_tracks.sql"
        , params = [ _25 ]
        , result = Some
          { cardinality = _123
          , columns =
            { head = _25
            , tail =
              [ _20
              , { name = _55
                , pgName = "tracks"
                , isNullable = False
                , value = _15
                }
              , _8
              ]
            }
          }
        , fragments =
          [ _66
              ''
              select id, name, tracks, disc
              from album
              where id = ''
          , _29
          ]
        }
      , { name = { head = _84, tail = [ _94 _88, _80, _94 _82 ] }
        , srcPath = "./queries/select_genre_by_artist.sql"
        , params =
          [ { name = _53, pgName = "artist", isNullable = False, value = _50 } ]
        , result = Some
          { cardinality = _123
          , columns =
            { head =
              { name = _77, pgName = "id", isNullable = False, value = _50 }
            , tail = _19
            }
          }
        , fragments =
          [ _66
              ''
              select id, genre.name
              from genre
              left join album_genre on album_genre.genre = genre.id
              left join album_artist on album_artist.album = album_genre.album
              where album_artist.artist = ''
          , _67 { name = _53, rawName = "artist", paramIndex = 0 }
          ]
        }
      , { name =
          { head = _86
          , tail =
            [ _64
            , _45
            , _94
                { head = _117
                , tail = [ _107, _119, _120, _117, _114, _110, _114, _109 ]
                }
            ]
          }
        , srcPath = "./queries/update_album_recording_returning.sql"
        , params = [ _2, _25 ]
        , result = Some
          { cardinality = _123
          , columns = { head = _25, tail = [ _20, _13, _4, _2, _7, _8 ] }
          }
        , fragments =
          [ _66
              ''
              -- Update album recording information
              update album
              set recording = ''
          , _67 { name = _44, rawName = "recording", paramIndex = 0 }
          , _57
          , _30
          , _66
              ''

              returning *''
          ]
        }
      , { name = { head = _86, tail = [ _64, _47 ] }
        , srcPath = "./queries/update_album_released.sql"
        , params = [ _13, _25 ]
        , result =
            None { cardinality : _126, columns : { head : _31, tail : _28 } }
        , fragments =
          [ _66
              ''
              update album
              set released = ''
          , _67 { name = _46, rawName = "released", paramIndex = 0 }
          , _57
          , _30
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
