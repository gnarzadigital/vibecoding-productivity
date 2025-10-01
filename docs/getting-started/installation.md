# Installation Guide

This guide will help you set up the Vibecoding Productivity Framework in your project.

## Prerequisites

Before you begin, ensure you have:

- **Node.js** (v18 or higher)
- **Git** (for version control)
- **npm** or **yarn** (package manager)
- **Cursor** or **Windsurf** (AI-powered IDE)

## Quick Setup

### Option 1: One-Command Bootstrap (Recommended)

```bash
git clone https://github.com/yourusername/vibecoding-productivity.git my-project
cd my-project
npm run setup
```

This single command will:
- Install all development dependencies
- Initialize Changesets for version management
- Install and configure Git hooks
- Set up pre-commit formatting and validation
- Configure the automation stack

### Option 2: Manual Setup

If you prefer to understand each step:

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/vibecoding-productivity.git my-project
cd my-project

# 2. Install dependencies
npm install

# 3. Run the bootstrap script
./scripts/bootstrap.sh

# 4. Initialize Changesets (for version management)
npx changeset init

# 5. Install Git hooks
npx lefthook install
```

## First-Time Configuration

After the initial setup, customize these essential files:

### 1. Project Planning (`PLANNING.md`)

Update with your project details:

```markdown
# Project: [Your Project Name]

## Vision
[Your project's purpose and goals]

## Tech Stack
- Frontend: [React, Vue, etc.]
- Backend: [Node.js, Python, etc.]
- Database: [PostgreSQL, MongoDB, etc.]

## Architecture
[High-level system design]
```

### 2. Task Management (`TASK.md`)

Set up your first sprint:

```markdown
# Sprint: [Sprint Name]

## 🎯 Sprint Goals
- [ ] [Primary goal 1]
- [ ] [Primary goal 2]

## 🔄 In Progress
- [ ] [Current task]
```

### 3. AI Memory (`AI_MEMORY.md`)

Start documenting project-specific learnings:

```markdown
# AI Memory - [Project Name]

## Project Context
[Key project details for AI context]

## Common Patterns
[Frequently used code patterns]

## Known Issues
[Issues and workarounds]
```

### 4. Documentation (`mkdocs.yml`)

Update site information:

```yaml
site_name: [Your Project Name]
site_author: [Your Name]
site_url: https://yourusername.github.io/your-project
```

## Verification

Test that everything is working:

```bash
# Test Git hooks
git add .
git commit -m "test: verify setup"

# Test formatting
npm run format:check

# Test documentation build
mkdocs build

# Test automation
npm run setup
```

## Troubleshooting

### Common Issues

**Git hooks not working:**
```bash
npx lefthook install
```

**Commitlint errors:**
```bash
npx czg  # Use interactive commit tool
```

**MkDocs build fails:**
```bash
pip install mkdocs-material
mkdocs build
```

**Permission errors on macOS/Linux:**
```bash
chmod +x scripts/bootstrap.sh
```

### Getting Help

If you encounter issues:

1. Check the [troubleshooting section](../reference/troubleshooting.md)
2. Review the [FAQ](../reference/faq.md)
3. Open an issue on GitHub
4. Join our community discussions

## Next Steps

Once setup is complete:

1. **Read the [Quick Start Guide](quick-start.md)**
2. **Explore the [Core Concepts](../framework/core-concepts.md)**
3. **Set up your [Daily Workflow](../framework/workflow.md)**
4. **Customize [Framework Rules](../templates/framework-rules.md)**

## Advanced Setup

### Spec Kit Integration (Optional)

For spec-driven development:

```bash
npx specify init . --ai cursor
```

This enables:
- `specify plan <feature>` - Generate specifications
- `specify update` - Sync specs with implementation
- `specify validate` - Verify implementation matches spec

### Custom Rules

Add framework-specific rules from the templates:

```bash
# Copy relevant rules to .cursor/rules/
cp templates/react-rules.mdc .cursor/rules/
cp templates/nodejs-rules.mdc .cursor/rules/
```

## Security Notes

- Never commit `.env` files (use `.env.example`)
- Keep API keys in environment variables
- Review `.gitignore` for your project needs
- Use `.env.example` for required environment variables

## Support

Need help? Check out:

- [Documentation](../index.md)
- [GitHub Issues](https://github.com/yourusername/vibecoding-productivity/issues)
- [Community Discussions](https://github.com/yourusername/vibecoding-productivity/discussions)
