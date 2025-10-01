# Project Structure Guide

This document explains the organization of the Vibecoding Productivity Framework.

## Directory Structure

```
vibecoding-productivity/
│
├── 📋 Core Vibecoding Files (Always at root)
│   ├── PLANNING.md              # Project vision & architecture
│   ├── TASK.md                  # Current sprint & tasks
│   ├── AI_MEMORY.md             # Project-specific learnings
│   ├── WORKFLOW.md              # Daily workflow guide
│   ├── CHANGELOG.md             # Version history
│   └── README.md                # Project overview
│
├── 🤖 AI Behavior (.cursor/)
│   ├── .cursorrules             # Main Cursor configuration
│   └── rules/                   # Modular AI behavior rules (12 files)
│
├── 🔧 Automation Stack (Root config files)
│   ├── scripts/bootstrap.sh     # One-shot setup script
│   ├── package.json             # Dependencies & npm scripts
│   ├── lefthook.yml             # Git hooks configuration
│   ├── .lintstagedrc.json       # Staged file linting
│   ├── commitlint.config.js     # Commit message standards
│   ├── .prettierrc              # Code formatting rules
│   ├── .gitignore               # Git ignore patterns
│   └── .changeset/              # Version management
│
├── 📚 Documentation (docs/)
│   ├── index.md                 # Documentation home
│   ├── getting-started/         # Setup & quick start
│   ├── framework/               # Core concepts & workflow
│   ├── automation/              # CI/CD & git hooks
│   ├── templates/               # Project templates
│   └── reference/               # Advanced guides
│       ├── FRAMEWORK_SUMMARY.md
│       ├── UPGRADE_GUIDE.md
│       └── vibecoding-secrets.md
│
├── 🚀 CI/CD (.github/workflows/)
│   ├── docs.yml                 # MkDocs deployment
│   ├── release.yml              # Automated releases
│   └── todo-issue.yml           # TODO→Issue automation
│
├── 📦 Templates (templates/)
│   ├── project-starter.md       # Project setup guide
│   ├── react-rules.mdc          # React/Next.js rules
│   ├── vue-rules.mdc            # Vue.js rules
│   ├── python-rules.mdc         # Python/FastAPI rules
│   ├── nodejs-rules.mdc         # Node.js/Express rules
│   ├── git-workflow.mdc         # Git standards
│   └── deployment.mdc           # Deployment patterns
│
└── 💻 Your Code (when using as template)
    ├── src/                     # Source code
    ├── tests/                   # Test files
    └── public/                  # Static assets
```

## File Categories

### 1. Core Vibecoding Files (Root Level)

These files are **always at the project root** and form the foundation of vibecoding:

- **PLANNING.md** - Single source of truth for project vision, tech stack, and architecture
- **TASK.md** - Active sprint tasks in checkbox format for sequential execution
- **AI_MEMORY.md** - Persistent learnings, workarounds, and project-specific knowledge
- **WORKFLOW.md** - Complete daily workflow guide and best practices
- **CHANGELOG.md** - Automated version history (managed by Changesets)
- **README.md** - Project overview and quick start

**Why root level?** These files need to be immediately visible and referenced via `@PLANNING.md` syntax in Cursor.

### 2. AI Behavior Configuration

#### .cursorrules (Root)
- Main Cursor configuration file
- Loaded automatically by Cursor IDE
- Points to modular rules in `.cursor/rules/`

#### .cursor/rules/ (12 modular files)
- **core.mdc** - Context loading, code standards, file organization
- **scope-control.mdc** - Prevent AI scope creep and maintain focus
- **task-execution.mdc** - Sequential task workflow from TASK.md
- **planning-first.mdc** - Enforce Plan-Then-Act mandate
- **automation.mdc** - Git hooks & CI/CD integration
- **error-handling.mdc** - Error handling patterns
- **typescript.mdc** - TypeScript best practices
- **testing.mdc** - Testing standards
- **changelog.mdc** - Automatic changelog updates
- **reasoning.mdc** - Force explicit decision documentation
- **no-hallucination.mdc** - Prevent AI hallucination
- **spec-kit-integration.mdc** - Spec Kit integration (optional)

**Why modular?** Easier to maintain, customize per project, and version control.

### 3. Automation Stack

#### scripts/bootstrap.sh
- One-shot installer for new projects
- Installs dev dependencies
- Initializes git hooks, changesets, etc.
- Run with: `npm run setup`

