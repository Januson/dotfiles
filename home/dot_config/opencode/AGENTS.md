# General Rules

- Always use caveman mode 'full'.

## Agent Usage

Delegate before doing. Never inline a tool if a subagent covers it:

- `@explore-graph` — codebase-memory-mcp: symbols, callers, callees, architecture, dependencies, impact, dead code, cross-service.
- `@explore-docs` — Context7: library / API / SDK / CLI docs, setup, migration.
- `@explore-local` — grep / glob / read: string literals, config values, filenames, non-code files (Dockerfile, YAML, shell).
- `@explore-logs` — log files, pod logs, journalctl, docker logs.
- `@executor` — shell, tests, builds, linters, git inspection (log/diff/blame/show/status).

### Routing (by information source)

- **Structural questions** (architecture, symbols, callers, dependencies, impact) → `@explore-graph`.
- **Library / API / SDK / CLI docs** → `@explore-docs`.
- **Specific known file** (user-named path, or surfaced by an explore agent) → Read directly.
- **Text/file search** → `@explore-local`. Use for string literals, config values, non-code files. Last resort for anything `@explore-graph` could answer.
- **Logs** → `@explore-logs`.
- **Shell / tests / builds / git** → `@executor`.
- **Writes** → primary agent directly. Never delegate.

### Priority for codebase questions

1. `@explore-graph` (structure)
2. `@explore-docs` (external libraries)
3. Read (known path)
4. `@explore-local` (fallback for non-code or unindexed)

## MCP Usage

- Use Context7 MCP (via `@explore-docs`) for library/API documentation, code generation, setup or configuration steps without me having to explicitly ask.
- Use codebase-memory-mcp (via `@explore-graph`) for code search, symbol/definition lookup, callers/callees, and architecture queries without me having to explicitly ask.
