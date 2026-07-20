---
name: tdd
description: Test-driven development with red-green-refactor loop. Use when user wants to build features or fix bugs using TDD, mentions "red-green-refactor", "test list", or asks for test-first development.
---

# Test-Driven Development

Canon TDD per Kent Beck:

1. List the test scenarios to cover
2. Turn one item into a runnable test
3. Make all tests pass — add discoveries to the list
4. Optionally refactor
5. Repeat until list empty

## 1. Test List

See [test_list.md](test_list.md). Identify [deep modules](deep_modules.md) and [testable interfaces](interface_design.md). Confirm priorities with user.

## 2. Write One Test

Test behavior through public interfaces, not implementation. See [tests.md](tests.md), [mocking.md](mocking.md).

Mistakes: tests without assertions; converting all list items at once.

## 3. Make It Pass

Minimal code. Add discovered behaviors to list. If discovery invalidates earlier work, restart with different order.

Mistakes: deleting assertions to fake-pass; copying computed values into expected; refactoring while RED.

## 4. Refactor (Optional)

After GREEN. See [refactoring.md](refactoring.md).

Mistakes: refactoring beyond session need; abstracting too soon — duplication is a hint, not a command.

## 5. Repeat

Until list is empty.