#### Configuration Files (Root)
- **package.json** - Dependencies and npm scripts
- **lefthook.yml** - Git hooks (pre-commit, commit-msg, pre-push)
- **.lintstagedrc.json** - Only lint/format staged files
- **commitlint.config.js** - Conventional Commits enforcement
- **.prettierrc** - Code formatting rules
- **.gitignore** - Ignore patterns for git
- **.changeset/** - Changesets configuration

**Why root level?** Tools expect these configs at project root.

### 4. Documentation

#### docs/ Directory Structure
```
docs/
├── index.md                     # Landing page
├── getting-started/
│   ├── quick-start.md          # 5-minute setup
│   └── installation.md         # Detailed install
├── framework/
│   ├── core-concepts.md        # Fundamental principles
│   ├── workflow.md             # Daily workflow
│   └── best-practices.md       # Advanced patterns
├── automation/
│   ├── git-hooks.md            # Lefthook guide
│   ├── ci-cd.md                # GitHub Actions
│   └── releases.md             # Changesets workflow
├── templates/
│   └── project-starter.md      # Template usage
└── reference/
    ├── FRAMEWORK_SUMMARY.md    # Complete framework overview
    ├── UPGRADE_GUIDE.md        # Full Stack upgrade path
    └── vibecoding-secrets.md   # Advanced techniques
```

**Why separate docs/?** Keeps root clean, enables MkDocs site generation.

### 5. CI/CD Workflows

#### .github/workflows/
- **docs.yml** - Builds and deploys MkDocs to GitHub Pages on push to `main`
- **release.yml** - Creates release PRs via Changesets on merge to `main`
- **todo-issue.yml** - Converts TODOs to GitHub Issues (optional)

**Why GitHub Actions?** Free for public repos, integrates seamlessly with GitHub.

### 6. Templates

Framework-specific starter rules and configurations:

- **project-starter.md** - How to use this as a template
- **react-rules.mdc** - React/Next.js AI rules
- **vue-rules.mdc** - Vue.js AI rules
- **python-rules.mdc** - Python/FastAPI AI rules
- **nodejs-rules.mdc** - Node.js/Express AI rules
- **git-workflow.mdc** - Git workflow standards
- **deployment.mdc** - Deployment best practices

**Usage:** Copy relevant files to `.cursor/rules/` when starting a project.

## File Access Patterns

### For AI (Cursor)
```
1. Always load: @PLANNING.md, @TASK.md, @AI_MEMORY.md
2. Follow rules: .cursor/rules/*.mdc
3. Reference docs: docs/reference/*.md
```

### For Developers
```
1. Start: README.md → Quick Start
2. Setup: npm run setup (runs scripts/bootstrap.sh)
3. Commit: npx czg (interactive commits)
4. Release: npx changeset (add changeset)
```

### For CI/CD
```
1. Docs: .github/workflows/docs.yml → docs/ → GitHub Pages
2. Releases: .github/workflows/release.yml → .changeset/ → npm
3. Quality: lefthook.yml → pre-commit checks
```

## Design Principles

### 1. Minimal Root Clutter
- Only essential files at root
- Config files are necessary (tools expect them)
- Documentation lives in `docs/`
- Reference materials in `docs/reference/`

### 2. Discoverability
- Clear emoji-based categories in tree view
- Descriptive file names
- Organized subdirectories
- Inline comments in configs

### 3. Separation of Concerns
- **Project management** → Root .md files
- **AI behavior** → .cursor/rules/
- **Automation** → Root configs + .github/workflows/
- **Documentation** → docs/
- **Reusable templates** → templates/

### 4. Template-Ready
- This structure works as-is for starter template
- Add `src/`, `tests/`, `public/` when using for actual project
- All framework files stay at root
- Your code lives separately

## Usage as Template

### For Framework Maintainers (this repo)
```
vibecoding-productivity/
├── [All framework files]
└── [No application code]
```

### For Project Developers (cloned repo)
```
my-new-project/
├── [All framework files from template]
└── [Your application code:]
    ├── src/
    ├── tests/
    └── public/
```

## Migration Notes

If upgrading from old structure:

1. ✅ **Moved to docs/reference/**:
   - `FRAMEWORK_SUMMARY.md`
   - `UPGRADE_GUIDE.md`
   - `vibe-coding productivityhacks.md` → `vibecoding-secrets.md`

2. ✅ **Added**:
   - `.gitignore`
   - `.prettierrc`
   - `docs/index.md`
   - `docs/getting-started/quick-start.md`
   - `PROJECT_STRUCTURE.md` (this file)

3. ✅ **Kept at root** (essential for vibecoding):
   - `PLANNING.md`
   - `TASK.md`
   - `AI_MEMORY.md`
   - `WORKFLOW.md`
   - `CHANGELOG.md`
   - `README.md`

## Quick Reference

| Need to... | Look in... |
|------------|------------|
| Understand project vision | `PLANNING.md` |
| See current tasks | `TASK.md` |
| Find project quirks | `AI_MEMORY.md` |
| Learn daily workflow | `WORKFLOW.md` |
| Set up new project | `docs/getting-started/quick-start.md` |
| Add framework rules | `templates/*.mdc` |
| Configure automation | Root config files |
| Read advanced guides | `docs/reference/` |
| Modify CI/CD | `.github/workflows/` |

---

**This structure is production-ready and optimized for:**
- ✅ AI-native development (Cursor/Windsurf)
- ✅ Solo developers and teams
- ✅ Template usage
- ✅ Clean git history
- ✅ Automated workflows
- ✅ Self-documenting projects
