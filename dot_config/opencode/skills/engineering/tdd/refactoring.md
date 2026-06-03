# Refactor Candidates

- Refactor only when tests are green.
- Tests must pass before and after every change.
- One refactoring at a time. Run tests between each.

## Code Smells → Refactoring

**Duplicated code** → Extract Function / Extract Variable  
Move identical or near-identical logic into a single place.

**Long function** → Extract Function  
Each function does one thing. Break into helpers; test only the public interface.

**Long parameter list** → Introduce Parameter Object  
Group related params into an object.

**Data clumps** → Extract Class / Introduce Parameter Object  
Data that travels together belongs together.

**Primitive obsession** → Replace Primitive with Object  
Model domain concepts explicitly (e.g., `Money`, `PhoneNumber`).

**Switch statements** → Replace Conditional with Polymorphism  
Repeated type-based branching signals missing polymorphism.

**Feature envy** → Move Function  
Logic that uses another object's data more than its own belongs there.

**Temporary variables** → Replace Temp with Query  
Inline or extract variables that obscure intent.

**Divergent change** → Extract Class  
One class changed for many different reasons → split responsibilities.

**Shotgun surgery** → Move Function / Move Field  
One change triggers edits in many classes → consolidate.

**Speculative generality** → Inline Function / Collapse Hierarchy  
Remove abstractions added "for the future" with no current use.

**Comments explaining *what*** → Rename / Extract Function  
Code should be self-explanatory; comments should explain *why*.

## Testing Rule

Test behavior on the public interface. Do not test private methods.
Refactoring changes structure, not behavior — tests must stay green throughout.
