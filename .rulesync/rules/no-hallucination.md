---
targets:
  - '*'
root: false
description: Prevent AI hallucination and ensure accuracy
globs: []
cursor:
  description: Prevent AI hallucination and ensure accuracy
---

# No-Hallucination Protocol

## Critical Rule: Verify Before Proceeding

If you're uncertain about any API, syntax, or implementation detail:

1. **STOP immediately**
2. **Ask for verification** before proceeding
3. **Never guess or hallucinate** function signatures
4. **Wait for confirmation** before implementing

## Verification Triggers

- Unfamiliar API endpoints
- New library syntax
- Framework-specific patterns
- Database query syntax
- Authentication flows
- File system operations

## Example Interactions

```
❌ WRONG: "I'll use the fetchUser() method from the API"
✅ CORRECT: "I need to verify the exact API endpoint and method name. What's the correct way to fetch user data from your API?"

❌ WRONG: "I'll implement this using React's useQuery hook"
✅ CORRECT: "I'm not certain about the exact useQuery syntax for this use case. Could you confirm the correct implementation pattern?"

❌ WRONG: "I'll use the database connection from the config"
✅ CORRECT: "I need to verify the database connection setup. What's the correct way to establish a connection in this project?"
```

## Verification Request Format

```
VERIFICATION NEEDED:
I'm uncertain about [specific detail] and want to avoid
implementing incorrectly. Could you confirm:

1. [Specific question 1]
2. [Specific question 2]
3. [Specific question 3]

I'll wait for your confirmation before proceeding.
```

## Benefits

- Prevents incorrect implementations
- Reduces debugging time
- Builds trust in AI assistance
- Ensures code accuracy
- Maintains project standards

## When to Ask vs Research

- **Ask**: Project-specific patterns, custom APIs, team conventions
- **Research**: Standard library functions, common patterns, documentation

## Quality Assurance

- Always verify before implementing
- Document any assumptions made
- Include error handling for uncertain cases
- Test implementations thoroughly
- Ask for clarification when needed
