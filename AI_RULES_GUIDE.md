# AI Rules Management Guide

## 🎯 Overview

This project uses **[rulesync](https://www.npmjs.com/package/rulesync)** to
maintain a **single source of truth** for AI behavior rules that automatically
generates configurations for multiple AI coding tools.

## 📁 File Structure

```
.rulesync/              # Master configuration (EDIT HERE)
├── rules/              # AI behavior rules
│   ├── core.md
│   ├── planning-first.md
│   ├── task-execution.md
│   └── ... (13 total)
├── commands/           # Slash commands
│   └── review-pr.md
├── subagents/          # Agent configurations
│   └── planner.md
└── .mcp.json           # Model Context Protocol

rulesync.jsonc          # Rulesync configuration

📤 Generated Configs (DO NOT EDIT - Auto-generated)
├── CLAUDE.md           # Claude Code
├── .claude/
│   ├── memories/
│   ├── commands/
│   └── agents/
├── .cursor/rules/      # Cursor IDE
├── .github/
│   └── instructions/   # GitHub Copilot
├── .clinerules/        # Cline
├── .roo/rules/         # Roo Code
├── AGENTS.md           # Codex CLI
└── ... (7+ tools)
```

## ✏️ How to Edit Rules

### Step 1: Edit Master Rules

**Only edit files in `.rulesync/` directory:**

```bash
# Open the rules directory
code .rulesync/rules/

# Edit a specific rule
vim .rulesync/rules/planning-first.md
```

### Step 2: Regenerate Configs

**Option A: Manual Sync**

```bash
npm run ai:sync
```

**Option B: Auto-Sync on Commit** (Recommended)

```bash
git add .rulesync/rules/planning-first.md
git commit -m "feat: enhance planning workflow"
# ✨ Git hooks auto-regenerate all configs before commit!
```

### Step 3: Verify Generated Files

```bash
# Check generated Claude Code config
cat CLAUDE.md

# Check generated Cursor rules
ls .cursor/rules/

# Check generated Copilot instructions
ls .github/instructions/
```

## 📝 Rule File Format

Rules use standard Markdown with optional YAML frontmatter:

```markdown
---
description: 'Brief description for AI context selection'
globs: '**/*.ts' # File patterns this rule applies to
alwaysApply: true # Always include this rule
---

# Rule Title

Your rule content here in markdown...

## Subsections

- Bullet points
- Code examples
- Best practices
```

**Frontmatter Fields:**

- `description`: Brief description (used by AI to select relevant rules)
- `globs`: File patterns (e.g., `**/*.ts`, `**/*.py`, `src/**/*`)
- `alwaysApply`: `true` = always active, `false` = context-aware

## 🔧 Common Tasks

### Add a New Rule

```bash
# Create new rule file
touch .rulesync/rules/new-rule.md

# Edit the file
code .rulesync/rules/new-rule.md

# Regenerate configs
npm run ai:sync
```

### Import Existing Rules

```bash
# Import from Cursor
npm run ai:import -- -t cursor -f rules

# Import from Claude Code
npm run ai:import -- -t claudecode -f rules
```

### Update Rulesync Configuration

Edit [rulesync.jsonc](rulesync.jsonc):

```jsonc
{
  "targets": [
    "copilot", // GitHub Copilot
    "cursor", // Cursor IDE
    "claudecode", // Claude Code
    "cline", // Cline
    "roo", // Roo Code
    "codexcli", // Codex CLI
    "gemini" // Gemini CLI
  ],
  "features": [
    "rules", // Generate rule files
    "ignore", // Generate ignore files
    "mcp", // Generate MCP configs
    "commands", // Generate slash commands
    "subagents" // Generate agent configs
  ]
}
```

### Add to .gitignore

```bash
npm run ai:gitignore
```

This adds all generated files to `.gitignore` automatically.

## 🎯 Supported AI Tools

| Tool               | Config File                      | Auto-Generated |
| ------------------ | -------------------------------- | -------------- |
| **Cursor**         | `.cursor/rules/*.mdc`            | ✅             |
| **Claude Code**    | `CLAUDE.md`, `.claude/memories/` | ✅             |
| **GitHub Copilot** | `.github/instructions/`          | ✅             |
| **Cline**          | `.clinerules/*.md`               | ✅             |
| **Roo Code**       | `.roo/rules/*.md`                | ✅             |
| **Codex CLI**      | `AGENTS.md`, `.codex/`           | ✅             |
| **Gemini CLI**     | `GEMINI.md`, `.gemini/`          | ✅             |
| **Windsurf**       | Uses Cursor format               | 🔄             |
| **Augment**        | Universal config                 | 🔄             |

## 🚀 Workflow Integration

### Git Hooks (Automatic)

The `.lefthook.yml` configuration automatically regenerates AI configs when you
commit changes to `.rulesync/`:

```yaml
pre-commit:
  commands:
    ai-sync:
      glob: '.rulesync/**/*.md'
      run: npm run ai:sync
      stage_fixed: true
```

### NPM Scripts

Available commands in [package.json](package.json):

```bash
npm run ai:sync      # Generate all AI configs
npm run ai:import    # Import from existing tools
npm run ai:init      # Initialize rulesync
npm run ai:gitignore # Update .gitignore
npm run ai:help      # Show rulesync help
```

## 📚 Best Practices

### ✅ DO

- ✅ **Edit only** `.rulesync/` files
- ✅ Use descriptive frontmatter
- ✅ Test rules with `npm run ai:sync`
- ✅ Commit `.rulesync/` to version control
- ✅ Add generated files to `.gitignore`
- ✅ Use semantic commit messages
- ✅ Document rule changes in commit messages

### ❌ DON'T

- ❌ **Never edit** generated files directly (`CLAUDE.md`, `.cursor/rules/`,
  etc.)
- ❌ Don't commit generated files (they're in `.gitignore`)
- ❌ Don't mix rule sources (use only `.rulesync/`)
- ❌ Don't forget to run `npm run ai:sync` after editing

