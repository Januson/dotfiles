# General Rules

- Always use caveman mode 'full'.

## Agent Usage

- Use `@explore-graph` subagent for codebase-memory-mcp graph queries (search_graph, trace_path, query_graph, get_code_snippet, get_architecture, list_projects) — never call these MCP tools inline in primary.
- Use `@explore-docs` subagent for library/API documentation — never call Context7 tools or fetch full doc pages inline in primary.
- Use `@explore-logs` subagent for log file, k8s pod log, journalctl, or docker log searches.
- Use `@explore-local` subagent for text and file search: grep, glob, ripgrep, file reads, string literals, config values, non-code files. Never speculate.
- Use `@executor` subagent for shell commands, test runs, builds, linters, shell-based validation, and git inspection (log, diff, blame, show, status) — never run these inline in the primary agent.

## Development General Guidelines

- For library/API documentation, SDK usage, CLI syntax, or setup instructions: delegate to `@docs` (uses Context7 MCP). Do not call Context7 tools inline.
