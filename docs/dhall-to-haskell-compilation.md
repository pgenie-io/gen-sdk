# Dhall-to-Haskell Compilation Strategies

## Problem Statement

This document addresses the question: **Should we implement a dhall-to-haskell compiler using Template Haskell to convert Dhall AST to Haskell AST?**

## Executive Summary

**Existing Solution:** This project already has robust Dhall-to-Haskell integration using runtime interpretation via the `dhall` library's type class system (`FromDhall`/`ToDhall`).

**Template Haskell Approach:** A compile-time Template Haskell solution is technically feasible but would serve a different use case than the existing runtime approach. Both approaches have distinct trade-offs.

**Recommendation:** The current runtime interpretation approach is appropriate for this codebase's use case (loading external generator configurations). A Template Haskell approach would be beneficial for embedding static Dhall configurations at compile time.

## Current Implementation

### Runtime Dhall Interpretation

The project currently uses **runtime Dhall interpretation** through:

1. **Type Class Marshaling** (`Dhall.FromDhall`, `Dhall.ToDhall`)
   - Automatic bidirectional conversion between Dhall and Haskell types
   - Generic derivation for most types
   - Custom instances for special cases (see `PGenieGen.Dhall.Orphans.*`)

2. **Direct AST Manipulation** (`Dhall.Core.Expr`)
   - Used in `PGenieGen.Dhall.ExprViews` for extracting record fields
   - Enables custom validation and introspection
   - Example: `recordField :: Text -> Expr s a -> Maybe (Expr s a)`

3. **Dynamic Loading** (`PGenieGen.load`)
   - Loads Dhall code from URLs or filesystem at runtime
   - Validates contract versions dynamically
   - Converts JSON configs to Dhall values on-the-fly
   - Evaluates Dhall functions as first-class values

### Example: Current Approach

```haskell
-- In PGenieGen.hs
load :: Location -> Aeson.Value -> IO (Input -> Output)
load location configJson = do
  genExpr <- Dhall.inputExpr code
  
  -- Extract and validate contract version at runtime
  contractVersionExpr <- extractField "contractVersion" genExpr
  Contract.ContractVersion major minor <- Dhall.rawInput Dhall.auto contractVersionExpr
  
  -- Convert JSON to Dhall dynamically
  configValExpr <- Dhall.FromJson.dhallFromJSON conversion configTypeExpr configJson
  
  -- Evaluate as a function
  Dhall.rawInput decoder compileExpr
```

**Advantages:**
- ✅ Load generators from external sources (URLs, filesystem)
- ✅ Hot-reload during development
- ✅ Version validation at load time
- ✅ Flexible configuration without recompilation
- ✅ User-provided generators don't need Haskell compilation

**Disadvantages:**
- ❌ No compile-time type checking of Dhall code
- ❌ Runtime overhead for parsing and evaluation
- ❌ Errors discovered at runtime, not compile time

## Proposed: Template Haskell Approach

### Concept

A Template Haskell (TH) approach would **generate Haskell code** from Dhall definitions **at compile time**:

```haskell
-- Hypothetical Template Haskell API
{-# LANGUAGE TemplateHaskell #-}
import Dhall.TH (dhallToHaskell)

-- Generate Haskell types from Dhall at compile time
$(dhallToHaskell "MyConfig" "./config-schema.dhall")

-- Results in generated code like:
-- data MyConfig = MyConfig
--   { field1 :: Text
--   , field2 :: Int
--   }
--   deriving (Show, Eq, Generic)
```

### Implementation Strategy

A TH-based compiler would:

1. **Parse Dhall at Compile Time**
   - Read Dhall files during compilation
   - Parse using `Dhall.Parser.exprFromText`
   - Type-check using Dhall's type inference

2. **Convert Dhall AST to Haskell AST**
   - Map Dhall types to Haskell types:
     - `Natural` → `Natural` or `Word`
     - `Integer` → `Integer` or `Int`
     - `Text` → `Text`
     - `List a` → `[a]`
     - `Optional a` → `Maybe a`
     - Records → Haskell data types with record syntax
     - Unions → Sum types or ADTs
   
3. **Generate Template Haskell Declarations**
   - Use `Language.Haskell.TH` to create declarations
   - Generate data type definitions
   - Generate `FromDhall`/`ToDhall` instances
   - Generate helper functions

4. **Embed Values as Haskell Literals**
   - Convert Dhall values to Haskell expressions
   - Useful for embedding configurations

### Example Implementation Sketch

```haskell
{-# LANGUAGE TemplateHaskell #-}
module Dhall.TH.Compiler (dhallToType, dhallToValue) where

import Language.Haskell.TH
import Dhall.Core qualified as Dhall
import Dhall.Parser qualified

-- Generate a Haskell type from a Dhall type
dhallToType :: String -> FilePath -> Q [Dec]
dhallToType typeName dhallPath = do
  -- Read and parse Dhall at compile time
  dhallCode <- runIO $ readFile dhallPath
  expr <- case Dhall.Parser.exprFromText dhallPath dhallCode of
    Left err -> fail (show err)
    Right e -> pure e
  
  -- Convert Dhall.Expr to TH declarations
  generateType typeName expr

-- Convert a Dhall expression to Haskell AST
dhallExprToType :: Dhall.Expr s a -> Type
dhallExprToType = \case
  Dhall.Natural -> ConT ''Natural
  Dhall.Integer -> ConT ''Integer
  Dhall.Text -> ConT ''Text
  Dhall.List t -> AppT ListT (dhallExprToType t)
  Dhall.Optional t -> AppT (ConT ''Maybe) (dhallExprToType t)
  Dhall.Record fields -> 
    -- Generate record type with fields
    ...
  Dhall.Union alternatives ->
    -- Generate sum type
    ...
  _ -> error "Unsupported Dhall type"

-- Generate data type declaration
generateType :: String -> Dhall.Expr s a -> Q [Dec]
generateType typeName expr = do
  let dataName = mkName typeName
  case expr of
    Dhall.Record fields -> do
      -- Generate record constructor
      let conName = mkName typeName
      fieldDecs <- mapM (uncurry mkField) (Map.toList fields)
      let con = RecC conName fieldDecs
      let dataD = DataD [] dataName [] Nothing [con] deriveClauses
      return [dataD]
    _ -> fail "Only record types supported"
  where
    mkField :: Text -> Dhall.Expr s a -> Q VarStrictType
    mkField name typ = do
      let fieldName = mkName (Text.unpack name)
      let fieldType = dhallExprToType typ
      return (fieldName, Bang NoSourceUnpackedness NoSourceStrictness, fieldType)
    
    deriveClauses = [DerivClause Nothing [ConT ''Show, ConT ''Eq, ConT ''Generic]]
```

