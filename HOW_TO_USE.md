# 📖 How to Use the Vibecoding Productivity Framework

This guide explains how to properly use your framework for maximum AI-assisted productivity.

---

## 🎯 For YOU (As Template Creator)

### Starting a New Project with Your Template

**Option 1: Use GitHub Template (Recommended)**
```bash
# 1. Go to your template repository
https://github.com/gnarzadigital/vibecoding-productivity

# 2. Click "Use this template" button (green button at top)

# 3. Create new repository with your project name
# Example: "my-awesome-app"

# 4. Clone your new repository
git clone https://github.com/gnarzadigital/my-awesome-app.git
cd my-awesome-app

# 5. Run one-command setup
npm run setup
```

**Option 2: Manual Clone & Modify**
```bash
# 1. Clone the template
git clone https://github.com/gnarzadigital/vibecoding-productivity.git my-new-project
cd my-new-project

# 2. Remove old git history and start fresh
rm -rf .git
git init
git branch -M main

# 3. Run setup
npm run setup

# 4. Update package.json with your project details
# - Change name, description, repository URLs

# 5. Make your first commit
git add .
npx czg
# Select: feat, scope: init, subject: initialize project from template
```

---

## 📋 The Vibecoding Workflow (Step-by-Step)

### Day 1: Project Initialization

**1. Configure Core Files** (15 minutes)

Edit `PLANNING.md`:
```markdown
# Project: My Awesome App

## Vision
A modern web app that helps users track their fitness goals

## Tech Stack
- Frontend: Next.js 14, React, TypeScript, Tailwind CSS
- Backend: Node.js, Express, PostgreSQL
- Deployment: Vercel (frontend), Railway (backend)

## Architecture
- Monorepo structure with Turborepo
- REST API + real-time websockets
- JWT authentication

## Key Features
1. User registration & authentication
2. Goal tracking dashboard
3. Progress analytics
4. Social sharing
```

Edit `TASK.md`:
```markdown
# Sprint 1: MVP Foundation

## 🎯 Sprint Goals
- [ ] Set up project structure and dependencies
- [ ] Implement user authentication
- [ ] Create basic dashboard UI

## 🔄 In Progress
- [ ] Set up Next.js project structure
  - [ ] Initialize Next.js with TypeScript
  - [ ] Configure Tailwind CSS
  - [ ] Set up folder structure (app/, components/, lib/)
  - [ ] Add ESLint and Prettier configs

## 📋 Backlog
- [ ] Design database schema
- [ ] Create API endpoints
- [ ] Build authentication flow
```

**2. Add Framework-Specific Rules** (5 minutes)

If building a React/Next.js app:
```bash
# Copy React rules to active rules
cp templates/react-rules.mdc .cursor/rules/

# Or for other frameworks:
cp templates/vue-rules.mdc .cursor/rules/      # For Vue
cp templates/python-rules.mdc .cursor/rules/   # For Python/FastAPI
cp templates/nodejs-rules.mdc .cursor/rules/   # For Node.js/Express
```

**3. Start AI_MEMORY.md** (5 minutes)

Document your first learning:
```markdown
# AI Memory - My Awesome App

## Project Context
Building a fitness tracking app with Next.js, focusing on real-time updates and social features.

## Tech Stack Decisions
- Using Next.js 14 with App Router (not Pages Router)
- PostgreSQL with Prisma ORM
- Tailwind CSS for styling

## Known Issues
(Will be populated as you discover issues)

## Lessons Learned
(Will grow as project progresses)
```

---

### Daily Development Workflow

#### Morning Routine (5 minutes)

**1. Load Context in Cursor/AI**
```
Open Cursor and read these files (in order):
1. @PLANNING.md
2. @TASK.md
3. @AI_MEMORY.md
```

This gives your AI full project context!

**2. Pick Your Task**
- Open `TASK.md`
- Find first unchecked `[ ]` item under "In Progress"
- This is what you work on today

---

#### The Plan-Then-Act Cycle (Core Workflow)

