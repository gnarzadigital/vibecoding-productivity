# Git Hooks

Understanding and customizing the Git hooks that enforce code quality and commit standards.

## Overview

Git hooks are scripts that run automatically at certain points in the Git workflow. The Vibecoding framework uses Lefthook to manage these hooks and ensure consistent code quality.

## Hook Types

### Pre-commit Hooks

**Runs before each commit** to ensure code quality:

```yaml
pre-commit:
  commands:
    lint-staged:
      run: npx lint-staged
      glob: "*.{js,jsx,ts,tsx,json,md}"
```

**What it does**:
- Formats staged files with Prettier
- Runs ESLint on staged files
- Fixes auto-fixable issues
- Prevents commit if errors remain

### Pre-push Hooks

**Runs before pushing** to catch issues early:

```yaml
pre-push:
  commands:
    test:
      run: npm test
      fail_text: "Tests failed"
    build:
      run: npm run build
      fail_text: "Build failed"
```

**What it does**:
- Runs test suite
- Builds the project
- Prevents push if tests fail or build breaks

### Commit-msg Hooks

**Runs on commit message** to enforce standards:

```yaml
commit-msg:
  commands:
    commitlint:
      run: npx commitlint --edit $1
```

**What it does**:
- Validates commit message format
- Enforces conventional commit standards
- Prevents commits with invalid messages

## Configuration

### Lefthook Configuration

**`lefthook.yml`**:
```yaml
# Pre-commit hooks
pre-commit:
  commands:
    lint-staged:
      run: npx lint-staged
      glob: "*.{js,jsx,ts,tsx,json,md}"
      glob: "*.{py}"
      glob: "*.{go}"

# Pre-push hooks  
pre-push:
  commands:
    test:
      run: npm test
      fail_text: "Tests failed"
    build:
      run: npm run build
      fail_text: "Build failed"

# Commit message hooks
commit-msg:
  commands:
    commitlint:
      run: npx commitlint --edit $1
```

### Lint-staged Configuration

**`.lintstagedrc.json`**:
```json
{
  "*.{js,jsx,ts,tsx}": [
    "eslint --fix",
    "prettier --write"
  ],
  "*.{json,md}": [
    "prettier --write"
  ],
  "*.{py}": [
    "black",
    "isort"
  ]
}
```

### Commitlint Configuration

**`commitlint.config.js`**:
```javascript
module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2,
      'always',
      ['feat', 'fix', 'docs', 'style', 'refactor', 'test', 'chore']
    ],
    'subject-case': [2, 'never', ['start-case', 'pascal-case', 'upper-case']],
    'subject-empty': [2, 'never'],
    'subject-full-stop': [2, 'never', '.'],
    'header-max-length': [2, 'always', 100]
  }
};
```

## Installation and Setup

### Initial Setup

```bash
# Install Lefthook
npm install --save-dev lefthook

# Install hooks
npx lefthook install

# Test hooks
npx lefthook run pre-commit
```

### Bootstrap Script

**`scripts/bootstrap.sh`**:
```bash
#!/bin/bash

echo "🚀 Setting up Vibecoding automation..."

# Install dependencies
npm install

# Install Git hooks
npx lefthook install

# Initialize Changesets
npx changeset init

echo "✅ Setup complete!"
echo "📝 Use 'npx czg' for interactive commits"
echo "🔧 Hooks are now active"
```

## Daily Usage

### Interactive Commits

**Use `npx czg` for all commits**:

```bash
npx czg
```

This provides:
- **Type selection** (feat, fix, docs, etc.)
- **Scope prompts** for better organization
- **Subject and body** prompts
- **Automatic validation**

### Commit Types

**Conventional commit types**:
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `style:` - Code formatting
- `refactor:` - Code refactoring
- `test:` - Adding tests
- `chore:` - Maintenance tasks

**Examples**:
```bash
feat: add user authentication
fix: resolve login validation issue
docs: update installation guide
style: format code with prettier
```

### Bypassing Hooks

**Emergency bypass** (use sparingly):
```bash
git commit -m "fix: emergency hotfix" --no-verify
```

**Skip specific hooks**:
```bash
# Skip pre-commit hooks
git commit -m "fix: skip hooks" --no-verify

# Skip pre-push hooks
git push --no-verify
```

## Customization

### Adding New Hooks

**Add to `lefthook.yml`**:
```yaml
pre-commit:
  commands:
    lint-staged:
      run: npx lint-staged
    security:
      run: npm audit
      fail_text: "Security vulnerabilities found"
    type-check:
      run: npx tsc --noEmit
      fail_text: "TypeScript errors found"
```

