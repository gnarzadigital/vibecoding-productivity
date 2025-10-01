# Full Stack Upgrade Guide

This guide helps you upgrade from the **Minimal Stack** to the **Full Stack** when you're ready for advanced automation.

## Current Stack (Minimal)

✅ **What you have now:**
- Lefthook (git hooks)
- lint-staged (pre-commit formatting)
- commitlint (commit message validation)
- czg (interactive commits)
- Changesets (manual versioning)
- MkDocs (documentation)

## Full Stack Features

### 🤖 1. PR-Agent (AI Code Review)

**What it does:**
- Analyzes PRs and auto-generates descriptions
- Suggests code improvements
- Reviews code quality and security
- Auto-labels PRs based on content

**When to add:**
- ✅ You're doing 5+ PRs per week
- ✅ You want automated code review
- ✅ Your vibecoding workflow is stable
- ✅ You're comfortable with AI-generated feedback

**Setup:**

1. **Install PR-Agent GitHub App:**
   ```bash
   # Visit: https://github.com/apps/pr-agent-pro
   # Click "Install" and select your repository
   ```

2. **Configure PR-Agent:**
   ```bash
   # Create .pr_agent.toml in repo root
   cat > .pr_agent.toml << 'EOF'
   [pr_reviewer]
   num_code_suggestions = 5
   auto_review = true

   [pr_description]
   publish_description = true
   add_original_user_description = true

   [pr_code_suggestions]
   auto_improve = false  # Manual approval required
   EOF
   ```

3. **Add GitHub Actions workflow:**
   ```yaml
   # .github/workflows/pr-agent.yml
   name: PR Agent

   on:
     pull_request:
       types: [opened, synchronize, reopened]

   permissions:
     contents: read
     pull-requests: write

   jobs:
     pr-agent:
       runs-on: ubuntu-latest
       steps:
         - uses: Codium-ai/pr-agent@main
           env:
             GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
   ```

**Cost:** ~$20/month for Pro (includes AI credits)

---

### 🤝 2. GitHub Copilot Agents

**What it does:**
- Autonomous task execution (generate docs, create tests, refactor)
- Code-aware AI that works across your entire codebase
- Can be triggered via comments or slash commands

**When to add:**
- ✅ You have repetitive tasks Cursor can't handle
- ✅ You need mass refactoring across many files
- ✅ You want automated test generation
- ✅ You're already subscribed to GitHub Copilot

**Setup:**

1. **Enable Copilot Agents** (requires Copilot subscription):
   ```bash
   # In your GitHub account settings
   # Settings > Copilot > Enable "Copilot Agents (Beta)"
   ```

2. **Install Copilot CLI:**
   ```bash
   gh extension install github/gh-copilot
   ```

3. **Configure agent tasks:**
   ```yaml
   # .github/copilot-agents.yml
   agents:
     - name: test-generator
       trigger: "/generate-tests"
       description: "Generate unit tests for modified files"
       command: |
         gh copilot suggest "Generate comprehensive unit tests for these files"

     - name: doc-updater
       trigger: "/update-docs"
       description: "Update documentation based on code changes"
       command: |
         gh copilot suggest "Update documentation to reflect these changes"
   ```

4. **Add to Cursor rules:**
   ```markdown
   # .cursor/rules/copilot-agents.mdc
   ---
   description: Copilot Agents integration
   ---

   # When to Use Copilot Agents vs Cursor

   **Use Cursor for:**
   - Active feature development
   - Complex reasoning and planning
   - Code generation with Plan-Then-Act

   **Use Copilot Agents for:**
   - Mass test generation
   - Documentation updates across many files
   - Automated refactoring tasks
   - Batch operations
   ```

**Cost:** Included with GitHub Copilot ($10/month or $100/year)

---

### 📋 3. TODO→Issue Automation

**What it does:**
- Scans codebase for `// TODO:` comments
- Auto-creates GitHub Issues
- Links issues to code locations
- Updates issues when TODOs are resolved

**When to add:**
- ✅ Your codebase has consistent TODO format
- ✅ You want automated issue tracking
- ✅ You've cleaned up legacy TODOs
- ✅ TASK.md workflow is well-established

**Setup:**

