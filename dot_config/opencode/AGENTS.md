# General Rules

## Agent Usage

- Use `@executor` subagent for all test runs, builds, shell commands and validation — never run these inline in the primary agent.
- Use `@talk` agent for open-ended discussion, brainstorming, or design tradeoffs — not for implementation tasks.
