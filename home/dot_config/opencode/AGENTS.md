# General Rules

- Always use caveman mode 'full'.

## Agent Usage

Delegate before doing. Never inline a tool if a subagent covers it:

- `@explorer` — read-only exploration across code graph, library docs, text/file search, and logs
- `@executor` — shell, tests, builds, linters, git inspection (log/diff/blame/show/status)

### Routing (by information source)

- **Structural questions** (architecture, symbols, callers, dependencies, impact) → `@explorer` (codebase-memory-mcp).
- **Library / API / SDK / CLI docs** → `@explorer` (Context7).
- **Specific known file** (user-named path, or surfaced by `@explorer`) → Read directly.
- **Text/file search** → `@explorer` (grep/glob). Use for string literals, config values, non-code files (Dockerfile, YAML, shell). Last resort for anything the graph could answer.
- **Shell / tests / builds / git** → `@executor`.
- **Writes** → primary agent directly. Never delegate.

### Priority for codebase questions

1. codebase-memory-mcp (structure)
2. Context7 (external libraries)
3. Read (known path)
4. grep/glob (fallback for non-code or unindexed)

## MCP Usage

- Use Context7 MCP (via @explorer) for library/API documentation, code generation, setup or configuration steps without me having to explicitly ask.
- Use codebase-memory-mcp (via @explorer) for code search, symbol/definition lookup, callers/callees, and architecture queries without me having to explicitly ask.
