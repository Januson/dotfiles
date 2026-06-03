---
name: tdd
description: Test-driven development with red-green-refactor loop. Use when user wants to build features or fix bugs using TDD, mentions "red-green-refactor", wants integration tests, or asks for test-first development.
---

# Test-Driven Development

## Philosophy

Tests verify behavior through public interfaces, not implementation details. See [tests.md](tests.md) and [mocking.md](mocking.md).

## Anti-Pattern: Horizontal Slices

**DO NOT write all tests first, then all implementation.** One test → one implementation → repeat.

```
WRONG: RED: test1 test2 test3 → GREEN: impl1 impl2 impl3
RIGHT: RED→GREEN: test1→impl1, test2→impl2, test3→impl3
```

## Workflow

### 1. Planning

When exploring the codebase, use the project's domain glossary so that test names and interface vocabulary match the
project's language, and respect ADRs in the area you're touching.

Before writing any code:

- [ ] Confirm with user what interface changes are needed
- [ ] Confirm with user which behaviors to test (prioritize)
- [ ] Identify opportunities for [deep modules](deep_modules.md) (small interface, deep implementation)
- [ ] Design interfaces for [testability](interface_design.md)
- [ ] List the behaviors to test (not implementation steps)
- [ ] Get user approval on the plan

**You can't test everything.** Focus on critical paths and complex logic.

### 2. Red → Green Loop

First cycle is the tracer bullet — proves the path works end-to-end. Then repeat for each behavior:

```
RED:   Write test for next behavior → must fail
GREEN: Minimal code to pass → passes
```

Rules:

- One test at a time
- Only enough code to pass current test
- Don't anticipate future tests
- Keep tests focused on observable behavior

### 3. Refactor

After all tests pass, see [refactoring.md](refactoring.md).

**Never refactor while RED.**
