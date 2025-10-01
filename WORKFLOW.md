# Vibecoding Workflow Guide

## 🚀 Project Setup (One-Time)

### 1. Initialize Project Structure
```bash
# Create project directory
mkdir my-vibecoding-project
cd my-vibecoding-project

# Initialize git
git init

# Create core files
touch PLANNING.md TASK.md AI_MEMORY.md WORKFLOW.md

# Create .cursor directory
mkdir -p .cursor/rules
```

### 2. Set Up Core Files
- Copy `PLANNING.md` template and customize
- Copy `TASK.md` template and add first sprint
- Copy `AI_MEMORY.md` template
- Copy all `.cursor/rules/*.mdc` files

### 3. Configure IDE
- Install Cursor or Windsurf
- Configure `.cursorrules` or `.windsurfrules`
- Set up project-specific settings

## 📅 Daily Workflow

### Morning Routine
1. **Review Context**
   - Read `@TASK.md` for current sprint status
   - Check `@PLANNING.md` for project context
   - Review `@AI_MEMORY.md` for recent learnings

2. **Plan Your Day**
   - Pick the first unchecked task
   - Break it into micro-tasks (5-15 minutes each)
   - Set clear success criteria

### Micro-Task Execution Loop

#### Step 1: Plan First (CRITICAL)
```
Task: "Add email validation to signup form"

IMPLEMENTATION PLAN:
Files to modify:
- src/components/SignupForm.tsx (add validation logic)
- src/utils/validation.ts (add email validation function)
- src/types/forms.ts (add form data interface)

Approach:
1. Create TypeScript interface for form data
2. Add email validation function with regex
3. Update component to use validation
4. Add error display UI

Potential challenges:
- Form state management complexity
- Error message positioning

Testing:
- Unit test for validation function
- Component test for error states

DO NOT WRITE CODE YET. Wait for "Proceed" command.
```

#### Step 2: Get Approval
- Wait for explicit "Proceed" or "Plan approved"
- If plan needs changes, iterate until approved
- Only then begin implementation

#### Step 3: Implement
- Follow the approved plan exactly
- Make minimal, focused changes
- Test each change if possible

#### Step 4: Verify
- Check that code compiles/runs
- Verify the change meets requirements
- Update `@TASK.md`: change `- [ ]` to `- [x]`
- Announce completion: "✅ [Task name] completed"

#### Step 5: Commit
```bash
git add .
git commit -m "feat: add email validation to signup form"
```

### End of Day Routine
1. **Update Documentation**
   - Update `@PLANNING.md` with any architectural decisions
   - Log any quirks or learnings to `@AI_MEMORY.md`
   - Update `@TASK.md` with progress

2. **Clean Commit History**
   - Review commits for clarity
   - Push to remote repository
   - Tag significant milestones

## 🛑 Emergency Protocols

### When AI Struggles (>2 corrections)
1. **STOP immediately** - don't continue debugging
2. **Revert**: `git reset --hard HEAD~1` (back to last good commit)
3. **Analyze**: Why did the AI fail?
4. **Break task smaller** or clarify the prompt
5. **Retry** from known good state

### When Scope Creeps
1. **STOP** - acknowledge the scope violation
2. **List** all files that would be modified
3. **Ask** for explicit approval for each file
4. **Proceed** only with approved files

### When Requirements Unclear
1. **STOP** - don't guess or assume
2. **Ask** specific clarifying questions
3. **Wait** for clear requirements
4. **Then** proceed with implementation

## 📊 Success Metrics

### Track These KPIs
- **Successful AI generations on first try** (target: >70%)
- **Reverts needed per feature** (target: <2)
- **Lines of AI code kept vs deleted** (target: >80% kept)
- **Time to feature completion** (measure baseline, aim for 3-5x improvement)

### Red Flags (You're Doing It Wrong)
- More than 3 prompt iterations per micro-task
- Frequently reverting due to AI misunderstandings
- Spending more time fixing AI code than writing from scratch
- AI frequently touching wrong files
- Inconsistent code quality

### Green Flags (You're Nailing It)
- AI understands requirements on first try
- Commits are small and atomic
- Code quality consistently high
- Rare need for major refactoring
- Smooth handoff between you and AI

## 🔄 Continuous Improvement

### Weekly Review
1. **Analyze** success metrics
2. **Identify** patterns in AI failures
3. **Update** rules in `.cursor/rules/`
4. **Refine** workflow based on learnings

### Monthly Optimization
1. **Review** `@AI_MEMORY.md` for outdated entries
2. **Update** project templates
3. **Share** learnings with team
4. **Measure** productivity gains

## 🎯 Model Selection Strategy

### Complex Reasoning/Planning
- **Use**: GPT-4o, Claude Opus, Claude Sonnet 4.5
- **For**: Initial planning, architecture decisions, complex debugging

### Code Implementation
- **Use**: Claude 3.7 Sonnet, GPT-4o
- **For**: Generating code from approved plans, refactoring, test writing

### Quick Iterations
- **Use**: Claude 3.7 Sonnet
- **For**: Fast feedback loops, minor fixes

### Pro Tip
If one model fails, try the exact same prompt with a different model. Different training data can unlock solutions.

## 📚 Resources

### Essential Tools
- **Cursor** or **Windsurf** - primary IDE
- **Aider** (CLI) - terminal-based with auto Git commits
- **Cline** (VSCode extension) - transparent AI coding

### Rule Templates
- **cursor.directory** - searchable rule database
- **awesome-cursorrules** - 870+ curated rules
- **Conventional Commits** - consistent commit messages

### Communities
- r/cursor (Reddit)
- Cursor Discord
- X/Twitter #vibecoding #CursorAI

---

*Remember: Vibecoding mastery isn't about finding perfect prompts - it's about building systems that make AI a reliable, programmable co-developer.*
