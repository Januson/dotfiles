# Mocking & Test Doubles

## Test Doubles (Meszaros)

- **Dummy** — fills params, never used
- **Stub** — canned answers, no call verification
- **Fake** — working impl, unfit for prod (e.g. in-memory DB)
- **Spy** — stub that also records calls
- **Mock** — pre-set expectations; fails if wrong calls made

## Prefer Classical TDD

Use real objects when possible. Double only at awkward boundaries:
external APIs, DBs (prefer test DB), time, randomness, file system, email.

Avoids coupling tests to implementation. Refactor-friendly. Failure locality is clear.

## State vs Behavior Verification

Default: **state**. Assert on SUT/collaborator state after exercise.

Use **behavior verification** only when state is unobservable:
caches, fire-and-forget side effects (email sent, event published).

## Picking a Double

- **Real object** — first choice
- **Fake** — real is slow/expensive but realistic behavior matters
- **Stub** — just need a canned response
- **Spy** — need to verify "did X happen?" without full mock contract
- **Mock** — behavior verification is the whole point
- **Dummy** — only to satisfy signatures

## When to Double

At system boundaries only. Don't double your own classes or internal collaborators.

## API Design for Testability

Prefer SDK-style interfaces over generic fetchers — each function independently
mockable with no conditional logic inside the double.

```
// GOOD: each function independently doubleable
getUser(id), getOrders(userId), createOrder(data)

// BAD: mock requires internal conditionals
fetch(endpoint, options)
```
