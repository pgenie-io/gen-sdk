let _91 = < Optional | Single | Multiple >

let _90 =
      < Bool
      | Bytea
      | Char
      | Cidr
      | Date
      | Datemultirange
      | Daterange
      | Float4
      | Float8
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
      | Macaddr
      | Macaddr8
      | Money
      | Numeric
      | Nummultirange
      | Numrange
      | Text
      | Time
      | Timestamp
      | Timestamptz
      | Timetz
      | Tsmultirange
      | Tsrange
      | Tstzmultirange
      | Tstzrange
      | Uuid
      | Xml
      >

let _89 =
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

let _88 = _91.Multiple

let _87 = _89.Y

let _86 = _89.V

let _85 = _89.U

let _84 = _89.T

let _83 = _89.S

let _82 = _89.R

let _81 = _89.P

let _80 = _89.O

let _79 = _89.N

let _78 = _89.M

let _77 = _89.L

let _76 = _89.K

let _75 = _89.I

let _74 = _89.G

let _73 = _89.F

let _72 = _89.E

let _71 = _89.D

let _70 = _89.C

let _69 = _89.B

let _68 = _89.A

let _67 = { dimensionality : Natural, elementIsNullable : Bool }

let _66 = [ _87 ]

let _65 = [ _71 ]

let _64 = { head : _89, tail : List _89 }

let _63 = None _67

let _62 = < Word : _64 | Number : Natural >

let _61 = _62.Word

let _60 = List _62

let _59 = { head = _79, tail = [ _68, _78, _72 ] }

let _58 = { head = _71, tail = [ _75, _83, _70 ] }

let _57 = [] : _60

let _56 = { head = _68, tail = [ _77, _69, _85, _78 ] }

let _55 = { head = _85, tail = [ _81, _71, _68, _84, _72 ] }

let _54 = { head = _84, tail = [ _82, _68, _70, _76, _83 ] }

let _53 = { head = _83, tail = [ _72, _77, _72, _70, _84 ] }

let _52 = { head = _73, tail = [ _80, _82, _78, _68, _84 ] }

let _51 = { head = _68, tail = [ _82, _84, _75, _83, _84 ] }

let _50 = { head : _64, tail : _60 }

let _49 = _61 { head = _69, tail = _66 }

let _48 = < Primitive : _90 | Custom : _50 >

let _47 = { head = { head = _75, tail = _65 }, tail = _57 }

let _46 = _48.Primitive

let _45 = _48.Custom

let _44 = { head = _82, tail = [ _72, _77, _72, _68, _83, _72, _71 ] }

let _43 = _61 _59

let _42 =
      < Sql : Text
      | Var : { name : _50, rawName : Text, paramIndex : Natural }
      >

let _41 = { head = _82, tail = [ _72, _70, _80, _82, _71, _75, _79, _74 ] }

let _40 = [ _61 { head = _75, tail = [ _79, _73, _80 ] } ]

let _39 = _42.Var

let _38 = _42.Sql

let _37 = { head = _59, tail = _57 }

let _36 = _61 _56

let _35 = _46 _90.Text

let _34 = { arraySettings : Optional _67, scalar : _48 }

let _33 = _61 _52

let _32 = _38 ", "

let _31 =
      _38
        ''

        where id = ''

let _30 = { head = _52, tail = _57 }

let _29 = { head = _51, tail = _57 }

let _28 = { arraySettings = _63, scalar = _35 }

let _27 = { arraySettings = _63, scalar = _46 _90.Int8 }

let _26 = { arraySettings = _63, scalar = _46 _90.Int4 }

let _25 = { arraySettings = _63, scalar = _46 _90.Date }

let _24 = { head = _44, tail = _57 }

let _23 = { head = _41, tail = _57 }

let _22 = { head = _58, tail = _40 }

let _21 = { head = { head = _84, tail = [ _82, _68, _70, _76 ] }, tail = _40 }

let _20 = { head = _56, tail = [ _33 ] }

let _19 = { head = _41, tail = _40 }

let _18 = { name : _50, pgName : Text, isNullable : Bool, value : _34 }

let _17 = _39 { name = _47, rawName = "id", paramIndex = 1 }

let _16 = List _18

let _15 = _39 { name = _37, rawName = "name", paramIndex = 0 }

let _14 = { name = _47, pgName = "id", isNullable = True, value = _27 }

let _13 = { name = _47, pgName = "id", isNullable = False, value = _27 }

let _12 = { name = _37, pgName = "name", isNullable = True, value = _28 }

