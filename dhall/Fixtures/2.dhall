let _121 = < Optional | Single | Multiple >

let _120 =
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

let _119 =
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

let _118 = _121.Multiple

let _117 = _119.Y

let _116 = _119.V

let _115 = _119.U

let _114 = _119.T

let _113 = _119.S

let _112 = _119.R

let _111 = _119.P

let _110 = _119.O

let _109 = _119.N

let _108 = _119.M

let _107 = _119.L

let _106 = _119.K

let _105 = _119.I

let _104 = _119.G

let _103 = _119.F

let _102 = _119.E

let _101 = _119.D

let _100 = _119.C

let _99 = _119.B

let _98 = _119.A

let _97 = { dimensionality : Natural, elementIsNullable : Bool }

let _96 = [ _117 ]

let _95 = [ _101 ]

let _94 = { head : _119, tail : List _119 }

let _93 = None _97

let _92 = < Word : _94 | Number : Natural >

let _91 = _92.Word

let _90 = List _92

let _89 = { head = _109, tail = [ _98, _108, _102 ] }

let _88 = { head = _101, tail = [ _105, _113, _100 ] }

let _87 = [] : _90

let _86 = { head = _110, tail = [ _112, _101, _102, _112 ] }

let _85 = { head = _104, tail = [ _102, _109, _112, _102 ] }

let _84 = { head = _98, tail = [ _107, _99, _115, _108 ] }

let _83 = { head = _115, tail = [ _111, _101, _98, _114, _102 ] }

let _82 = { head = _114, tail = [ _112, _98, _100, _106, _113 ] }

let _81 = { head = _113, tail = [ _102, _107, _102, _100, _114 ] }

let _80 = { head = _103, tail = [ _110, _112, _108, _98, _114 ] }

let _79 = { head = _98, tail = [ _112, _114, _105, _113, _114 ] }

let _78 = { head : _94, tail : _90 }

let _77 = _91 { head = _99, tail = _96 }

let _76 = { head = _105, tail = [ _109, _100, _107, _115, _101, _102 ] }

let _75 = < Primitive : _120 | Custom : _78 >

let _74 = { head = { head = _105, tail = _95 }, tail = _87 }

let _73 = _75.Primitive

let _72 = _75.Custom

let _71 = { head = _112, tail = [ _102, _107, _102, _98, _113, _102, _101 ] }

let _70 = _91 { head = _119.W, tail = [ _105, _114, _119.H ] }

let _69 = _91 _89

let _68 =
      < Sql : Text
      | Var : { name : _78, rawName : Text, paramIndex : Natural }
      >

let _67 =
      { head = _112, tail = [ _102, _100, _110, _112, _101, _105, _109, _104 ] }

let _66 = [ _69 ]

let _65 = [ _91 { head = _105, tail = [ _109, _103, _110 ] } ]

let _64 = _68.Var

let _63 = _68.Sql

let _62 = { head = _89, tail = _87 }

let _61 = _91 _84

let _60 = _73 _120.Text

let _59 = { arraySettings : Optional _97, scalar : _75 }

let _58 = _91 _82

let _57 = _91 _80

let _56 = _63 ", "

