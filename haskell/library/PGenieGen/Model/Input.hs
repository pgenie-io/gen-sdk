module PGenieGen.Model.Input where

import Dhall qualified
import PGenieGen.Dhall.Deriving qualified as Dhall.Deriving
import PGenieGen.Dhall.Orphans ()
import PGenieGen.Prelude hiding (Version, Word)

-- | Version with semantic versioning components
data Version = Version
  { major :: Natural,
    minor :: Natural,
    patch :: Natural
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

-- | A word is a non-empty list of characters
type Word = NonEmpty WordChar

data WordChar
  = WordCharA
  | WordCharB
  | WordCharC
  | WordCharD
  | WordCharE
  | WordCharF
  | WordCharG
  | WordCharH
  | WordCharI
  | WordCharJ
  | WordCharK
  | WordCharL
  | WordCharM
  | WordCharN
  | WordCharO
  | WordCharP
  | WordCharQ
  | WordCharR
  | WordCharS
  | WordCharT
  | WordCharU
  | WordCharV
  | WordCharW
  | WordCharX
  | WordCharY
  | WordCharZ
  deriving stock (Show, Eq, Generic)
  deriving
    (Dhall.FromDhall, Dhall.ToDhall)
    via (Dhall.Deriving.Codec (Dhall.Deriving.SumModifier "WordChar") WordChar)

-- | Either a word or a number
data WordOrNumber
  = WordOrNumberWord Word
  | WordOrNumberNumber Natural
  deriving stock (Show, Eq, Generic)
  deriving
    (Dhall.FromDhall, Dhall.ToDhall)
    via (Dhall.Deriving.Codec (Dhall.Deriving.SumModifier "WordOrNumber") WordOrNumber)

-- | A strict name with a head word and tail of words or numbers
data Name = Name
  { head :: Word,
    tail :: [WordOrNumber]
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

-- | PostgreSQL primitive types
data Primitive
  = PrimitiveBool
  | PrimitiveBytea
  | PrimitiveChar
  | PrimitiveCidr
  | PrimitiveDate
  | PrimitiveDatemultirange
  | PrimitiveDaterange
  | PrimitiveFloat4
  | PrimitiveFloat8
  | PrimitiveInet
  | PrimitiveInt2
  | PrimitiveInt4
  | PrimitiveInt4multirange
  | PrimitiveInt4range
  | PrimitiveInt8
  | PrimitiveInt8multirange
  | PrimitiveInt8range
  | PrimitiveInterval
  | PrimitiveJson
  | PrimitiveJsonb
  | PrimitiveMacaddr
  | PrimitiveMacaddr8
  | PrimitiveMoney
  | PrimitiveNumeric
  | PrimitiveNummultirange
  | PrimitiveNumrange
  | PrimitiveText
  | PrimitiveTime
  | PrimitiveTimestamp
  | PrimitiveTimestamptz
  | PrimitiveTimetz
  | PrimitiveTsmultirange
  | PrimitiveTsrange
  | PrimitiveTstzmultirange
  | PrimitiveTstzrange
  | PrimitiveUuid
  | PrimitiveXml
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
    params :: [Member],
    result :: Maybe ResultRows,
    fragments :: [QueryFragment]
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)

-- | A project with name, version, custom types, and queries
data Project = Project
  { space :: Name,
    name :: Name,
    version :: Version,
    customTypes :: [CustomType],
    queries :: [Query]
  }
  deriving stock (Show, Eq, Generic)
  deriving anyclass (Dhall.ToDhall, Dhall.FromDhall)
