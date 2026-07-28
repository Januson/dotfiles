# General Rules

- Always use caveman mode 'full'.

## Agent Usage

- Use `@explore` subagent for codebase context: file reads, grep, glob, "where is X" questions — never speculate about code without verifying.
- Use `@executor` subagent for shell commands, test runs, builds, linters, shell-based validation, and git inspection (log, diff, blame, show, status) — never run these inline in the primary agent.
- Use `@grapher` subagent for all codebase-memory-mcp graph queries (search_graph, trace_path, query_graph, get_code_snippet, get_architecture, list_projects) — never call these MCP tools inline in primary.
- Use `@docs` subagent for library/API documentation — never call Context7 tools or fetch full doc pages inline in primary.
- Use `@log-scanner` subagent for log file, k8s pod log, journalctl, or docker log searches.

## Development General Guidelines

- For library/API documentation, SDK usage, CLI syntax, or setup instructions: delegate to `@docs` (uses Context7 MCP). Do not call Context7 tools inline.