let _55 =
      _63
        ''
        )
          AND (''

let _54 =
      _63
        ''

        where id = ''

let _53 = [ _57 ]

let _52 = { head = _82, tail = _87 }

let _51 = { head = _80, tail = _87 }

let _50 = { head = _79, tail = _87 }

let _49 = { arraySettings = _93, scalar = _60 }

let _48 = { arraySettings = _93, scalar = _73 _120.Int4 }

let _47 = { arraySettings = _93, scalar = _73 _120.Date }

let _46 = { arraySettings = _93, scalar = _73 _120.Bool }

let _45 = _91 _71

let _44 = { head = _71, tail = _87 }

let _43 = _91 _67

let _42 = { head = _67, tail = _87 }

let _41 =
      { head = _89
      , tail = [ _91 { head = _107, tail = [ _105, _106, _102 ] } ]
      }

let _40 = { head = _88, tail = _65 }

let _39 =
      { head = { head = _114, tail = [ _112, _98, _100, _106 ] }, tail = _65 }

let _38 = { head = _85, tail = _66 }

let _37 = { head = _79, tail = _66 }

let _36 = { head = _76, tail = _66 }

let _35 = { head = _76, tail = [ _91 _88 ] }

let _34 = { head = _84, tail = _53 }

let _33 =
      { head = _71
      , tail = [ _91 { head = _98, tail = [ _103, _114, _102, _112 ] } ]
      }

let _32 = { head = _67, tail = _65 }

let _31 = { head = _76, tail = [ _58 ] }

let _30 = { head = _76, tail = _53 }

let _29 = { name : _78, pgName : Text, isNullable : Bool, value : _59 }

let _28 = _64 { name = _74, rawName = "id", paramIndex = 1 }

let _27 = List _29

let _26 = { head = _76, tail = [ _45 ] }

let _25 = _64 { name = _62, rawName = "name", paramIndex = 0 }

let _24 =
      { name = _74
      , pgName = "id"
      , isNullable = False
      , value = { arraySettings = _93, scalar = _73 _120.Int8 }
      }

let _23 = { head = _76, tail = [ _43 ] }

let _22 = { head = _86, tail = [ _77, _69 ] }

let _21 = _64 { name = _51, rawName = "format", paramIndex = 2 }

let _20 = { name = _62, pgName = "name", isNullable = True, value = _49 }

let _19 = { name = _62, pgName = "name", isNullable = False, value = _49 }

let _18 = [ _19 ]

let _17 = { head = _86, tail = [ _77, _45 ] }

let _16 = _64 { name = _41, rawName = "name_like", paramIndex = 4 }

let _15 =
      { arraySettings = Some { dimensionality = 1, elementIsNullable = False }
      , scalar = _72 _39
      }

let _14 = _64 { name = _38, rawName = "genre_name", paramIndex = 1 }

let _13 = { name = _44, pgName = "released", isNullable = True, value = _47 }

let _12 = _64 { name = _37, rawName = "artist_name", paramIndex = 0 }

let _11 = { arraySettings = _93, scalar = _72 _34 }

let _10 = { arraySettings = _93, scalar = _72 _32 }

let _9 = _64 { name = _33, rawName = "released_after", paramIndex = 3 }

let _8 =
      { name = { head = _88, tail = _87 }
      , pgName = "disc"
      , isNullable = True
      , value = { arraySettings = _93, scalar = _72 _40 }
      }

let _7 = { name = _52, pgName = "tracks", isNullable = True, value = _15 }

let _6 =
      < Composite : _27
      | Enum : List { name : _78, pgName : Text }
      | Domain : _59
      >

let _5 = _6.Composite

let _4 = { name = _51, pgName = "format", isNullable = True, value = _11 }

let _3 = { name = _51, pgName = "format", isNullable = False, value = _11 }

let _2 = { name = _42, pgName = "recording", isNullable = True, value = _10 }

let _1 =
      Some
        { cardinality = _118
        , columns = { head = _24, tail = [ _19, _13, _4, _2 ] }
        }

in  { space =
      { head = { head = _108, tail = _96 }
      , tail = [ _91 { head = _113, tail = [ _111, _98, _100, _102 ] } ]
      }
    , name =
      { head = { head = _108, tail = [ _115, _113, _105, _100 ] }
      , tail =
        [ _91
            { head = _100
            , tail = [ _98, _114, _98, _107, _110, _104, _115, _102 ]
            }
        ]
      }
    , version = { major = 1, minor = 0, patch = 0 }
    , customTypes =
      [ { name = _34
        , pgSchema = "public"
        , pgName = "album_format"
        , definition =
            _6.Enum
              [ { name =
                  { head = { head = _116, tail = [ _105, _109, _117, _107 ] }
                  , tail = _87
                  }
                , pgName = "Vinyl"
                }
              , { name = { head = { head = _100, tail = _95 }, tail = _87 }
                , pgName = "CD"
                }
              , { name =
                  { head =
                    { head = _100
                    , tail = [ _98, _113, _113, _102, _114, _114, _102 ]
                    }
                  , tail = _87
                  }
                , pgName = "Cassette"
                }
              , { name =
                  { head =
                    { head = _101
                    , tail = [ _105, _104, _105, _114, _98, _107 ]
                    }
                  , tail = _87
                  }
                , pgName = "Digital"
                }
              , { name =
                  { head = { head = _101, tail = [ _116, _101 ] }
                  , tail =
                    [ _91 { head = _98, tail = [ _115, _101, _105, _110 ] } ]
                  }
                , pgName = "DVD-Audio"
                }
              , { name =
                  { head = { head = _113, tail = [ _98, _100, _101 ] }
                  , tail = _87
                  }
                , pgName = "SACD"
                }
              ]
        }
      , { name = _40
        , pgSchema = "public"
        , pgName = "disc_info"
        , definition = _5 [ _20, _2 ]
        }
      , { name = _32
        , pgSchema = "public"
        , pgName = "recording_info"
        , definition =
            _5
              [ { name =
                  { head =
                    { head = _113, tail = [ _114, _115, _101, _105, _110 ] }
                  , tail = _66
                  }
                , pgName = "studio_name"
                , isNullable = True
                , value = _49
                }
              , { name =
                  { head = { head = _100, tail = [ _105, _114, _117 ] }
                  , tail = _87
                  }
                , pgName = "city"
                , isNullable = True
                , value = _49
                }
              , { name =
                  { head =
                    { head = _100
                    , tail = [ _110, _115, _109, _114, _112, _117 ]
                    }
                  , tail = _87
                  }
                , pgName = "country"
                , isNullable = True
                , value = _49
                }
              , { name =
                  { head =
                    { head = _112
                    , tail = [ _102, _100, _110, _112, _101, _102, _101 ]
                    }
                  , tail = [ _91 { head = _101, tail = [ _98, _114, _102 ] } ]
                  }
                , pgName = "recorded_date"
                , isNullable = True
                , value = _47
                }
              ]
        }
      , { name = _39
        , pgSchema = "public"
        , pgName = "track_info"
        , definition =
            _5
              [ { name =
                  { head = { head = _114, tail = [ _105, _114, _107, _102 ] }
                  , tail = _87
                  }
                , pgName = "title"
                , isNullable = True
                , value = _49
                }
              , { name =
                  { head =
                    { head = _101
                    , tail = [ _115, _112, _98, _114, _105, _110, _109 ]
                    }
                  , tail =
                    [ _91
                        { head = _113
                        , tail = [ _102, _100, _110, _109, _101, _113 ]
                        }
                    ]
                  }
                , pgName = "duration_seconds"
                , isNullable = True
                , value = _48
                }
              , { name =
                  { head = { head = _114, tail = [ _98, _104, _113 ] }
                  , tail = _87
                  }
                , pgName = "tags"
                , isNullable = True
                , value =
                  { arraySettings = Some
                    { dimensionality = 1, elementIsNullable = True }
                  , scalar = _60
                  }
                }
              ]
        }
      ]
    , queries =
      [ { name =
          { head = { head = _105, tail = [ _109, _113, _102, _112, _114 ] }
          , tail = [ _61 ]
          }
        , srcPath = "./queries/insert_album.sql"
        , params =
          [ _19
          , { name = _44, pgName = "released", isNullable = False, value = _47 }
          , _3
          , { name = _42
            , pgName = "recording"
            , isNullable = False
            , value = _10
            }
          ]
        , result = Some
          { cardinality = _121.Single
          , columns = { head = _24, tail = [] : _27 }
          }
        , fragments =
          [ _63
              ''
              insert into album (name, released, format, recording)
              values (''
          , _25
          , _56
          , _64 { name = _44, rawName = "released", paramIndex = 1 }
          , _56
          , _21
          , _56
          , _64 { name = _42, rawName = "recording", paramIndex = 3 }
          , _63
              ''
              )
              returning id''
          ]
        }
      , { name = { head = _81, tail = [ _61, _77, _57 ] }
        , srcPath = "./queries/select_album_by_format.sql"
        , params = [ _3 ]
        , result = _1
        , fragments =
          [ _63
              ''
              select
                id,
                name,
                released,
                format,
                recording
              from album
              where format = ''
          , _64 { name = _51, rawName = "format", paramIndex = 0 }
          ]
        }
      , { name = { head = _81, tail = [ _61, _77, _69 ] }
        , srcPath = "./queries/select_album_by_name.sql"
        , params = _18
        , result = _1
        , fragments =
          [ _63
              ''
              select
                id,
                name,
                released,
                format,
                recording
              from album
              where name = ''
          , _25
          ]
        }
      , { name =
          { head = _81
          , tail =
            [ _61
            , _91 { head = _103, tail = [ _105, _102, _107, _101, _113 ] }
            ]
          }
        , srcPath = "./queries/select_album_fields.sql"
        , params =
          [ { name = _36
            , pgName = "include_name"
            , isNullable = False
            , value = _46
            }
          , { name = _26
            , pgName = "include_released"
            , isNullable = False
            , value = _46
            }
          , { name = _30
            , pgName = "include_format"
            , isNullable = False
            , value = _46
            }
          , { name = _23
            , pgName = "include_recording"
            , isNullable = False
            , value = _46
            }
          , { name = _31
            , pgName = "include_tracks"
            , isNullable = False
            , value = _46
            }
          , { name = _35
            , pgName = "include_disc"
            , isNullable = False
            , value = _46
            }
          , _24
          ]
        , result = Some
          { cardinality = _118
          , columns = { head = _24, tail = [ _20, _13, _4, _2, _7, _8 ] }
          }
        , fragments =
          [ _63
              ''
              -- Demonstrates static query equivalent of dynamic field selection.
              -- Boolean flags control which fields are included in the result,
              -- returning NULL for fields the caller opts out of.
              SELECT
                album.id,
                CASE WHEN ''
          , _64 { name = _36, rawName = "include_name", paramIndex = 0 }
          , _63
              ''
              ${"  "}    THEN album.name      END AS name,
              ${"  "}CASE WHEN ''
          , _64 { name = _26, rawName = "include_released", paramIndex = 1 }
          , _63
              ''
              ${"  "}THEN album.released  END AS released,
              ${"  "}CASE WHEN ''
          , _64 { name = _30, rawName = "include_format", paramIndex = 2 }
          , _63
              ''
              ${"  "}  THEN album.format    END AS format,
              ${"  "}CASE WHEN ''
          , _64 { name = _23, rawName = "include_recording", paramIndex = 3 }
          , _63
              ''
              ${" "}THEN album.recording END AS recording,
              ${" "} CASE WHEN ''
          , _64 { name = _31, rawName = "include_tracks", paramIndex = 4 }
          , _63
              ''
              ${"  "}  THEN album.tracks    END AS tracks,
              ${"  "}CASE WHEN ''
          , _64 { name = _35, rawName = "include_disc", paramIndex = 5 }
          , _63
              ''
                    THEN album.disc      END AS disc
              FROM album
              WHERE album.id = ''
          , _64 { name = _74, rawName = "id", paramIndex = 6 }
          ]
        }
      , { name =
          { head = _81
          , tail =
            [ _61
            , _70
            , _91 { head = _103, tail = [ _105, _107, _114, _102, _112, _113 ] }
            ]
          }
        , srcPath = "./queries/select_album_with_filters.sql"
        , params =
          [ { name = _37
            , pgName = "artist_name"
            , isNullable = True
            , value = _49
            }
          , { name = _38
            , pgName = "genre_name"
            , isNullable = True
            , value = _49
            }
          , _4
          , { name = _33
            , pgName = "released_after"
            , isNullable = True
            , value = { arraySettings = _93, scalar = _73 _120.Timestamp }
            }
          , { name = _41, pgName = "name_like", isNullable = True, value = _49 }
          , { name = _22
            , pgName = "order_by_name"
            , isNullable = False
            , value = _46
            }
          , { name = _17
            , pgName = "order_by_released"
            , isNullable = False
            , value = _46
            }
          ]
        , result = Some
          { cardinality = _118
          , columns = { head = _24, tail = [ _19, _13, _4 ] }
          }
        , fragments =
          [ _63
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
          , _63 "::text IS NULL OR artist.name = "
          , _12
          , _55
          , _14
          , _63 "::text IS NULL OR genre.name = "
          , _14
          , _55
          , _21
          , _63 "::album_format IS NULL OR album.format = "
          , _21
          , _55
          , _9
          , _63 "::timestamp IS NULL OR album.released >= "
          , _9
          , _55
          , _16
          , _63 "::text IS NULL OR album.name LIKE "
          , _16
          , _63
              ''
              )
              ORDER BY
                CASE WHEN ''
          , _64 { name = _22, rawName = "order_by_name", paramIndex = 5 }
          , _63
              ''
              ${" "}THEN album.name END ASC,
              ${" "} CASE WHEN ''
          , _64 { name = _17, rawName = "order_by_released", paramIndex = 6 }
          , _63 " THEN album.released END DESC"
          ]
        }
      , { name = { head = _81, tail = [ _61, _70, _58 ] }
        , srcPath = "./queries/select_album_with_tracks.sql"
        , params = [ _24 ]
        , result = Some
          { cardinality = _118
          , columns =
            { head = _24
            , tail =
              [ _19
              , { name = _52
                , pgName = "tracks"
                , isNullable = False
                , value = _15
                }
              , _8
              ]
            }
          }
        , fragments =
          [ _63
              ''
              select id, name, tracks, disc
              from album
              where id = ''
          , _64 { name = _74, rawName = "id", paramIndex = 0 }
          ]
        }
      , { name = { head = _81, tail = [ _91 _85, _77, _91 _79 ] }
        , srcPath = "./queries/select_genre_by_artist.sql"
        , params =
          [ { name = _50, pgName = "artist", isNullable = False, value = _48 } ]
        , result = Some
          { cardinality = _118
          , columns =
            { head =
              { name = _74, pgName = "id", isNullable = False, value = _48 }
            , tail = _18
            }
          }
        , fragments =
          [ _63
              ''
              select id, genre.name
              from genre
              left join album_genre on album_genre.genre = genre.id
              left join album_artist on album_artist.album = album_genre.album
              where album_artist.artist = ''
          , _64 { name = _50, rawName = "artist", paramIndex = 0 }
          ]
        }
      , { name =
          { head = _83
          , tail =
            [ _61
            , _43
            , _91
                { head = _112
                , tail = [ _102, _114, _115, _112, _109, _105, _109, _104 ]
                }
            ]
          }
        , srcPath = "./queries/update_album_recording_returning.sql"
        , params = [ _2, _24 ]
        , result = Some
          { cardinality = _118
          , columns = { head = _24, tail = [ _19, _13, _4, _2, _7, _8 ] }
          }
        , fragments =
          [ _63
              ''
              -- Update album recording information
              update album
              set recording = ''
          , _64 { name = _42, rawName = "recording", paramIndex = 0 }
          , _54
          , _28
          , _63
              ''

              returning *''
          ]
        }
      , { name = { head = _83, tail = [ _61, _45 ] }
        , srcPath = "./queries/update_album_released.sql"
        , params = [ _13, _24 ]
        , result =
            None { cardinality : _121, columns : { head : _29, tail : _27 } }
        , fragments =
          [ _63
              ''
              update album
              set released = ''
          , _64 { name = _44, rawName = "released", paramIndex = 0 }
          , _54
          , _28
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
