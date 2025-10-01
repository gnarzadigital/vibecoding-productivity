# Vibecoding Productivity Framework

A comprehensive framework for AI-native development that transforms how you build software with AI assistance.

## 🚀 What is Vibecoding?

Vibecoding isn't just using AI to write code - it's programming the AI itself to be a reliable co-developer. This framework provides the structure, rules, and workflows that separate casual prompt engineers from 10x AI-native builders.

## 📁 Project Structure

```
vibecoding-productivity/
│
├── 📋 Core Vibecoding Files (Always at root)
│   ├── PLANNING.md              # Project vision & architecture
│   ├── TASK.md                  # Current sprint & tasks
│   ├── AI_MEMORY.md             # Project-specific learnings
│   ├── WORKFLOW.md              # Daily workflow guide
│   ├── CHANGELOG.md             # Version history
│   └── README.md                # This file
│
├── 🤖 AI Behavior
│   ├── .cursorrules             # Main Cursor configuration
│   └── .cursor/rules/           # Modular AI behavior rules
│       ├── core.mdc             # Core project rules
│       ├── scope-control.mdc    # Prevent scope creep
│       ├── task-execution.mdc   # Task workflow
│       ├── planning-first.mdc   # Plan-Then-Act mandate
│       ├── automation.mdc       # Git hooks & CI/CD
│       └── ... (10 more rules)
│
├── 🔧 Automation Stack
│   ├── scripts/bootstrap.sh     # One-shot setup
│   ├── package.json             # Dependencies & scripts
│   ├── lefthook.yml             # Git hooks
│   ├── .lintstagedrc.json       # Staged file linting
│   ├── commitlint.config.js     # Commit standards
│   ├── .prettierrc              # Code formatting
│   ├── .gitignore               # Git ignore rules
│   └── .changeset/              # Version management
│
├── 📚 Documentation
│   ├── docs/                    # MkDocs documentation
│   │   ├── index.md             # Documentation home
│   │   ├── getting-started/     # Setup guides
│   │   ├── framework/           # Core concepts
│   │   ├── automation/          # CI/CD guides
│   │   ├── templates/           # Project templates
│   │   └── reference/           # Advanced guides
│   │       ├── FRAMEWORK_SUMMARY.md
│   │       ├── UPGRADE_GUIDE.md
│   │       └── vibecoding-secrets.md
│   └── mkdocs.yml               # Docs configuration
│
├── 🚀 CI/CD
│   └── .github/workflows/       # GitHub Actions
│       ├── docs.yml             # Documentation deployment
│       ├── release.yml          # Automated releases
│       └── todo-issue.yml       # TODO to Issue automation
│
├── 📦 Templates
│   └── templates/               # Reusable project templates
│       ├── project-starter.md   # Project setup guide
│       ├── react-rules.mdc      # React/Next.js rules
│       ├── vue-rules.mdc        # Vue.js rules
│       ├── python-rules.mdc     # Python/FastAPI rules
│       ├── nodejs-rules.mdc     # Node.js/Express rules
│       ├── git-workflow.mdc     # Git standards
│       └── deployment.mdc       # Deployment patterns
│
└── 💻 Your Actual Code (Add when using as template)
    ├── src/                     # Source code
    ├── tests/                   # Test files
    └── public/                  # Static assets
```

## 🎯 Core Principles

### 1. Plan-Then-Act (Non-Negotiable)
- **Never** let AI generate code immediately
- **Always** force a two-phase workflow:
  1. Present detailed plan
  2. Wait for approval
  3. Then implement

### 2. Micro-Tasks, Micro-Commits
- Break tasks into 5-15 minute chunks
- Commit after each successful micro-task
- Create instant rollback points

### 3. Ruthless Revert Policy
- Stop after 2-3 failed corrections
- Revert to last good commit
- Analyze failure and retry

### 4. Self-Improving Rules
- Train AI to maintain its own rules
- Update rules based on corrections
- Build project-specific patterns

## 🛠️ Quick Start

### Initial Setup

**One-command bootstrap:**
```bash
git clone https://github.com/yourusername/vibecoding-productivity.git my-project
cd my-project
npm run setup
```

This will:
- Install all dev dependencies (lefthook, prettier, commitlint, changesets, etc.)
- Initialize Changesets for automated versioning
- Install git hooks for commit hygiene
- Set up pre-commit formatting and validation

**Manual setup:**
```bash
# Install dependencies
npm install

# Run bootstrap script
./scripts/bootstrap.sh
```

### First-Time Configuration

After bootstrap, customize these files:

