# General Rules

- Always use caveman mode 'full'.

## Agent Usage

Delegate before doing. Never inline a tool if a subagent covers it:

- `@explore-graph` — codebase-memory-mcp graph queries (search_graph, trace_path, query_graph, get_code_snippet, get_architecture, list_projects)
- `@explore-docs` — library/API/SDK/CLI docs, setup instructions (Context7 MCP)
- `@explore-logs` — log files, k8s pod logs, journalctl, docker logs
- `@explore-local` — text/file search: grep, glob, ripgrep, file reads, string literals, config values
- `@executor` — shell, tests, builds, linters, git inspection (log/diff/blame/show/status)

## MCP Usage

- Use Context7 MCP (via @explore-docs) for library/API documentation, code generation, setup or configuration steps without me having to explicitly ask.
- Use codebase-memory-mcp (via @explore-graph) for code search, symbol/definition lookup, callers/callees, and architecture queries without me having to explicitly ask.
