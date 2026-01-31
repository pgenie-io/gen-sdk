# Examples

This directory contains examples demonstrating different approaches to Dhall-Haskell integration in the gen-sdk project.

## DhallTHExample.hs

Demonstrates the **compile-time Template Haskell approach** for generating Haskell types from Dhall type definitions.

### What it shows:
- Using `dhallType` to generate Haskell data types at compile time
- Simple record types with primitive fields
- Optional values and lists
- Benefits and limitations of the compile-time approach

### How to use:

```bash
# Build the library first
cabal build pgenie-gen

# Load the example in GHCi
cabal repl pgenie-gen
:load examples/DhallTHExample.hs

# Try the examples
examplePerson
exampleConfig
exampleUser
```

### When to use this approach:

✅ **Use Template Haskell when:**
- You have static, embedded configurations
- You want compile-time type checking
- You want to avoid runtime parsing overhead
- Your configs don't change between deploys

❌ **Don't use Template Haskell when:**
- You need to load external user-provided configs (use runtime interpretation)
- You want hot-reload during development
- Your configs change frequently

## See Also

- `docs/dhall-to-haskell-compilation.md` - Comprehensive guide on Dhall-to-Haskell compilation strategies
- `haskell/library/PGenieGen.hs` - Runtime Dhall interpretation (the main approach used in this project)
- `haskell/library/PGenieGen/Dhall/TH.hs` - Template Haskell implementation (proof-of-concept)
