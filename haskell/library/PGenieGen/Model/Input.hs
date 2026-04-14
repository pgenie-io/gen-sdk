module PGenieGen.Model.Input
  ( module PGenieGen.Model.Input,
    Name (..),
    Word (..),
    WordChar (..),
    WordOrNumber (..),
  )
where

import AesonDeriver qualified
import Dhall qualified
import PGenieGen.Dhall.Deriving qualified as Dhall.Deriving
import PGenieGen.Dhall.Orphans ()
import PGenieGen.Model.Input.Name (Name (..))
import PGenieGen.Model.Input.Word (Word (..))
import PGenieGen.Model.Input.WordChar (WordChar (..))
import PGenieGen.Model.Input.WordOrNumber (WordOrNumber (..))
import PGenieGen.Prelude hiding (Version, Word)

-- | Version with semantic versioning components
data Version = Version
  { major :: Natural,
    minor :: Natural,
    patch :: Natural
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

-- | PostgreSQL primitive types.
--
-- Keep 'PrimitiveChar' for the internal single-byte '"char"' type (OID 18),
-- which is distinct from 'char(n)' / 'bpchar'.
data Primitive
  = -- | PostgreSQL 'bit' (OID 1560, array OID 1561).
    PrimitiveBit
  | -- | PostgreSQL 'bool' (OID 16, array OID 1000).
    PrimitiveBool
  | -- | PostgreSQL 'box' (OID 603, array OID 1020).
    PrimitiveBox
  | -- | PostgreSQL 'bpchar' / 'char(n)' (OID 1042, array OID 1014).
    PrimitiveBpchar
  | -- | PostgreSQL 'bytea' (OID 17, array OID 1001).
    PrimitiveBytea
  | -- | PostgreSQL internal single-byte '"char"' (OID 18, array OID 1002).
    PrimitiveChar
  | -- | PostgreSQL 'cidr' (OID 650, array OID 651).
    PrimitiveCidr
  | -- | PostgreSQL 'circle' (OID 718, array OID 719).
    PrimitiveCircle
  | -- | PostgreSQL 'citext' extension type (no fixed OID; requires the citext extension).
    PrimitiveCitext
  | -- | PostgreSQL 'date' (OID 1082, array OID 1182).
    PrimitiveDate
  | -- | PostgreSQL 'datemultirange' (OID 4535, array OID 6150).
    PrimitiveDatemultirange
  | -- | PostgreSQL 'daterange' (OID 3912, array OID 3913).
    PrimitiveDaterange
  | -- | PostgreSQL 'float4' / 'real' (OID 700, array OID 1021).
    PrimitiveFloat4
  | -- | PostgreSQL 'float8' / 'double precision' (OID 701, array OID 1022).
    PrimitiveFloat8
  | -- | PostgreSQL 'hstore' extension type (no fixed OID; requires the hstore extension).
    PrimitiveHstore
  | -- | PostgreSQL 'inet' (OID 869, array OID 1041).
    PrimitiveInet
  | -- | PostgreSQL 'int2' / 'smallint' (OID 21, array OID 1005).
    PrimitiveInt2
  | -- | PostgreSQL 'int4' / 'integer' (OID 23, array OID 1007).
    PrimitiveInt4
  | -- | PostgreSQL 'int4multirange' (OID 4451, array OID 6154).
    PrimitiveInt4multirange
  | -- | PostgreSQL 'int4range' (OID 3904, array OID 3905).
    PrimitiveInt4range
  | -- | PostgreSQL 'int8' / 'bigint' (OID 20, array OID 1016).
    PrimitiveInt8
  | -- | PostgreSQL 'int8multirange' (OID 4536, array OID 6157).
    PrimitiveInt8multirange
  | -- | PostgreSQL 'int8range' (OID 3926, array OID 3927).
    PrimitiveInt8range
  | -- | PostgreSQL 'interval' (OID 1186, array OID 1187).
    PrimitiveInterval
  | -- | PostgreSQL 'json' (OID 114, array OID 199).
    PrimitiveJson
  | -- | PostgreSQL 'jsonb' (OID 3802, array OID 3807).
    PrimitiveJsonb
  | -- | PostgreSQL 'line' (OID 628, array OID 629).
    PrimitiveLine
  | -- | PostgreSQL 'lseg' (OID 601, array OID 1018).
    PrimitiveLseg
  | -- | PostgreSQL 'macaddr' (OID 829, array OID 1040).
    PrimitiveMacaddr
  | -- | PostgreSQL 'macaddr8' (OID 774, array OID 775).
    PrimitiveMacaddr8
  | -- | PostgreSQL 'money' (OID 790, array OID 791).
    PrimitiveMoney
  | -- | PostgreSQL 'name' (OID 19, array OID 1003).
    PrimitiveName
  | -- | PostgreSQL 'numeric' (OID 1700, array OID 1231).
    PrimitiveNumeric
  | -- | PostgreSQL 'nummultirange' (OID 4532, array OID 6151).
    PrimitiveNummultirange
  | -- | PostgreSQL 'numrange' (OID 3906, array OID 3907).
    PrimitiveNumrange
  | -- | PostgreSQL 'oid' object identifier type (OID 26, array OID 1028).
    PrimitiveOid
  | -- | PostgreSQL 'path' (OID 602, array OID 1019).
    PrimitivePath
  | -- | PostgreSQL 'pg_lsn' (OID 3220, array OID 3221).
    PrimitivePgLsn
  | -- | PostgreSQL 'pg_snapshot' (OID 5038, array OID 5039).
    PrimitivePgSnapshot
  | -- | PostgreSQL 'point' (OID 600, array OID 1017).
    PrimitivePoint
  | -- | PostgreSQL 'polygon' (OID 604, array OID 1027).
    PrimitivePolygon
  | -- | PostgreSQL 'text' (OID 25, array OID 1009).
    PrimitiveText
  | -- | PostgreSQL 'time' (OID 1083, array OID 1183).
    PrimitiveTime
  | -- | PostgreSQL 'timestamp' (OID 1114, array OID 1115).
    PrimitiveTimestamp
  | -- | PostgreSQL 'timestamptz' (OID 1184, array OID 1185).
    PrimitiveTimestamptz
  | -- | PostgreSQL 'timetz' (OID 1266, array OID 1270).
    PrimitiveTimetz
  | -- | PostgreSQL 'tsmultirange' (OID 4533, array OID 6152).
    PrimitiveTsmultirange
  | -- | PostgreSQL 'tsquery' (OID 3615, array OID 3645).
    PrimitiveTsquery
  | -- | PostgreSQL 'tsrange' (OID 3908, array OID 3909).
    PrimitiveTsrange
  | -- | PostgreSQL 'tstzmultirange' (OID 4534, array OID 6153).
    PrimitiveTstzmultirange
  | -- | PostgreSQL 'tstzrange' (OID 3910, array OID 3911).
    PrimitiveTstzrange
  | -- | PostgreSQL 'tsvector' (OID 3614, array OID 3643).
    PrimitiveTsvector
  | -- | PostgreSQL 'uuid' (OID 2950, array OID 2951).
    PrimitiveUuid
  | -- | PostgreSQL 'varbit' (OID 1562, array OID 1563).
    PrimitiveVarbit
  | -- | PostgreSQL 'varchar' / 'character varying' (OID 1043, array OID 1015).
    PrimitiveVarchar
  | -- | PostgreSQL 'xml' (OID 142, array OID 143).
    PrimitiveXml
  | -- | PostGIS 'box2d' extension type (box2d).
    PrimitiveBox2D
  | -- | PostGIS 'box3d' extension type (box3d).
    PrimitiveBox3D
  | -- | PostgreSQL 'ltree' extension type (ltree).
    PrimitiveLtree
  | -- | PostGIS 'geometry' extension type (geometry).
    PrimitiveGeometry
  | -- | PostGIS 'geography' extension type (geography).
    PrimitiveGeography
  deriving stock (Show, Eq, Generic)
  deriving
    (Dhall.FromDhall, Dhall.ToDhall)
    via (Dhall.Deriving.Codec (Dhall.Deriving.SumModifier "Primitive") Primitive)

-- | Either a primitive type or a custom type
data Scalar
  = ScalarPrimitive Primitive
  | ScalarCustom Name
  deriving stock (Show, Eq, Generic)
  deriving
    (Dhall.FromDhall, Dhall.ToDhall)
    via (Dhall.Deriving.Codec (Dhall.Deriving.SumModifier "Scalar") Scalar)

-- | Array settings with dimensionality and element nullability
data ArraySettings = ArraySettings
  { dimensionality :: Natural,
    elementIsNullable :: Bool
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

-- | A value with optional array settings and scalar type
data Value = Value
  { arraySettings :: Maybe ArraySettings,
    scalar :: Scalar
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

-- | A field in a composite type or query parameter
data Member = Member
  { name :: Name,
    pgName :: Text,
    isNullable :: Bool,
    value :: Value
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

-- | A variant in an enum type
data EnumVariant = EnumVariant
  { name :: Name,
    pgName :: Text
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

-- | Definition of a custom type
data CustomTypeDefinition
  = CustomTypeDefinitionComposite [Member]
  | CustomTypeDefinitionEnum [EnumVariant]
  | CustomTypeDefinitionDomain Value
  deriving stock (Show, Eq, Generic)
  deriving
    (Dhall.FromDhall, Dhall.ToDhall)
    via (Dhall.Deriving.Codec (Dhall.Deriving.SumModifier "CustomTypeDefinition") CustomTypeDefinition)

-- | A custom type with name, PostgreSQL name, and definition
data CustomType = CustomType
  { name :: Name,
    pgSchema :: Text,
    pgName :: Text,
    definition :: CustomTypeDefinition
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

-- | Category of result rows
data ResultRowsCardinality
  = ResultRowsCardinalityOptional
  | ResultRowsCardinalitySingle
  | ResultRowsCardinalityMultiple
  deriving stock (Show, Eq, Generic)
  deriving
    (Dhall.FromDhall, Dhall.ToDhall)
    via (Dhall.Deriving.Codec (Dhall.Deriving.SumModifier "ResultRowsCardinality") ResultRowsCardinality)

-- | Result rows with cardinality and row structure
data ResultRows = ResultRows
  { cardinality :: ResultRowsCardinality,
    columns :: NonEmpty Member
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

-- | A variable in a query fragment
data Var = Var
  { name :: Name,
    rawName :: Text,
    paramIndex :: Natural
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

-- | A fragment of a query, either SQL text or a variable
data QueryFragment
  = QueryFragmentSql Text
  | QueryFragmentVar Var
  deriving stock (Show, Eq, Generic)
  deriving
    (Dhall.FromDhall, Dhall.ToDhall)
    via (Dhall.Deriving.Codec (Dhall.Deriving.SumModifier "QueryFragment") QueryFragment)

-- | A query with name, source path, parameters, result, and fragments
data Query = Query
  { name :: Name,
    srcPath :: Path,
    idempotent :: Bool,
    params :: [Member],
    result :: Maybe ResultRows,
    fragments :: [QueryFragment]
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

data Migration = Migration
  { name :: Text,
    sql :: Text
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

-- | A project with name, version, custom types, and queries
data Project = Project
  { space :: Name,
    name :: Name,
    version :: Version,
    customTypes :: [CustomType],
    queries :: [Query],
    migrations :: [Migration]
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

AesonDeriver.derive
  [ ''Version,
    ''Primitive,
    ''Scalar,
    ''ArraySettings,
    ''Value,
    ''Member,
    ''EnumVariant,
    ''CustomTypeDefinition,
    ''CustomType,
    ''ResultRowsCardinality,
    ''ResultRows,
    ''Var,
    ''QueryFragment,
    ''Query,
    ''Project,
    ''Migration
  ]
