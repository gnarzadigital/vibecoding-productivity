# Automation Setup

Complete guide to setting up the automation stack that powers the Vibecoding framework.

## Overview

The automation stack provides:

- **One-command setup** for new projects
- **Automated formatting** and linting
- **Conventional commit enforcement**
- **Automated versioning** and releases
- **Documentation deployment**
- **GitHub Actions** for CI/CD

## Quick Setup

### One-Command Bootstrap

```bash
git clone https://github.com/yourusername/vibecoding-productivity.git my-project
cd my-project
npm run setup
```

This single command installs and configures everything.

### Manual Setup

If you prefer to understand each step:

```bash
# 1. Install dependencies
npm install

# 2. Run bootstrap script
./scripts/bootstrap.sh

# 3. Initialize Changesets
npx changeset init

# 4. Install Git hooks
npx lefthook install
```

## What Gets Installed

### Development Dependencies

```json
{
  "devDependencies": {
    "@changesets/cli": "^2.27.1",
    "@commitlint/cli": "^19.3.0",
    "@commitlint/config-conventional": "^19.2.2",
    "husky": "^9.0.11",
    "lefthook": "^1.6.4",
    "lint-staged": "^15.2.2",
    "prettier": "^3.2.5"
  }
}
```

### Git Hooks (Lefthook)

**Pre-commit hooks**:
- Format staged files with Prettier
- Run lint-staged for code quality
- Validate commit messages

**Pre-push hooks**:
- Run tests (if available)
- Build project (if applicable)
- Check for uncommitted changes

**Commit-msg hooks**:
- Validate commit message format
- Enforce conventional commits

### Configuration Files

**`.lintstagedrc.json`**:
```json
{
  "*.{js,jsx,ts,tsx,json,md}": ["prettier --write"],
  "*.{js,jsx,ts,tsx}": ["eslint --fix"]
}
```

**`commitlint.config.js`**:
```javascript
module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2,
      'always',
      ['feat', 'fix', 'docs', 'style', 'refactor', 'test', 'chore']
    ]
  }
};
```

**`lefthook.yml`**:
```yaml
pre-commit:
  commands:
    lint-staged:
      run: npx lint-staged
      glob: "*.{js,jsx,ts,tsx,json,md}"

pre-push:
  commands:
    test:
      run: npm test
      fail_text: "Tests failed"
    build:
      run: npm run build
      fail_text: "Build failed"

commit-msg:
  commands:
    commitlint:
      run: npx commitlint --edit $1
```

## Daily Workflow Integration

### Interactive Commits

**Use `npx czg` for all commits**:

```bash
npx czg
```

This provides:
- **Type selection** (feat, fix, docs, etc.)
- **Scope prompts** for better organization
- **Automatic formatting** per Conventional Commits
- **Commit message validation**

### Automated Formatting

**Runs automatically on commit**:
- Prettier formats all staged files
- ESLint fixes auto-fixable issues
- Commit message validation

**Manual formatting**:
```bash
npm run format        # Format all files
npm run format:check  # Check without changes
```

### Version Management

**Add changesets for your changes**:
```bash
npx changeset
```

**Publish releases**:
```bash
npm run release      # Version and publish
```

## GitHub Actions

### Documentation Deployment

**`.github/workflows/docs.yml`**:
```yaml
name: Deploy Documentation

on:
  push:
    branches: [main]
    paths: ['docs/**', 'mkdocs.yml']

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.x'
      - name: Install dependencies
        run: |
          pip install mkdocs-material
      - name: Build docs
        run: mkdocs build
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./site
```

### Automated Releases

**`.github/workflows/release.yml`**:
```yaml
name: Release

on:
  push:
    branches: [main]

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
      - name: Install dependencies
        run: npm ci
      - name: Create Release Pull Request
        id: changesets
        uses: changesets/action@v1
        with:
          publish: npm run release
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Configuration Options

### Customizing Prettier

**`.prettierrc`**:
```json
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": true,
  "printWidth": 80,
  "tabWidth": 2,
  "useTabs": false
}
```

### Customizing ESLint

**`.eslintrc.js`**:
```javascript
module.exports = {
  extends: ['@typescript-eslint/recommended'],
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint'],
  rules: {
    'no-console': 'error',
    'prefer-const': 'error'
  }
};
```

### Customizing Commitlint

**`commitlint.config.js`**:
```javascript
module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2,
      'always',
      ['feat', 'fix', 'docs', 'style', 'refactor', 'test', 'chore', 'perf']
    ],
    'scope-enum': [
      2,
      'always',
      ['core', 'ui', 'api', 'docs', 'config']
    ]
  }
};
```

## Troubleshooting

### Common Issues

**Git hooks not working**:
```bash
npx lefthook install
npx lefthook run pre-commit
```

**Commitlint errors**:
```bash
npx czg  # Use interactive commit tool
```

**Prettier conflicts**:
```bash
npm run format
git add .
git commit -m "style: format code"
```

**Changesets not working**:
```bash
npx changeset init
npx changeset
```

### Permission Issues

**On macOS/Linux**:
```bash
chmod +x scripts/bootstrap.sh
./scripts/bootstrap.sh
```

**On Windows**:
```bash
# Use Git Bash or WSL
bash scripts/bootstrap.sh
```

### Node.js Version Issues

**Check Node version**:
```bash
node --version  # Should be 18+
```

**Use Node Version Manager**:
```bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install Node 18
nvm install 18
nvm use 18
```

## Advanced Configuration

### Custom Scripts

**`package.json`**:
```json
{
  "scripts": {
    "setup": "npm install && ./scripts/bootstrap.sh",
    "format": "prettier --write .",
    "format:check": "prettier --check .",
    "lint": "eslint . --ext .js,.jsx,.ts,.tsx",
    "lint:fix": "eslint . --ext .js,.jsx,.ts,.tsx --fix",
    "test": "jest",
    "build": "tsc",
    "release": "changeset publish"
  }
}
```

### Environment Variables

**`.env.example`**:
```bash
# OpenAI API (optional - for AI features)
OPENAI_API_KEY=your_openai_api_key_here

# GitHub Token (optional - for GitHub integrations)
GITHUB_TOKEN=your_github_personal_access_token_here

# Other service API keys
# Add your project-specific variables below
```

### CI/CD Customization

**Custom GitHub Actions**:
```yaml
name: Custom Workflow

on:
  pull_request:
    branches: [main]

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
      - name: Run tests
        run: npm test
      - name: Run linting
        run: npm run lint
      - name: Check formatting
        run: npm run format:check
```

## Best Practices

### Commit Strategy

1. **Use interactive commits** (`npx czg`)
2. **Make atomic commits** (one logical change per commit)
3. **Write descriptive commit messages**
4. **Use conventional commit format**

### Code Quality

1. **Format code before committing**
2. **Fix linting errors**
3. **Write tests for new features**
4. **Update documentation**

### Release Management

1. **Add changesets for significant changes**
2. **Use semantic versioning**
3. **Update CHANGELOG.md**
4. **Tag releases properly**

## Next Steps

Now that automation is set up:

1. **Practice the daily workflow** with automated tools
2. **Customize configuration** for your project needs
3. **Set up GitHub Actions** for CI/CD
4. **Experiment with different rules** and patterns
5. **Measure productivity improvements**

Remember: The goal is to automate the boring stuff so you can focus on building great software with AI assistance.