1. **Install TODO to Issue Action:**
   ```yaml
   # .github/workflows/todo-issue.yml
   name: TODO to Issue

   on:
     push:
       branches:
         - main
     pull_request:

   jobs:
     todo:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v4

         - name: TODO to Issue
           uses: alstr/todo-to-issue-action@v4
           with:
             AUTO_P: true
             CLOSE_ISSUES: true
             AUTO_ASSIGN: true
   ```

2. **Format TODOs correctly:**
   ```javascript
   // TODO(username): Description of task
   // TODO: Simple description
   // FIXME: Bug that needs fixing
   // HACK: Temporary workaround
   ```

3. **Add ignore patterns:**
   ```yaml
   # In workflow file, add:
   with:
     EXCLUDE: "node_modules,dist,build,.next"
   ```

4. **Update Cursor rules:**
   ```markdown
   # .cursor/rules/todo-standards.mdc
   ---
   description: TODO comment standards
   ---

   # TODO Format
   When adding TODOs to code:

   - Use format: `// TODO(username): Description`
   - Be specific about what needs to be done
   - Link to relevant issues/PRs if applicable
   - Remove TODO when task is complete (closes issue automatically)

   **DO NOT** use TODOs for:
   - Long-term architectural decisions (use PLANNING.md)
   - Current sprint tasks (use TASK.md)
   - Quick reminders (use comments)
   ```

**Cost:** Free (GitHub Actions included)

---

### 🔄 4. Renovate (Dependency Updates)

**What it does:**
- Auto-creates PRs for dependency updates
- Groups related updates together
- Schedules updates (daily/weekly/monthly)
- Auto-merges minor/patch updates (optional)

**When to add:**
- ✅ You have production apps with security concerns
- ✅ You have robust CI/CD to catch breaking changes
- ✅ You're comfortable reviewing dependency PRs
- ✅ You want automated security patching

**Setup:**

1. **Install Renovate GitHub App:**
   ```bash
   # Visit: https://github.com/apps/renovate
   # Click "Install" and select repositories
   ```

2. **Configure Renovate:**
   ```json
   // renovate.json
   {
     "$schema": "https://docs.renovatebot.com/renovate-schema.json",
     "extends": [
       "config:base"
     ],
     "schedule": [
       "before 5am on Monday"
     ],
     "packageRules": [
       {
         "matchUpdateTypes": ["minor", "patch"],
         "matchCurrentVersion": "!/^0/",
         "automerge": true,
         "automergeType": "pr",
         "automergeStrategy": "squash"
       },
       {
         "groupName": "all non-major dependencies",
         "matchUpdateTypes": ["patch", "minor"],
         "groupSlug": "all-minor-patch"
       }
     ],
     "vulnerabilityAlerts": {
       "enabled": true,
       "schedule": ["at any time"]
     }
   }
   ```

3. **Configure grouping (reduce PR noise):**
   ```json
   {
     "packageRules": [
       {
         "groupName": "React ecosystem",
         "matchPackagePatterns": ["^react", "^@types/react"]
       },
       {
         "groupName": "Testing libraries",
         "matchPackagePatterns": ["jest", "testing-library", "vitest"]
       }
     ]
   }
   ```

4. **Add to Cursor rules:**
   ```markdown
   # .cursor/rules/renovate-workflow.mdc
   ---
   description: Renovate dependency update workflow
   ---

   # Handling Renovate PRs

   When Renovate creates update PRs:

   1. **Check CI status** - Must be green before review
   2. **Review changelog** - Look for breaking changes
   3. **Test locally** if major version update
   4. **Approve & merge** if tests pass

   **Auto-merge criteria:**
   - Patch updates (1.2.3 → 1.2.4) ✅
   - Minor updates (1.2.0 → 1.3.0) ✅ (if not v0.x)
   - Major updates (1.x → 2.x) ❌ (always manual review)
   ```

**Cost:** Free (GitHub App)

---

## Upgrade Decision Framework

### Step 1: Assess Your Needs

| Tool | Priority | Effort | Impact |
|------|----------|--------|--------|
| **PR-Agent** | Medium | Low | High code quality |
| **Copilot Agents** | Low | Medium | High automation |
| **TODO→Issue** | Low | Low | Medium tracking |
| **Renovate** | High | Medium | High security |

### Step 2: Recommended Order

**Phase 1 (Week 1-2):** Get comfortable with Minimal Stack
- Master Plan-Then-Act workflow
- Establish micro-commit habit
- Build 2-3 features using the framework

**Phase 2 (Week 3-4):** Add PR-Agent
- Install PR-Agent for code review
- Learn to work with AI PR feedback
- Refine prompts based on PR-Agent suggestions

**Phase 3 (Month 2):** Add Renovate
- Install Renovate for security updates
- Configure grouping rules
- Establish dependency review workflow

**Phase 4 (Month 3+):** Optional Additions
- Add Copilot Agents if needed for mass automation
- Add TODO→Issue if codebase is clean

### Step 3: Success Metrics

Track these before/after each upgrade:

**Before adding tools:**
- Time spent on code review: ___ hours/week
- Security vulnerabilities: ___ open
- PRs needing description rewrites: ____%
- TODOs converted to issues manually: ___ per week

**After adding tools:**
- Measure same metrics
- Calculate time saved
- Assess quality improvements
- Decide if tool is worth keeping

---

## Quick Reference

### When You're Ready to Upgrade

**Add PR-Agent:**
```bash
# 1. Install GitHub App
# 2. Create .pr_agent.toml (see above)
# 3. Add .github/workflows/pr-agent.yml
# 4. Create first PR and test
```

**Add Copilot Agents:**
```bash
# 1. Enable in GitHub settings
# 2. Install CLI: gh extension install github/gh-copilot
# 3. Create .github/copilot-agents.yml
# 4. Add .cursor/rules/copilot-agents.mdc
```

**Add TODO→Issue:**
```bash
# 1. Clean up existing TODOs
# 2. Add .github/workflows/todo-issue.yml
# 3. Add .cursor/rules/todo-standards.mdc
# 4. Format TODOs correctly
```

**Add Renovate:**
```bash
# 1. Install GitHub App
# 2. Create renovate.json
# 3. Configure grouping and auto-merge
# 4. Add .cursor/rules/renovate-workflow.mdc
```

---

## Troubleshooting

### PR-Agent Issues

**Problem:** PR-Agent not responding
- Check GitHub App installation permissions
- Verify `.pr_agent.toml` syntax
- Ensure GITHUB_TOKEN has `pull-requests: write` permission

**Problem:** Too many suggestions
- Reduce `num_code_suggestions` in config
- Set `auto_improve = false` for manual control

### Copilot Agents Issues

**Problem:** Agents not triggering
- Verify Copilot subscription is active
- Check that agents are enabled in settings
- Ensure trigger comments are exact match

### TODO→Issue Issues

**Problem:** Creating duplicate issues
- Add `CLOSE_ISSUES: true` to workflow
- Use consistent TODO format
- Check exclude patterns

### Renovate Issues

**Problem:** Too many PRs
- Increase grouping (combine more updates)
- Change schedule to weekly instead of daily
- Enable auto-merge for minor/patch

**Problem:** Breaking changes
- Disable auto-merge for major updates
- Add stricter CI/CD checks
- Review changelogs before merging

---

## Rollback Plan

If a tool isn't working:

1. **Disable the GitHub App/Action**
2. **Remove workflow file** from `.github/workflows/`
3. **Remove config file** (`.pr_agent.toml`, `renovate.json`, etc.)
4. **Remove Cursor rules** for that tool
5. **Document why** in `AI_MEMORY.md`

**No harm done!** Minimal Stack still works perfectly.

---

## Summary: Should I Upgrade?

### ✅ Upgrade if:
- You're shipping production code
- You have >5 PRs per week
- Security is critical
- You want less manual work

### ❌ Don't upgrade if:
- Still learning vibecoding basics
- Working on personal projects
- Low PR volume
- Prefer manual control

**Remember:** Minimal Stack is complete and production-ready. Upgrade only when you feel friction, not because features exist.

---

**Next Steps:**
1. Master Minimal Stack for 2-4 weeks
2. Identify your biggest pain point
3. Add ONE tool from this guide
4. Measure impact before adding more
5. Iterate based on what works for you

Happy vibecoding! 🚀