### Advantages of TH Approach
- ✅ Compile-time type checking of Dhall code
- ✅ Zero runtime overhead for parsing
- ✅ Errors caught during compilation
- ✅ Embed static configurations efficiently
- ✅ IDE support with generated types

### Disadvantages of TH Approach
- ❌ Cannot load external/dynamic configurations
- ❌ Requires recompilation for config changes
- ❌ More complex implementation
- ❌ TH can slow down compilation
- ❌ Generated code can be hard to debug

## Feasibility Analysis

### Technical Feasibility: ✅ HIGH

A Template Haskell dhall-to-haskell compiler is **technically feasible**:

1. **Dhall AST is Well-Defined**: The `Dhall.Syntax.Expr` type provides a complete representation
2. **TH is Powerful**: `Language.Haskell.TH` can generate arbitrary Haskell code
3. **Type Mapping is Straightforward**: Most Dhall types have clear Haskell equivalents
4. **Existing Work**: Projects like `dhall-to-json` show how to traverse Dhall ASTs

### Implementation Complexity: ⚠️ MEDIUM-HIGH

Challenges include:
- **Dhall's Rich Type System**: Function types, dependent types require careful handling
- **Name Generation**: Ensuring valid Haskell identifiers from Dhall names
- **Import Resolution**: Handling Dhall imports at compile time
- **Error Messages**: Making TH errors user-friendly
- **Testing**: TH code is harder to test than regular Haskell

### Use Case Fit

| Use Case | Runtime Interpretation | Template Haskell |
|----------|------------------------|------------------|
| External user configs | ✅ Perfect fit | ❌ Doesn't work |
| Hot reload during dev | ✅ Supported | ❌ Requires rebuild |
| Static embedded configs | ⚠️ Works but overhead | ✅ Perfect fit |
| Type safety | ⚠️ Runtime validation | ✅ Compile-time checking |
| Distribution | ✅ No Haskell needed | ❌ Needs GHC |

## Recommendations

### For This Project (gen-sdk)

**Keep the current runtime approach** because:
1. The core use case is loading **user-provided generators** from URLs/filesystem
2. Users shouldn't need to compile Haskell to use generators
3. Hot-reload during development is valuable
4. The existing implementation is mature and working

### When to Use Template Haskell Approach

Consider TH for:
1. **Embedded Configurations**: Shipping applications with compiled-in Dhall configs
2. **Type-Safe Wrappers**: Generating Haskell types from Dhall schemas
3. **Static Sites**: Build-time config processing
4. **Performance-Critical**: Avoiding runtime parsing overhead

### Hybrid Approach

The two approaches are **complementary**:

```haskell
-- Compile-time: Generate types from schema
$(dhallToType "GeneratorConfig" "schema.dhall")

-- Runtime: Load instances conforming to that type
loadGenerator :: FilePath -> IO GeneratorConfig
loadGenerator = Dhall.input Dhall.auto . Text.pack
```

This gives you:
- ✅ Compile-time schema validation
- ✅ Runtime flexibility for loading different instances
- ✅ Type safety throughout

## Existing Solutions

### In the Dhall Ecosystem

1. **dhall-haskell** (this project uses it)
   - Runtime interpretation via `FromDhall`/`ToDhall`
   - Most mature and widely used

2. **dhall-to-cabal**
   - Generates `.cabal` files from Dhall
   - Not TH-based, but similar concept (Dhall → DSL)

3. **dhall-to-json** / **dhall-to-yaml**
   - Compile Dhall to other formats
   - Shows AST traversal patterns

### Template Haskell Examples

No mainstream "dhall-to-TH" library exists, but similar concepts:
- **aeson-th**: Generate Aeson instances from types
- **inline-java**: Embed Java in Haskell via TH
- **file-embed**: Embed files at compile time

## Conclusion

**To answer the original question:**

1. **Is there an existing solution?** 
   - Yes, runtime interpretation via `dhall-haskell` (already in use here)
   - No, there's no mainstream Template Haskell compiler

2. **What do I think of the idea?**
   - Technically sound and feasible
   - Complementary to runtime interpretation, not a replacement
   - Best suited for different use cases than this project's needs

3. **Should this project implement it?**
   - Not for the core use case (external generator loading)
   - Could be valuable as a **separate library** for the Dhall ecosystem
   - Would benefit users who want compile-time embedding

If you want to pursue the Template Haskell approach, I recommend:
1. Create a separate package `dhall-th`
2. Start with simple types (records, basic types)
3. Gradually add support for more complex features
4. Provide clear documentation on when to use runtime vs. compile-time

The existing runtime approach in this project is the right choice for its use case! 🎯
