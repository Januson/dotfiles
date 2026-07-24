# Interface Design for Testability

- **Accept dependencies, don't create them** — inject via param or constructor, never `new` inside
- **Return results, don't produce side effects** — pure functions over mutation
- **Small surface area** — fewer methods, fewer params