**Step 1: Ask AI to Plan (DON'T CODE YET!)**

In Cursor, type:
```
I want to implement [task from TASK.md]. 
Please create a detailed implementation plan following the Plan-Then-Act protocol.
```

**AI will respond with a plan like:**
```
IMPLEMENTATION PLAN for "Set up Next.js project structure":

Files to create/modify:
- package.json (add dependencies)
- next.config.js (configure Next.js)
- tailwind.config.js (set up Tailwind)
- app/layout.tsx (root layout)
- app/page.tsx (home page)
- tsconfig.json (TypeScript config)

Approach:
1. Initialize Next.js with TypeScript template
2. Install Tailwind CSS and configure
3. Set up folder structure: app/, components/, lib/, types/
4. Create root layout with metadata
5. Add global styles

Dependencies:
- next@14.1.0
- react@18.2.0
- tailwindcss@3.4.0
- typescript@5.3.0

Testing:
- npm run dev should start server
- Visit http://localhost:3000 to verify

DO NOT WRITE CODE YET. Wait for "Proceed" command.
```

**Step 2: Review the Plan**

Read the plan carefully. Ask yourself:
- Does this approach make sense?
- Are all necessary files included?
- Any missing dependencies?
- Any security concerns?

**Step 3: Approve or Adjust**

If plan looks good:
```
Proceed
```

If plan needs changes:
```
Revise the plan to use Turbopack instead of Webpack
```

**Step 4: AI Executes the Plan**

AI will now implement exactly what was planned. Watch for:
- File changes being made
- Dependencies being installed
- Code being written

**Step 5: Test & Commit**

```bash
# Test the changes
npm run dev  # or appropriate test command

# If it works, commit immediately
git add .
npx czg
# Type: feat
# Scope: setup
# Subject: configure Next.js with TypeScript and Tailwind

# If it fails, revert and break task smaller
git reset --hard HEAD
```

**Step 6: Update TASK.md**

Mark the task complete:
```markdown
- [x] Set up Next.js project structure
  - [x] Initialize Next.js with TypeScript
  - [x] Configure Tailwind CSS
  - [x] Set up folder structure
```

**Step 7: Update AI_MEMORY.md** (If you learned something)

```markdown
## Lessons Learned

### Next.js 14 App Router Setup
- **Issue**: Tailwind classes not applying
- **Solution**: Need to import globals.css in root layout.tsx
- **Date**: 2025-10-01
- **Prevention**: Always check layout.tsx for CSS imports
```

---

#### Micro-Task Strategy (CRITICAL!)

**Break Everything into 5-15 Minute Chunks**

❌ **Bad Task** (too big):
```
- [ ] Build user authentication
```

✅ **Good Tasks** (micro-sized):
```
- [ ] Create User model in Prisma schema
- [ ] Add password hashing utility function
- [ ] Create /api/auth/register endpoint
- [ ] Add form validation for registration
- [ ] Create registration UI component
- [ ] Add error handling for auth endpoints
- [ ] Write tests for auth flow
```

**Why Micro-Tasks Work:**
- Each task = 1 commit
- Easy to debug when things fail
- Clear progress tracking
- Can revert any single piece

---

#### The Ruthless Revert Policy (When Things Go Wrong)

**If AI struggles after 2-3 attempts:**

```bash
# STOP! Don't keep trying
git status  # See what changed

# Revert everything
git reset --hard HEAD

# Now break the task smaller
# Example: Instead of "Create auth system"
# Try: "Just create the User model in Prisma"
```

**Signs You Need to Revert:**
- More than 3 AI corrections on same task
- AI touching files it shouldn't
- You're confused about what AI is doing
- Tests keep failing

---

### End of Day Routine (5 minutes)

**1. Update TASK.md Progress**
```markdown
## ✅ Completed Today
- [x] Set up Next.js project structure
- [x] Configure Tailwind CSS
- [x] Create folder structure

## 🔄 In Progress (for tomorrow)
- [ ] Create User model in database
  - [ ] Define Prisma schema
  - [ ] Run migrations
```

**2. Document Any Learnings in AI_MEMORY.md**
```markdown
## Lessons Learned

### Prisma with PostgreSQL
- **Issue**: Migration failed due to PostgreSQL connection
- **Solution**: Need to set DATABASE_URL in .env
- **Date**: 2025-10-01
```

**3. Commit Any Uncommitted Work**
```bash
git status
git add .
npx czg
```

---

## 🎯 For OTHERS (Using Your Template)

When someone else uses your template:

### Their Onboarding Flow

**1. Use Template Button**
- Click "Use this template" on your GitHub repo
- Create their own repository
- Clone it locally

**2. One-Command Setup**
```bash
git clone https://github.com/theirusername/their-project.git
cd their-project
npm run setup
```

**3. Customize for Their Project**
- Edit `PLANNING.md` with their project vision
- Update `TASK.md` with their first tasks
- Start using the workflow!

### What They Get Automatically

✅ **Git Hooks** (automatic):
- Pre-commit: Code formatting
- Commit-msg: Conventional commit enforcement
- Pre-push: Tests and build checks

✅ **Interactive Commits**:
```bash
npx czg
# Guided commit message creation
```

✅ **AI Rules** (in Cursor):
- Plan-Then-Act enforcement
- Scope control (prevents file creep)
- Micro-task reminders
- Error handling standards

✅ **Documentation Site**:
- Push to main → Docs auto-deploy
- MkDocs site on GitHub Pages

---

## 🔧 Advanced Usage

### Spec Kit Integration (Optional)

If you want spec-driven development:

```bash
# Initialize Spec Kit
npx specify init . --ai cursor

# Create spec before coding
specify plan user-authentication

# AI reads spec from specs/user-authentication.md
# Then implements according to spec

# Update spec after changes
specify update
```

### Working with the Upgrade Guide

When you need more automation:

```bash
# Read the upgrade guide
cat docs/reference/UPGRADE_GUIDE.md

# Example: Add PR-Agent for AI code reviews
# Follow steps in UPGRADE_GUIDE.md Phase 1
```

### Team Collaboration

**For team projects:**

1. **Share the template** with team
2. **Everyone clones** the same repository
3. **Use PR workflow**:
   ```bash
   # Create feature branch
   git checkout -b feature/user-dashboard
   
   # Make changes following Plan-Then-Act
   # Commit with npx czg
   
   # Push and create PR
   git push -u origin feature/user-dashboard
   gh pr create
   ```

4. **Keep AI_MEMORY.md updated** (team knowledge)
5. **Review PRs** using GitHub (or PR-Agent if enabled)

---

## 📊 Measuring Success

### Track These Metrics

**Weekly Review:**
- ✅ How many tasks completed?
- ✅ How many reverts needed?
- ✅ Percentage of first-try AI successes
- ✅ Time saved vs traditional coding

**Good Indicators:**
- Most AI generations work first try (>70%)
- Fewer than 2 reverts per feature
- Commits are small and atomic
- Tasks completed faster than before

**Warning Signs:**
- Frequent reverts (>3 per day)
- AI touching wrong files often
- More time fixing than building
- Confused about project state

---

## 🎓 Learning Curve

### Week 1: Getting Comfortable
- Focus on Plan-Then-Act discipline
- Practice micro-task breakdown
- Get used to npx czg commits
- Start building AI_MEMORY.md

### Week 2: Building Momentum
- AI understands your project better
- Faster plan → execute cycles
- Fewer reverts needed
- Cleaner commits

### Week 3-4: Peak Productivity
- 3-5x faster than traditional coding
- AI rarely needs corrections
- Rich AI_MEMORY.md helps immensely
- Smooth workflow becomes second nature

---

## 🚨 Common Mistakes to Avoid

❌ **Don't skip the planning phase**
- Always get a plan before coding

❌ **Don't make tasks too big**
- Break into 5-15 minute chunks

❌ **Don't ignore AI_MEMORY.md**
- Document learnings immediately

❌ **Don't keep trying after 3 failures**
- Revert and break task smaller

❌ **Don't let AI touch multiple files without approval**
- Use scope control rules

❌ **Don't commit without testing**
- Always verify changes work

---

## 🎯 Quick Reference Commands

```bash
# Start new project from template
npx create-vibecode my-project  # (future convenience - not yet available)
# OR use GitHub "Use this template" button

# Daily workflow
npm run setup              # First time only
npx czg                   # Make commits
npm run format            # Format code
npm run docs:serve        # Preview docs locally

# Spec Kit (optional)
specify plan <feature>    # Plan feature
specify update           # Update specs

# GitHub
gh pr create             # Create pull request
gh repo view --web       # Open repo in browser

# Releases
npx changeset            # Add changeset
npm run release:version  # Version packages
```

---

## 💡 Pro Tips

1. **Read context files EVERY morning** (@PLANNING.md, @TASK.md, @AI_MEMORY.md)
2. **Update AI_MEMORY.md immediately** when you discover something
3. **Commit after every successful micro-task** (not at end of day)
4. **Use git log to see your progress** (motivating!)
5. **Share your AI_MEMORY.md** with teammates
6. **Review and refine rules weekly** based on what works

---

## 🔥 Power User Workflow

Once you master the basics:

```bash
# Morning: Load context
cat PLANNING.md TASK.md AI_MEMORY.md

# Pick task → Ask for plan → Approve → Execute → Test → Commit
# Repeat 5-8 times per day

# Evening: Update docs, commit, plan tomorrow

# Weekly: Review metrics, update rules, celebrate wins!
```

---

## 🎉 You're Ready!

You now have everything you need to:
- Start new projects 10x faster
- Work with AI as a reliable co-developer  
- Build production-quality code consistently
- Never lose context or momentum

**The vibecoding era has arrived. Now go build something amazing!** 🚀

---

## 📚 Additional Resources

- [Framework Summary](docs/reference/FRAMEWORK_SUMMARY.md) - Deep dive into all features
- [Upgrade Guide](docs/reference/UPGRADE_GUIDE.md) - Add advanced automation
- [Vibecoding Secrets](docs/reference/vibecoding-secrets.md) - Advanced techniques
- [GitHub Setup](GITHUB_SETUP_STEPS.md) - Repository configuration

