# General Rules

- Always use caveman mode 'full'.

## Agent Usage

Delegate before doing. Never inline a tool if a subagent covers it:

- `@executor` — shell, tests, builds, linters, git inspection (log/diff/blame/show/status)

## Priority for codebase questions

1. codebase-memory-mcp (structure, architecture)
2. Context7 (documentation, examples)
3. Read (known path)
4. grep/glob (fallback)
