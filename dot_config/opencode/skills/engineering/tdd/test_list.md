# Test List

The test list is the input to Canon TDD. Without it, you're guessing test order.

## What goes on the list

- The basic case
- Variants of the new behavior ("what if the key isn't in the database yet?")
- Existing behaviors the change might break
- Edge cases that matter

## What does NOT go on the list

- Implementation details — only behavior, never "how"
- Tests for code you don't yet need

## Order matters

Test order shapes the implementation. Start with the tracer bullet — simplest case that proves the end-to-end path works. Then:

- Simplest behavior first → fastest feedback
- Riskiest behavior first → fail fast on infeasibility

Picking poorly means rework. Restart with a different order if needed.

## The list evolves

Add discoveries immediately as you make earlier tests pass. Don't enumerate everything upfront.
