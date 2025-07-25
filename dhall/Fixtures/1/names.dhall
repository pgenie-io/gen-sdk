let Lude = ../../Lude.dhall

let CodegenKit = ../../CodegenKit.dhall

let LatinChar = Lude.Structures.LatinChar

let Latin = Lude.Structures.LatinChar.Type

let Name = CodegenKit.Name

let a = Latin.A

let b = Latin.B

let c = Latin.C

let d = Latin.D

let e = Latin.E

let f = Latin.F

let g = Latin.G

let h = Latin.H

let i = Latin.I

let j = Latin.J

let k = Latin.K

let l = Latin.L

let m = Latin.M

let n = Latin.N

let o = Latin.O

let p = Latin.P

let q = Latin.Q

let r = Latin.R

let s = Latin.S

let t = Latin.T

let u = Latin.U

let v = Latin.V

let w = Latin.W

let x = Latin.X

let y = Latin.Y

let z = Latin.Z

let name
    : List (List LatinChar.Type) -> Name.Type
    = ../Helpers/name.dhall

in  { albumCount = name [ [ a, l, b, u, m ], [ c, o, u, n, t ] ]
    , albumId = name [ [ a, l, b, u, m ], [ i, d ] ]
    , albumTitle = name [ [ a, l, b, u, m ], [ t, i, t, l, e ] ]
    , albumType = name [ [ a, l, b, u, m ], [ t, y, p, e ] ]
    , artist = name [ [ a, r, t, i, s, t ] ]
    , artistId = name [ [ a, r, t, i, s, t ], [ i, d ] ]
    , artistName = name [ [ a, r, t, i, s, t ], [ n, a, m, e ] ]
    , catalogue = name [ [ c, a, t, a, l, o, g, u, e ] ]
    , compilation = name [ [ c, o, m, p, i, l, a, t, i, o, n ] ]
    , createPlaylist = name [ [ c, r, e, a, t, e ], [ p, l, a, y, l, i, s, t ] ]
    , createdAt = name [ [ c, r, e, a, t, e, d ], [ a, t ] ]
    , description = name [ [ d, e, s, c, r, i, p, t, i, o, n ] ]
    , duration = name [ [ d, u, r, a, t, i, o, n ] ]
    , ep = name [ [ e, p ] ]
    , genre = name [ [ g, e, n, r, e ] ]
    , getAlbumsByArtist =
        name
          [ [ g, e, t ], [ a, l, b, u, m, s ], [ b, y ], [ a, r, t, i, s, t ] ]
    , getArtistsWithTrackCount =
        name
          [ [ g, e, t ]
          , [ a, r, t, i, s, t, s ]
          , [ w, i, t, h ]
          , [ t, r, a, c, k ]
          , [ c, o, u, n, t ]
          ]
    , getTopTracksByPlayCount =
        name
          [ [ g, e, t ]
          , [ t, o, p ]
          , [ t, r, a, c, k, s ]
          , [ b, y ]
          , [ p, l, a, y ]
          , [ c, o, u, n, t ]
          ]
    , getTrackDetails =
        name [ [ g, e, t ], [ t, r, a, c, k ], [ d, e, t, a, i, l, s ] ]
    , id = name [ [ i, d ] ]
    , limit = name [ [ l, i, m, i, t ] ]
    , live = name [ [ l, i, v, e ] ]
    , music = name [ [ m, u, s, i, c ] ]
    , musicCatalogue = name [ [ m, u, s, i, c ], [ c, a, t, a, l, o, g, u, e ] ]
    , name = name [ [ n, a, m, e ] ]
    , playCount = name [ [ p, l, a, y ], [ c, o, u, n, t ] ]
    , playlist = name [ [ p, l, a, y, l, i, s, t ] ]
    , releaseYear = name [ [ r, e, l, e, a, s, e ], [ y, e, a, r ] ]
    , searchTerm = name [ [ s, e, a, r, c, h ], [ t, e, r, m ] ]
    , searchTracksByTitle =
        name
          [ [ s, e, a, r, c, h ]
          , [ t, r, a, c, k, s ]
          , [ b, y ]
          , [ t, i, t, l, e ]
          ]
    , single = name [ [ s, i, n, g, l, e ] ]
    , soundtrack = name [ [ s, o, u, n, d, t, r, a, c, k ] ]
    , studio = name [ [ s, t, u, d, i, o ] ]
    , title = name [ [ t, i, t, l, e ] ]
    , track = name [ [ t, r, a, c, k ] ]
    , trackCount = name [ [ t, r, a, c, k ], [ c, o, u, n, t ] ]
    , trackId = name [ [ t, r, a, c, k ], [ i, d ] ]
    , trackNumber = name [ [ t, r, a, c, k ], [ n, u, m, b, e, r ] ]
    , userId = name [ [ u, s, e, r ], [ i, d ] ]
    }