let _11 = { name = _37, pgName = "name", isNullable = False, value = _28 }

let _10 = { name = _24, pgName = "released", isNullable = True, value = _25 }

let _9 = { arraySettings = _63, scalar = _45 _20 }

let _8 = { arraySettings = _63, scalar = _45 _19 }

let _7 =
      { name = { head = _58, tail = _57 }
      , pgName = "disc"
      , isNullable = True
      , value = { arraySettings = _63, scalar = _45 _22 }
      }

let _6 =
      { name = { head = _54, tail = _57 }
      , pgName = "tracks"
      , isNullable = True
      , value =
        { arraySettings = Some { dimensionality = 1, elementIsNullable = False }
        , scalar = _45 _21
        }
      }

let _5 =
      < Composite : _16
      | Enum : List { name : _50, pgName : Text }
      | Domain : _34
      >

let _4 = _5.Composite

let _3 = { name = _30, pgName = "format", isNullable = True, value = _9 }

let _2 = { name = _23, pgName = "recording", isNullable = True, value = _8 }

let _1 =
      Some
        { cardinality = _88
        , columns = { head = _13, tail = [ _11, _10, _3, _2 ] }
        }

in  { space =
      { head = { head = _78, tail = _66 }
      , tail = [ _61 { head = _83, tail = [ _81, _68, _70, _72 ] } ]
      }
    , name =
      { head = { head = _78, tail = [ _85, _83, _75, _70 ] }
      , tail =
        [ _61 { head = _70, tail = [ _68, _84, _68, _77, _80, _74, _85, _72 ] }
        ]
      }
    , version = { major = 1, minor = 0, patch = 0 }
    , customTypes =
      [ { name = _20
        , pgSchema = "public"
        , pgName = "album_format"
        , definition =
            _5.Enum
              [ { name =
                  { head = { head = _86, tail = [ _75, _79, _87, _77 ] }
                  , tail = _57
                  }
                , pgName = "Vinyl"
                }
              , { name = { head = { head = _70, tail = _65 }, tail = _57 }
                , pgName = "CD"
                }
              , { name =
                  { head =
                    { head = _70, tail = [ _68, _83, _83, _72, _84, _84, _72 ] }
                  , tail = _57
                  }
                , pgName = "Cassette"
                }
              , { name =
                  { head =
                    { head = _71, tail = [ _75, _74, _75, _84, _68, _77 ] }
                  , tail = _57
                  }
                , pgName = "Digital"
                }
              , { name =
                  { head = { head = _71, tail = [ _86, _71 ] }
                  , tail = [ _61 { head = _68, tail = [ _85, _71, _75, _80 ] } ]
                  }
                , pgName = "DVD-Audio"
                }
              , { name =
                  { head = { head = _83, tail = [ _68, _70, _71 ] }
                  , tail = _57
                  }
                , pgName = "SACD"
                }
              ]
        }
      , { name = _22
        , pgSchema = "public"
        , pgName = "disc_info"
        , definition = _4 [ _12, _2 ]
        }
      , { name = _19
        , pgSchema = "public"
        , pgName = "recording_info"
        , definition =
            _4
              [ { name =
                  { head = { head = _83, tail = [ _84, _85, _71, _75, _80 ] }
                  , tail = [ _43 ]
                  }
                , pgName = "studio_name"
                , isNullable = True
                , value = _28
                }
              , { name =
                  { head = { head = _70, tail = [ _75, _84, _87 ] }
                  , tail = _57
                  }
                , pgName = "city"
                , isNullable = True
                , value = _28
                }
              , { name =
                  { head =
                    { head = _70, tail = [ _80, _85, _79, _84, _82, _87 ] }
                  , tail = _57
                  }
                , pgName = "country"
                , isNullable = True
                , value = _28
                }
              , { name =
                  { head =
                    { head = _82, tail = [ _72, _70, _80, _82, _71, _72, _71 ] }
                  , tail = [ _61 { head = _71, tail = [ _68, _84, _72 ] } ]
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
            _4
              [ { name =
                  { head = { head = _84, tail = [ _75, _84, _77, _72 ] }
                  , tail = _57
                  }
                , pgName = "title"
                , isNullable = True
                , value = _28
                }
              , { name =
                  { head =
                    { head = _71, tail = [ _85, _82, _68, _84, _75, _80, _79 ] }
                  , tail =
                    [ _61
                        { head = _83, tail = [ _72, _70, _80, _79, _71, _83 ] }
                    ]
                  }
                , pgName = "duration_seconds"
                , isNullable = True
                , value = _26
                }
              , { name =
                  { head = { head = _84, tail = [ _68, _74, _83 ] }
                  , tail = _57
                  }
                , pgName = "tags"
                , isNullable = True
                , value =
                  { arraySettings = Some
                    { dimensionality = 1, elementIsNullable = True }
                  , scalar = _35
                  }
                }
              ]
        }
      ]
    , queries =
      [ { name =
          { head = { head = _75, tail = [ _79, _83, _72, _82, _84 ] }
          , tail = [ _36 ]
          }
        , srcPath = "./queries/insert_album.sql"
        , params =
          [ _11
          , { name = _24, pgName = "released", isNullable = False, value = _25 }
          , { name = _30, pgName = "format", isNullable = False, value = _9 }
          , { name = _23, pgName = "recording", isNullable = False, value = _8 }
          ]
        , result = Some
          { cardinality = _91.Single
          , columns = { head = _13, tail = [] : _16 }
          }
        , fragments =
          [ _38
              ''
              insert into album (name, released, format, recording)
              values (''
          , _15
          , _32
          , _39 { name = _24, rawName = "released", paramIndex = 1 }
          , _32
          , _39 { name = _30, rawName = "format", paramIndex = 2 }
          , _32
          , _39 { name = _23, rawName = "recording", paramIndex = 3 }
          , _38
              ''
              )
              returning id''
          ]
        }
      , { name = { head = _53, tail = [ _36, _49, _33 ] }
        , srcPath = "./queries/select_album_by_format.sql"
        , params = [ _3 ]
        , result = _1
        , fragments =
          [ _38
              ''
              select
                id,
                name,
                released,
                format,
                recording
              from album
              where format = ''
          , _39 { name = _30, rawName = "format", paramIndex = 0 }
          ]
        }
      , { name = { head = _53, tail = [ _36, _49, _43 ] }
        , srcPath = "./queries/select_album_by_name.sql"
        , params = [ _12 ]
        , result = _1
        , fragments =
          [ _38
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
          { head = _53
          , tail =
            [ _36, _61 { head = _89.W, tail = [ _75, _84, _89.H ] }, _61 _54 ]
          }
        , srcPath = "./queries/select_album_with_tracks.sql"
        , params = [ _14 ]
        , result = Some
          { cardinality = _88
          , columns = { head = _13, tail = [ _11, _6, _7 ] }
          }
        , fragments =
          [ _38
              ''
              select id, name, tracks, disc
              from album
              where id = ''
          , _39 { name = _47, rawName = "id", paramIndex = 0 }
          ]
        }
      , { name =
          { head = _53
          , tail =
            [ _61 { head = _74, tail = [ _72, _79, _82, _72 ] }, _49, _61 _51 ]
          }
        , srcPath = "./queries/select_genre_by_artist.sql"
        , params =
          [ { name = _29, pgName = "artist", isNullable = True, value = _26 } ]
        , result = Some
          { cardinality = _88
          , columns =
            { head =
              { name = _47, pgName = "id", isNullable = False, value = _26 }
            , tail = [ _11 ]
            }
          }
        , fragments =
          [ _38
              ''
              select id, genre.name
              from genre
              left join album_genre on album_genre.genre = genre.id
              left join album_artist on album_artist.album = album_genre.album
              where album_artist.artist = ''
          , _39 { name = _29, rawName = "artist", paramIndex = 0 }
          ]
        }
      , { name =
          { head = _55
          , tail =
            [ _36
            , _61 _41
            , _61
                { head = _82
                , tail = [ _72, _84, _85, _82, _79, _75, _79, _74 ]
                }
            ]
          }
        , srcPath = "./queries/update_album_recording_returning.sql"
        , params = [ _2, _14 ]
        , result = Some
          { cardinality = _88
          , columns = { head = _13, tail = [ _11, _10, _3, _2, _6, _7 ] }
          }
        , fragments =
          [ _38
              ''
              -- Update album recording information
              update album
              set recording = ''
          , _39 { name = _23, rawName = "recording", paramIndex = 0 }
          , _31
          , _17
          , _38
              ''

              returning *''
          ]
        }
      , { name = { head = _55, tail = [ _36, _61 _44 ] }
        , srcPath = "./queries/update_album_released.sql"
        , params = [ _10, _14 ]
        , result =
            None { cardinality : _91, columns : { head : _18, tail : _16 } }
        , fragments =
          [ _38
              ''
              update album
              set released = ''
          , _39 { name = _24, rawName = "released", paramIndex = 0 }
          , _31
          , _17
          ]
        }
      ]
    }
