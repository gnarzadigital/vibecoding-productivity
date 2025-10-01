# Vibecoding Productivity Framework

Welcome to the Vibecoding Productivity Framework - a comprehensive system for AI-native development that transforms how you build software with AI assistance.

## 🚀 What is Vibecoding?

Vibecoding isn't just using AI to write code - it's programming the AI itself to be a reliable co-developer. This framework provides the structure, rules, and workflows that separate casual prompt engineers from 10x AI-native builders.

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
1. Copy this framework to your project
2. Run `npm run setup` to install automation tools
3. Customize `PLANNING.md` with your project details
4. Set up `TASK.md` with your first sprint

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

## 🔧 Automation Stack

This framework includes a minimal automation stack:

- **Git Hooks**: Lefthook for fast, parallel Git hooks
- **Code Quality**: lint-staged for staged file linting
- **Commit Standards**: commitlint for conventional commits
- **Versioning**: Changesets for automated releases
- **Documentation**: MkDocs for self-updating docs
- **Issue Management**: TODO→Issue automation

## 📚 Documentation

- [Quick Start Guide](quick-start.md)
- [Framework Components](framework/)
- [Automation Setup](automation/)
- [Project Templates](templates/)

## 🤝 Contributing

This framework is designed to be customized for your specific needs. Feel free to:
- Add your own rules to `.cursor/rules/`
- Customize templates for your tech stack
- Share improvements with the community
- Build your own rule library

---

**Remember**: Vibecoding mastery isn't about finding perfect prompts - it's about building systems that make AI a reliable, programmable co-developer.

The vibecoding era has arrived. Master these frameworks and you'll build 10x faster while maintaining production quality. Start today.

