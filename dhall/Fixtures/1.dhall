let Model = ../Project.dhall

let names = ./1/names.dhall

in    { name = names.musicCatalogue
      , version = { major = 1, minor = 0, patch = 0 }
      , customTypes =
        [ { name = names.albumType
          , pgName = "album_type"
          , definition =
              Model.CustomTypeDefinition.Enum
                [ { name = names.studio, pgName = "studio" }
                , { name = names.live, pgName = "live" }
                , { name = names.compilation, pgName = "compilation" }
                , { name = names.soundtrack, pgName = "soundtrack" }
                , { name = names.ep, pgName = "ep" }
                , { name = names.single, pgName = "single" }
                ]
          }
        ]
      , queries =
        [ { name = names.getAlbumsByArtist
          , srcPath = "queries/get_albums_by_artist.sql"
          , params =
            [ { name = names.artistId
              , value =
                { isNullable = False
                , dimensional =
                  { dimensionality = 0
                  , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                  }
                }
              }
            ]
          , result = Some
            { category = Model.ResultRowsCategory.Multiple
            , row =
              { head =
                { name = names.id
                , value =
                  { isNullable = False
                  , dimensional =
                    { dimensionality = 0
                    , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                    }
                  }
                }
              , tail =
                [ { name = names.title
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                , { name = names.releaseYear
                  , value =
                    { isNullable = True
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                      }
                    }
                  }
                , { name = names.albumType
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Custom names.albumType
                      }
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                SELECT 
                    a.id,
                    a.title,
                    a.release_year,
                    a.album_type
                FROM albums a
                WHERE a.artist_id = ''
            , Model.QueryFragment.Var names.artistId
            , Model.QueryFragment.Sql " ORDER BY a.release_year DESC"
            ]
          }
        , { name = names.searchTracksByTitle
          , srcPath = "queries/search_tracks_by_title.sql"
          , params =
            [ { name = names.searchTerm
              , value =
                { isNullable = False
                , dimensional =
                  { dimensionality = 0
                  , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                  }
                }
              }
            ]
          , result = Some
            { category = Model.ResultRowsCategory.Multiple
            , row =
              { head =
                { name = names.id
                , value =
                  { isNullable = False
                  , dimensional =
                    { dimensionality = 0
                    , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                    }
                  }
                }
              , tail =
                [ { name = names.title
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                , { name = names.duration
                  , value =
                    { isNullable = True
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                      }
                    }
                  }
                , { name = names.albumTitle
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                , { name = names.artistName
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                SELECT 
                    t.id,
                    t.title,
                    t.duration_seconds,
                    a.title as album_title,
                    ar.name as artist_name
                FROM tracks t
                JOIN albums a ON t.album_id = a.id
                JOIN artists ar ON a.artist_id = ar.id
                WHERE t.title ILIKE '%' || ''
            , Model.QueryFragment.Var names.searchTerm
            , Model.QueryFragment.Sql
                " || '%' ORDER BY ar.name, a.title, t.track_number"
            ]
          }
        , { name = names.getTrackDetails
          , srcPath = "queries/get_track_details.sql"
          , params =
            [ { name = names.trackId
              , value =
                { isNullable = False
                , dimensional =
                  { dimensionality = 0
                  , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                  }
                }
              }
            ]
          , result = Some
            { category = Model.ResultRowsCategory.Single
            , row =
              { head =
                { name = names.id
                , value =
                  { isNullable = False
                  , dimensional =
                    { dimensionality = 0
                    , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                    }
                  }
                }
              , tail =
                [ { name = names.title
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                , { name = names.duration
                  , value =
                    { isNullable = True
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                      }
                    }
                  }
                , { name = names.trackNumber
                  , value =
                    { isNullable = True
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                      }
                    }
                  }
                , { name = names.albumId
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                , { name = names.albumTitle
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                , { name = names.artistId
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                , { name = names.artistName
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                , { name = names.genre
                  , value =
                    { isNullable = True
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Text
                      }
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                SELECT 
                    t.id,
                    t.title,
                    t.duration_seconds,
                    t.track_number,
                    a.id as album_id,
                    a.title as album_title,
                    ar.id as artist_id,
                    ar.name as artist_name,
                    g.name as genre
                FROM tracks t
                JOIN albums a ON t.album_id = a.id
                JOIN artists ar ON a.artist_id = ar.id
                LEFT JOIN genres g ON t.genre_id = g.id
                WHERE t.id = ''
            , Model.QueryFragment.Var names.trackId
            ]
          }
        , { name = names.getArtistsWithTrackCount
          , srcPath = "queries/get_artists_with_track_count.sql"
          , params = [] : List Model.Field
          , result = Some
            { category = Model.ResultRowsCategory.Multiple
            , row =
              { head =
                { name = names.id
                , value =
                  { isNullable = False
                  , dimensional =
                    { dimensionality = 0
                    , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                    }
                  }
                }
              , tail =
                [ { name = names.name
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                , { name = names.trackCount
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                      }
                    }
                  }
                , { name = names.albumCount
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                      }
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                SELECT 
                    ar.id,
                    ar.name,
                    COUNT(DISTINCT t.id) as track_count,
                    COUNT(DISTINCT a.id) as album_count
                FROM artists ar
                LEFT JOIN albums a ON ar.id = a.artist_id
                LEFT JOIN tracks t ON a.id = t.album_id
                GROUP BY ar.id, ar.name
                ORDER BY track_count DESC''
            ]
          }
        , { name = names.createPlaylist
          , srcPath = "queries/create_playlist.sql"
          , params =
            [ { name = names.name
              , value =
                { isNullable = False
                , dimensional =
                  { dimensionality = 0
                  , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                  }
                }
              }
            , { name = names.description
              , value =
                { isNullable = True
                , dimensional =
                  { dimensionality = 0
                  , scalar = Model.Scalar.Primitive Model.Primitive.Text
                  }
                }
              }
            , { name = names.userId
              , value =
                { isNullable = False
                , dimensional =
                  { dimensionality = 0
                  , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                  }
                }
              }
            ]
          , result = Some
            { category = Model.ResultRowsCategory.Single
            , row =
              { head =
                { name = names.id
                , value =
                  { isNullable = False
                  , dimensional =
                    { dimensionality = 0
                    , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                    }
                  }
                }
              , tail =
                [ { name = names.name
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                , { name = names.createdAt
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar =
                          Model.Scalar.Primitive Model.Primitive.Timestamp
                      }
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                INSERT INTO playlists (name, description, user_id, created_at)
                VALUES (''
            , Model.QueryFragment.Var names.name
            , Model.QueryFragment.Sql ", "
            , Model.QueryFragment.Var names.description
            , Model.QueryFragment.Sql ", "
            , Model.QueryFragment.Var names.userId
            , Model.QueryFragment.Sql
                ''
                , NOW())
                RETURNING id, name, created_at''
            ]
          }
        , { name = names.getTopTracksByPlayCount
          , srcPath = "queries/get_top_tracks_by_play_count.sql"
          , params =
            [ { name = names.limit
              , value =
                { isNullable = False
                , dimensional =
                  { dimensionality = 0
                  , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                  }
                }
              }
            ]
          , result = Some
            { category = Model.ResultRowsCategory.Multiple
            , row =
              { head =
                { name = names.id
                , value =
                  { isNullable = False
                  , dimensional =
                    { dimensionality = 0
                    , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                    }
                  }
                }
              , tail =
                [ { name = names.title
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                , { name = names.artistName
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                , { name = names.albumTitle
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                      }
                    }
                  }
                , { name = names.playCount
                  , value =
                    { isNullable = False
                    , dimensional =
                      { dimensionality = 0
                      , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                      }
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                SELECT 
                    t.id,
                    t.title,
                    ar.name as artist_name,
                    a.title as album_title,
                    COALESCE(p.play_count, 0) as play_count
                FROM tracks t
                JOIN albums a ON t.album_id = a.id
                JOIN artists ar ON a.artist_id = ar.id
                LEFT JOIN (
                    SELECT track_id, COUNT(*) as play_count
                    FROM play_history
                    GROUP BY track_id
                ) p ON t.id = p.track_id
                ORDER BY play_count DESC
                LIMIT ''
            , Model.QueryFragment.Var names.limit
            ]
          }
        ]
      }
    : Model.Project
