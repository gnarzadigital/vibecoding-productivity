# Quick Start

Get up and running with the Vibecoding Productivity Framework in 5 minutes.

## Prerequisites

- Node.js 18+ installed
- Git installed
- Cursor or Windsurf IDE
- GitHub account (for CI/CD features)

## Installation

### One-Command Setup

```bash
git clone https://github.com/yourusername/vibecoding-productivity.git my-project
cd my-project
npm run setup
```

This will:
- ✅ Install all dev dependencies
- ✅ Initialize Changesets for versioning
- ✅ Install git hooks (lefthook)
- ✅ Set up pre-commit checks
- ✅ Configure commit message validation

### Manual Setup

If you prefer step-by-step:

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/vibecoding-productivity.git my-project
cd my-project

# 2. Install dependencies
npm install

# 3. Run bootstrap script
./scripts/bootstrap.sh

# 4. Verify installation
npx lefthook install
npx changeset init
```

## First-Time Configuration

### 1. Customize Core Files

Edit these files for your project:

**PLANNING.md** - Add your project details:
```markdown
## Vision
[Your project's core purpose]

## Tech Stack
- Frontend: Next.js 14, TypeScript
- Backend: Node.js, Express
- Database: PostgreSQL
```

**TASK.md** - Set up your first sprint:
```markdown
## Sprint Goals
- [ ] Set up project structure
- [ ] Configure CI/CD
- [ ] Implement authentication

## In Progress
- [ ] Create user model
```

**AI_MEMORY.md** - Start documenting learnings:
```markdown
## Library Workarounds
(Add as you discover them)

## Deployment Quirks
(Document as needed)
```

### 2. Add Framework Rules

Copy relevant framework rules from `templates/`:

```bash
# For React/Next.js projects
cp templates/react-rules.mdc .cursor/rules/

# For Vue.js projects
cp templates/vue-rules.mdc .cursor/rules/

# For Python/FastAPI projects
cp templates/python-rules.mdc .cursor/rules/

# For Node.js/Express projects
cp templates/nodejs-rules.mdc .cursor/rules/
```

### 3. Configure MkDocs (Optional)

Update `mkdocs.yml` with your info:

```yaml
site_name: Your Project Name
site_author: Your Name
site_url: https://yourusername.github.io/your-project
repo_url: https://github.com/yourusername/your-project
```

## Making Your First Commit

### Use Interactive Commits

```bash
# Stage your changes
git add .

# Use interactive commit (recommended)
npx czg
```

This provides:
- Type selection (feat, fix, docs, etc.)
- Scope prompts
- Subject validation
- Automatic formatting

### Commit Message Format

If committing manually:
```bash
git commit -m "feat: add user authentication"
git commit -m "fix: resolve login redirect issue"
git commit -m "docs: update README with setup instructions"
```

## Using Plan-Then-Act Workflow

### Example: Adding a Feature

**Step 1 - Request (in Cursor):**
```
I need to add a login form with email and password validation.

IMPORTANT: First, present a detailed plan including:
1. Components needed
2. Validation logic
3. API endpoints
4. Files to create/modify

DO NOT WRITE CODE YET. Wait for my approval.
```

**Step 2 - Review Plan:**
AI presents detailed plan → Review → Ask clarifying questions

**Step 3 - Approve:**
```
Plan approved. Proceed with implementation.
```

**Step 4 - Verify & Commit:**
```bash
# Test the changes
npm run dev

# If good, commit
npx czg
# Select: feat
# Scope: auth
# Subject: add login form with validation
```

## Daily Workflow

### Morning Routine
1. Open `@TASK.md` in Cursor
2. Review `@PLANNING.md` for context
3. Pick first unchecked task
4. Break into micro-tasks

### Task Execution
1. **Plan First** - Present detailed plan
2. **Get Approval** - Wait for "Proceed"
3. **Implement** - Follow approved plan
4. **Verify** - Test thoroughly
5. **Commit** - Use `npx czg`
6. **Update** - Mark task complete in TASK.md

### End of Day
1. Update TASK.md with progress
2. Log learnings in AI_MEMORY.md
3. Push clean commit history
4. Review tomorrow's tasks

## Available Commands

```bash
# Development
npm run setup          # Run bootstrap script
npm run commit         # Interactive commit (npx czg)
npx czg                # Same as above

# Documentation
npm run docs:build     # Build documentation
npm run docs:serve     # Serve docs locally

# Releases
npx changeset          # Add changeset for changes
npm run release:version # Version packages
npm run release        # Publish release

# Formatting
npm run format         # Format all files
npm run format:check   # Check formatting
```

## Verification Checklist

After setup, verify:

- [ ] Git hooks are working (try making a commit)
- [ ] Commitlint validates messages
- [ ] Prettier formats on commit
- [ ] Can run `npx czg` successfully
- [ ] PLANNING.md has your project info
- [ ] TASK.md has first sprint tasks
- [ ] Cursor rules are loaded (check `.cursor/rules/`)

## Troubleshooting

### Git hooks not running
```bash
npx lefthook install
```

### Commit messages rejected
```bash
# Use interactive commits
npx czg
```

### Dependencies missing
```bash
npm install
./scripts/bootstrap.sh
```

### Cursor not loading rules
- Restart Cursor IDE
- Check `.cursor/rules/*.mdc` files exist
- Verify `alwaysApply: true` in rule frontmatter

## Next Steps

- **[Learn core concepts](../framework/core-concepts.md)**
- **[Master the workflow](../framework/workflow.md)**
- **[Explore templates](../templates/project-starter.md)**
- **[Set up CI/CD](../automation/ci-cd.md)**

---

**Congratulations!** Your vibecoding environment is ready. Start building with AI as your reliable co-developer.
