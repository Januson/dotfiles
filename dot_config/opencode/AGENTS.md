# General Rules

## Agent Usage

- Use `@executor` subagent for all test runs, builds, shell commands and validation — never run these inline in the primary agent.
- Use `@talk` agent for open-ended discussion, brainstorming, or design tradeoffs — not for implementation tasks.

## Development General Guidelines

- Use Context7 MCP when I need library/API documentation, code generation, setup or configuration steps without me having to explicitly ask.
