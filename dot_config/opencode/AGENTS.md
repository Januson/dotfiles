# General Rules

- Always use caveman mode 'full'.

## Agent Usage

- Use `@explore` subagent for codebase context: file reads, grep, glob, "where is X" questions — never speculate about code without verifying.
- Use `@executor` subagent for shell commands, test runs, builds, linters, and shell-based validation — never run these inline in the primary agent.

## Development General Guidelines

- Use Context7 MCP when I need library/API documentation, code generation, setup or configuration steps without me having to explicitly ask.
