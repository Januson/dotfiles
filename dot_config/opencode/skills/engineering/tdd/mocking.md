# Mocking & Test Doubles

Vocab: Meszaros's Dummy / Stub / Fake / Spy / Mock. See Fowler, "Mocks Aren't Stubs."

## Preferences

- **Classical TDD over mockist.** Real objects first. Double only at system boundaries.
- **State verification by default.** Behavior verification only when state is unobservable (caches, fire-and-forget).
- **Pick the weakest double that works:** real > dummy > stub > fake > spy > mock.
- **API design for testability:** SDK-style interfaces (`getUser`, `createOrder`) over generic `fetch(endpoint, options)` — each call independently doubleable, no conditional logic in the double.
