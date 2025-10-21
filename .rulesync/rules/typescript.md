---
targets:
  - '*'
root: false
description: TypeScript best practices and standards
globs: []
cursor:
  description: TypeScript best practices and standards
---

# TypeScript Standards

## Type Safety Rules

- NO 'any' types allowed
- Strict mode enabled
- Explicit return types for functions
- Proper interface definitions

## Interface Patterns

```typescript
// User interface example
interface User {
  id: string
  email: string
  name: string
  createdAt: Date
  updatedAt: Date
}

// API response wrapper
interface ApiResponse<T> {
  data: T
  success: boolean
  message?: string
  error?: string
}
```

## Function Type Definitions

```typescript
// Explicit return types
const calculateTotal = (items: Item[]): number => {
  return items.reduce((sum, item) => sum + item.price, 0)
}

// Async function types
const fetchUser = async (id: string): Promise<User> => {
  // implementation
}
```

## Component Props

```typescript
interface ButtonProps {
  children: React.ReactNode
  onClick: () => void
  variant?: 'primary' | 'secondary'
  disabled?: boolean
  className?: string
}

const Button: React.FC<ButtonProps> = ({
  children,
  onClick,
  variant = 'primary',
  disabled = false,
  className,
}) => {
  // implementation
}
```

## Generic Types

```typescript
// Generic API hook
const useApi = <T>(
  url: string
): { data: T | null; loading: boolean; error: string | null } => {
  // implementation
}
```

## Enum Usage

```typescript
enum UserRole {
  ADMIN = 'admin',
  USER = 'user',
  MODERATOR = 'moderator',
}

enum ApiStatus {
  IDLE = 'idle',
  LOADING = 'loading',
  SUCCESS = 'success',
  ERROR = 'error',
}
```

## Type Guards

```typescript
const isUser = (obj: unknown): obj is User => {
  return (
    typeof obj === 'object' && obj !== null && 'id' in obj && 'email' in obj
  )
}
```

## Utility Types

```typescript
// Partial for updates
type UserUpdate = Partial<Pick<User, 'name' | 'email'>>

// Required for creation
type UserCreate = Required<Pick<User, 'email' | 'name'>>

// Omit for responses
type UserResponse = Omit<User, 'password'>
```
