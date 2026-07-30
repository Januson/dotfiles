# General Rules

- Always use caveman mode 'full'.

## Agent Usage

Delegate before doing. Never inline a tool if a subagent covers it:

- `@explorer` — read-only exploration across code graph, library docs, text/file search, and logs
- `@executor` — shell, tests, builds, linters, git inspection (log/diff/blame/show/status)

### Routing

- Any search / lookup / "where is X" / "what calls Y" / "how does library Z work" → `@explorer`, not Grep/Glob/WebFetch.
- Any shell / test / build / git command → `@executor`, not bash directly.
- File edits → primary agent handles directly. Never delegate edits.

## MCP Usage

- Use Context7 MCP (via @explorer) for library/API documentation, code generation, setup or configuration steps without me having to explicitly ask.
- Use codebase-memory-mcp (via @explorer) for code search, symbol/definition lookup, callers/callees, and architecture queries without me having to explicitly ask.