### Language-Specific Hooks

**Python projects**:
```yaml
pre-commit:
  commands:
    black:
      run: black --check .
      glob: "*.py"
    isort:
      run: isort --check-only .
      glob: "*.py"
    flake8:
      run: flake8 .
      glob: "*.py"
```

**Go projects**:
```yaml
pre-commit:
  commands:
    gofmt:
      run: gofmt -s -w .
      glob: "*.go"
    golint:
      run: golint ./...
      glob: "*.go"
    go-vet:
      run: go vet ./...
      glob: "*.go"
```

### Custom Lint Rules

**ESLint configuration**:
```javascript
// .eslintrc.js
module.exports = {
  extends: ['@typescript-eslint/recommended'],
  rules: {
    'no-console': 'error',
    'prefer-const': 'error',
    '@typescript-eslint/no-unused-vars': 'error'
  }
};
```

**Prettier configuration**:
```json
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": true,
  "printWidth": 80,
  "tabWidth": 2
}
```

## Troubleshooting

### Common Issues

**Hooks not running**:
```bash
# Reinstall hooks
npx lefthook install

# Check hook status
npx lefthook run pre-commit
```

**Permission errors**:
```bash
# Make scripts executable
chmod +x scripts/bootstrap.sh
chmod +x .git/hooks/pre-commit
```

**Lint-staged not working**:
```bash
# Check configuration
cat .lintstagedrc.json

# Test manually
npx lint-staged
```

**Commitlint errors**:
```bash
# Use interactive commit tool
npx czg

# Check commit message format
echo "feat: add new feature" | npx commitlint
```

### Debugging Hooks

**Run hooks manually**:
```bash
# Test pre-commit
npx lefthook run pre-commit

# Test pre-push
npx lefthook run pre-push

# Test commit-msg
echo "feat: test commit" | npx commitlint
```

**Verbose output**:
```bash
# Run with debug info
DEBUG=lefthook npx lefthook run pre-commit
```

**Check hook files**:
```bash
# List hook files
ls -la .git/hooks/

# Check hook content
cat .git/hooks/pre-commit
```

## Advanced Configuration

### Conditional Hooks

**Run hooks only for specific files**:
```yaml
pre-commit:
  commands:
    lint-js:
      run: eslint --fix
      glob: "*.{js,jsx,ts,tsx}"
    lint-python:
      run: black --check .
      glob: "*.py"
    test:
      run: npm test
      only: "package.json"
```

### Parallel Execution

**Run multiple commands in parallel**:
```yaml
pre-commit:
  commands:
    lint:
      run: npx lint-staged
    type-check:
      run: npx tsc --noEmit
    security:
      run: npm audit
  parallel: true
```

### Custom Scripts

**Add custom validation**:
```yaml
pre-commit:
  commands:
    custom-check:
      run: ./scripts/custom-validation.sh
      fail_text: "Custom validation failed"
```

**`scripts/custom-validation.sh`**:
```bash
#!/bin/bash

# Check for TODO comments
if grep -r "TODO:" src/; then
  echo "❌ TODO comments found in source code"
  exit 1
fi

# Check for console.log
if grep -r "console.log" src/; then
  echo "❌ console.log statements found"
  exit 1
fi

echo "✅ Custom validation passed"
```

## Best Practices

### Commit Message Standards

1. **Use conventional commit format**
2. **Keep subject line under 50 characters**
3. **Use imperative mood** ("add feature" not "added feature")
4. **Include scope when relevant** ("feat(api): add user endpoint")

### Code Quality Standards

1. **Format code before committing**
2. **Fix linting errors**
3. **Write tests for new features**
4. **Update documentation**

### Hook Management

1. **Keep hooks fast** (under 30 seconds)
2. **Make hooks idempotent** (safe to run multiple times)
3. **Provide clear error messages**
4. **Allow bypassing for emergencies**

## Integration with CI/CD

### GitHub Actions

**`.github/workflows/quality.yml`**:
```yaml
name: Code Quality

on: [push, pull_request]

jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
      - name: Install dependencies
        run: npm ci
      - name: Run linting
        run: npm run lint
      - name: Check formatting
        run: npm run format:check
      - name: Run tests
        run: npm test
```

### Pre-commit CI

**Use pre-commit framework**:
```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-added-large-files
```

## Next Steps

Now that you understand Git hooks:

1. **Customize hooks** for your project needs
2. **Add language-specific** linting rules
3. **Integrate with CI/CD** pipelines
4. **Experiment with different** validation rules
5. **Share configurations** with your team

Remember: The goal is to catch issues early and maintain consistent code quality across your project.