1. **PLANNING.md** - Add your project vision, tech stack, architecture
2. **TASK.md** - Set up your first sprint tasks
3. **AI_MEMORY.md** - Start documenting project-specific learnings
4. **.cursor/rules/** - Add framework-specific rules from templates/
5. **mkdocs.yml** - Update site info (name, URL, author)

### Optional: Spec Kit Integration

For spec-driven development:
```bash
npx specify init . --ai cursor
```

This enables:
- `specify plan <feature>` - Generate spec before coding
- `specify update` - Sync spec with implementation
- `specify validate` - Verify implementation matches spec

### Daily Workflow
1. **Morning**: Review `@TASK.md` and `@PLANNING.md`
2. **Pick Task**: Choose first unchecked item
3. **Plan First**: Present detailed implementation plan
4. **Get Approval**: Wait for "Proceed" command
5. **Implement**: Follow approved plan exactly
6. **Verify**: Test and commit if successful
7. **Update**: Mark task complete in `@TASK.md`

## 📊 Success Metrics

### Track These KPIs
- **Successful AI generations on first try** (target: >70%)
- **Reverts needed per feature** (target: <2)
- **Lines of AI code kept vs deleted** (target: >80% kept)
- **Time to feature completion** (aim for 3-5x improvement)

### Red Flags (You're Doing It Wrong)
- More than 3 prompt iterations per micro-task
- Frequently reverting due to AI misunderstandings
- Spending more time fixing AI code than writing from scratch
- AI frequently touching wrong files

### Green Flags (You're Nailing It)
- AI understands requirements on first try
- Commits are small and atomic
- Code quality consistently high
- Rare need for major refactoring

## 🔧 Advanced Features

### Automated Git Workflow

**Use interactive commits** (enforced by git hooks):
```bash
npx czg
```

This provides:
- Type selection (feat, fix, docs, etc.)
- Scope prompts
- Automatic formatting per Conventional Commits
- Commit message validation

**Automated formatting** (runs on commit):
```bash
npm run format        # Format all files
npm run format:check  # Check without changes
```

**Changesets for releases**:
```bash
npx changeset        # Add changeset for your changes
npm run release      # Publish (creates tags, updates CHANGELOG)
```

### CI/CD Automation

**Documentation** (auto-deploys to GitHub Pages):
- Triggers on push to `main` when `docs/` changes
- Builds MkDocs site and publishes automatically
- Workflow: `.github/workflows/docs.yml`

**Releases** (automated versioning):
- Creates "Version Packages" PR when changesets detected
- Auto-updates CHANGELOG.md on merge
- Creates GitHub releases with tags
- Workflow: `.github/workflows/release.yml`

### Model Selection Strategy
- **Complex reasoning**: GPT-4o, Claude Opus
- **Code implementation**: Claude 3.7 Sonnet, GPT-4o
- **Quick iterations**: Claude 3.7 Sonnet

### Rule Templates
- Browse [cursor.directory](https://cursor.directory) for framework-specific rules
- Use [awesome-cursorrules](https://github.com/PatrickJS/awesome-cursorrules) for community patterns
- Customize rules for your specific project needs

### AI Memory Bank
- Document project-specific quirks in `AI_MEMORY.md`
- Track workarounds and solutions
- Build institutional knowledge over time

## 📚 Resources

### Essential Reading
- [Stop Fighting Your AI: 20+ Advanced Cursor Tricks](https://dev.to)
- [Cursor Official Docs](https://docs.cursor.com)
- [awesome-cursorrules](https://github.com/PatrickJS/awesome-cursorrules)
- [cursor.directory](https://cursor.directory)

### Communities
- r/cursor (Reddit)
- Cursor Discord
- X/Twitter #vibecoding #CursorAI

### Key GitHub Repos
- [PatrickJS/awesome-cursorrules](https://github.com/PatrickJS/awesome-cursorrules) (870+ rules)
- [sparesparrow/cursor-rules](https://github.com/sparesparrow/cursor-rules)
- [Cursor10x](https://github.com/Cursor10x) (advanced workflows)

## 🎓 Learning Path

### Week 1 - Foundation
1. Choose IDE: Cursor or Windsurf
2. Create first project with framework files
3. Set up basic `.cursor/rules/core.mdc`
4. Practice Plan-Then-Act on one feature

### Week 2 - Discipline
1. Add `scope-control.mdc` rules
2. Practice micro-tasks + micro-commits
3. Implement ruthless revert policy
4. Track successful first-try generations

### Week 3 - Optimization
1. Browse cursor.directory for framework rules
2. Create `AI_MEMORY.md`
3. Implement self-improving rules loop
4. Experiment with different models

### Month 2+
- Refine rules based on learnings
- Build personal rule library
- Share rules with team
- Measure productivity gains

## 🤝 Contributing

This framework is designed to be customized for your specific needs. Feel free to:
- Add your own rules to `.cursor/rules/`
- Customize templates for your tech stack
- Share improvements with the community
- Build your own rule library

## 🚀 Upgrading to Full Stack

Once you've mastered the Minimal Stack, you can add advanced automation:

| Tool | What It Does | When to Add |
|------|--------------|-------------|
| **PR-Agent** | AI code review & PR descriptions | 5+ PRs/week |
| **Copilot Agents** | Autonomous task execution | Mass refactoring needs |
| **TODO→Issue** | Auto-create issues from TODOs | Clean codebase |
| **Renovate** | Auto dependency updates | Production apps |

**See [UPGRADE_GUIDE.md](docs/reference/UPGRADE_GUIDE.md) for complete setup instructions.**

---

## 📄 License

This framework is open source and available under the MIT License.

---

**Remember**: Vibecoding mastery isn't about finding perfect prompts - it's about building systems that make AI a reliable, programmable co-developer.

The vibecoding era has arrived. Master these frameworks and you'll build 10x faster while maintaining production quality. Start today.