## 🐛 Troubleshooting

### Generated files are out of sync

```bash
# Regenerate all configs
npm run ai:sync
```

### Git hooks not working

```bash
# Reinstall git hooks
npx lefthook install
```

### Rules not showing in AI tool

1. Check that configs were generated: `ls CLAUDE.md .cursor/rules/`
2. Verify rulesync config: `cat rulesync.jsonc`
3. Check AI tool is in targets list
4. Restart your AI coding tool

### Import failed

```bash
# Check available tools
npm run ai:help

# Import with verbose output
npx rulesync import -t cursor -f rules -V
```

## 🔗 Resources

- [Rulesync Documentation](https://www.npmjs.com/package/rulesync)
- [Rulesync GitHub](https://github.com/dyoshikawa/rulesync)
- [Cursor Rules Directory](https://cursor.directory)
- [Awesome Cursor Rules](https://github.com/PatrickJS/awesome-cursorrules)

## 📝 Example: Adding a New Framework Rule

Let's add a React-specific rule:

```bash
# 1. Create the file
touch .rulesync/rules/react.md

# 2. Edit with your rule
cat > .rulesync/rules/react.md << 'EOF'
---
description: "React and Next.js best practices"
globs: "**/*.{tsx,jsx}"
alwaysApply: false
---

# React & Next.js Standards

## Component Structure
- Use functional components with hooks
- Prefer `const` arrow functions
- Use TypeScript for all components

## Naming Conventions
- Components: PascalCase (e.g., `UserProfile.tsx`)
- Hooks: camelCase with 'use' prefix (e.g., `useAuth.ts`)
- Utilities: camelCase (e.g., `formatDate.ts`)

## Best Practices
- Use React 18+ features (Suspense, Concurrent Mode)
- Implement proper error boundaries
- Use Next.js App Router (not Pages Router)
- Optimize with React.memo for expensive renders
EOF

# 3. Regenerate all configs
npm run ai:sync

# 4. Verify it was generated
cat .cursor/rules/react.mdc
cat .claude/memories/react.md
cat .github/instructions/react.instructions.md

# 5. Commit the change
git add .rulesync/rules/react.md
git commit -m "feat: add React best practices rule"
```

Now all your AI tools will follow the same React conventions! 🎉

---

**Remember**: `.rulesync/` is your single source of truth. Edit there, sync
everywhere! 🚀
