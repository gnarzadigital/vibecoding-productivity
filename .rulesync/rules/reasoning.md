---
targets:
  - '*'
root: false
description: Force explicit reasoning and decision documentation
globs: []
cursor:
  description: Force explicit reasoning and decision documentation
---

# Explicit Reasoning Protocol

## Decision Documentation

When choosing between implementation approaches, ALWAYS add comments explaining:

1. **Chosen approach**
2. **Alternatives considered**
3. **Rationale for the choice**
4. **Trade-offs made**

## Comment Format

```typescript
/* REASONING: Using approach X over Y because
   project guidelines prioritize simplicity over
   performance for this data size. Alternative Y
   would be better for >1000 items but adds
   complexity we don't need yet. */
```

## Examples

### Algorithm Choice

```typescript
// REASONING: Using linear search instead of binary search
// because data is small (<100 items) and unsorted.
// Binary search would require sorting first, adding
// unnecessary complexity for this use case.
const findUser = (users: User[], id: string) => {
  return users.find(user => user.id === id)
}
```

### State Management Choice

```typescript
// REASONING: Using useState instead of useReducer
// because state is simple (just loading/error/data).
// useReducer would be overkill and add complexity
// without benefits for this component.
const [state, setState] = useState({
  loading: false,
  error: null,
  data: null,
})
```

### API Design Choice

```typescript
// REASONING: Using REST instead of GraphQL
// because team is more familiar with REST,
// requirements are simple, and we don't need
// GraphQL's flexibility for this project.
const fetchUsers = async (): Promise<User[]> => {
  const response = await fetch('/api/users')
  return response.json()
}
```

## When to Document Reasoning

- Choosing between multiple valid approaches
- Making performance vs simplicity trade-offs
- Selecting libraries or frameworks
- Deciding on data structures
- Choosing between patterns

## Benefits

- Helps future developers understand decisions
- Documents context that might be forgotten
- Enables better code reviews
- Facilitates refactoring decisions
- Creates learning opportunities

## Quality Standards

- Be specific about alternatives considered
- Explain the trade-offs clearly
- Reference project guidelines or constraints
- Include performance or complexity considerations
- Mention future scalability concerns if relevant
