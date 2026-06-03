---
name: tdd
description: Test-driven development with red-green-refactor loop. Use when user wants to build features or fix bugs using TDD, mentions "red-green-refactor", "test list", or asks for test-first development.
---

# Test-Driven Development

Canon TDD per Kent Beck ([source](https://tidyfirst.substack.com/p/canon-tdd)):

1. Write a list of the test scenarios you want to cover
2. Turn exactly one item on the list into a runnable test
3. Change the code to make the test (& all previous tests) pass — add discoveries to the list
4. Optionally refactor
5. Until the list is empty, go to 2

## 1. Test List

Before listing, plan the change:

- Use project domain glossary so test names match project vocabulary
- Respect ADRs in the area you're touching
- Identify [deep modules](deep_modules.md)
- Design [testable interfaces](interface_design.md)
- Confirm interface changes and priorities with user

You can't test everything. Focus on critical paths. See [test_list.md](test_list.md).

## 2. Write One Test

Tests verify behavior through public interfaces, not implementation details.
See [tests.md](tests.md) and [mocking.md](mocking.md).

Write a real test — setup, invocation, assertion. Tip: work backwards from the assertion.

Mistakes:
- Writing tests without assertions (coverage theater)
- Converting all list items into tests at once (horizontal slicing)

## 3. Make It Pass

Minimal code to pass. No more.

If you discover a new behavior, add it to the list.
If a discovery invalidates earlier work, restart with a different test order.

Mistakes:
- Deleting assertions to fake-pass
- Copying computed values into expected values (defeats double-checking)
- Refactoring while RED — make it run, then make it right

## 4. Refactor (Optional)

After GREEN. See [refactoring.md](refactoring.md).

Mistakes:
- Refactoring further than this session needs
- Abstracting too soon — duplication is a hint, not a command

## 5. Repeat

Continue until the list is empty — when fear of the behavior has been replaced by boredom.
