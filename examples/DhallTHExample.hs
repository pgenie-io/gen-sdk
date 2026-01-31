{-# LANGUAGE TemplateHaskell #-}

{- |
Example demonstrating compile-time Dhall-to-Haskell code generation using Template Haskell.

This example shows how to use the Template Haskell utilities in PGenieGen.Dhall.TH
to generate Haskell types from Dhall type definitions at compile time.

To use this example:

1. Ensure the pgenie-gen library is built
2. Load this file in GHCi or compile it

Note: This is a demonstration of the Template Haskell approach discussed in
docs/dhall-to-haskell-compilation.md. For production use cases involving
external generators, the runtime interpretation approach in PGenieGen is recommended.
-}
module DhallTHExample where

import PGenieGen.Dhall.TH
import Numeric.Natural (Natural)
import Data.Text (Text)
import GHC.Generics (Generic)

-- Example 1: Generate a simple record type from Dhall
-- This will generate a Haskell data type called Person at compile time
$(dhallType "Person" "{ name : Text, age : Natural }")

-- Usage:
examplePerson :: Person
examplePerson =
  Person
    { name = "Alice",
      age = 30
    }

-- Example 2: Generate a config type from Dhall
$(dhallType "ServerConfig" "{ host : Text, port : Natural, debug : Bool }")

exampleConfig :: ServerConfig
exampleConfig =
  ServerConfig
    { host = "localhost",
      port = 8080,
      debug = True
    }

-- Example 3: Nested record type
$(dhallType
    "DatabaseConfig"
    "{ connection : { host : Text, port : Natural }, credentials : { username : Text, password : Text } }")

exampleDbConfig :: DatabaseConfig
exampleDbConfig =
  DatabaseConfig
    { connection = error "Nested records need additional implementation",
      credentials = error "Nested records need additional implementation"
    }

-- Example 4: Lists and optional values
$(dhallType "User" "{ name : Text, email : Optional Text, tags : List Text }")

exampleUser :: User
exampleUser =
  User
    { name = "Bob",
      email = Just "bob@example.com",
      tags = ["admin", "developer"]
    }

{- |
Note on Limitations:

The current proof-of-concept implementation demonstrates the core concept but has
some limitations:

1. Nested records require additional implementation
2. Union types (sum types) are not yet supported
3. Dhall imports are not resolved at compile time
4. Complex type expressions need more work

For a production-ready implementation, these would need to be addressed. However,
the current implementation shows that compile-time Dhall-to-Haskell code generation
is technically feasible and can provide benefits like:

- Compile-time type checking
- Zero runtime parsing overhead
- Better IDE support with generated types
- Embedded static configurations

See docs/dhall-to-haskell-compilation.md for more details on when to use
compile-time vs. runtime approaches.
-}
