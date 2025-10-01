# Daily Workflow

Your step-by-step guide to productive AI-native development using the Vibecoding framework.

## Morning Routine (5 minutes)

### 1. Context Loading

Start each session by reading these files in order:

```bash
# Read project context
cat PLANNING.md
cat TASK.md  
cat AI_MEMORY.md
```

**Why this matters**: AI needs full context to make good decisions. These files provide:
- **Project vision** and architecture
- **Current sprint** goals and progress
- **Project-specific learnings** and patterns

### 2. Task Selection

Pick the **first unchecked item** from `@TASK.md`:

```markdown
## 🔄 In Progress
- [ ] [Current task - be specific]
  - [ ] [Sub-task 1]
  - [ ] [Sub-task 2]
```

**Rules**:
- Only work on **one task at a time**
- Ensure task is **specific and actionable**
- Break complex tasks into **micro-tasks** (5-15 minutes each)

## The Plan-Then-Act Cycle

### Phase 1: Planning (2-5 minutes)

**Present a detailed implementation plan**:

```
IMPLEMENTATION PLAN for [Task Name]:

Files to modify:
- src/components/UserForm.tsx (add validation)
- src/types/User.ts (add interface)
- src/utils/validation.ts (add function)

Approach:
1. Create TypeScript interface for form data
2. Add validation function with proper error handling
3. Update component to use validation
4. Add error display UI

Potential challenges:
- Form state management complexity
- Error message positioning

Testing:
- Unit tests for validation function
- Component test for error states

DO NOT WRITE CODE YET. Wait for "Proceed" command.
```

**Plan Requirements**:
- **List all files** that will be modified
- **Explain the approach** step-by-step
- **Identify potential challenges**
- **Include testing strategy**
- **Wait for explicit approval**

### Phase 2: Approval (Human Decision)

**Wait for one of these responses**:
- ✅ **"Proceed"** - Execute the plan
- ✅ **"Plan approved"** - Execute the plan
- ❌ **"Revise plan"** - Make requested changes
- ❌ **"Different approach"** - Try alternative solution

**Never start coding without approval!**

### Phase 3: Implementation (5-15 minutes)

Execute the approved plan **exactly**:

1. **Follow the plan step-by-step**
2. **Make atomic changes**
3. **Test each change**
4. **Commit successful changes**

**Implementation Rules**:
- Stick to the approved plan
- Don't add "nice to have" features
- Don't optimize unless requested
- Don't refactor unrelated code

### Phase 4: Completion

**Mark task complete**:
```markdown
- [x] [Completed task]
```

**Update AI_MEMORY.md** with any new learnings:
```markdown
## Lessons Learned
- [New pattern discovered]
- [Workaround for issue X]
- [Best practice for Y]
```

**Announce completion**:
```
✅ Task completed: [Task name]
📝 Updated AI_MEMORY.md with learnings
🎯 Ready for next task
```

## Micro-Task Breakdown

### What Makes a Good Micro-Task?

**Good Examples**:
- "Add email validation to UserForm component"
- "Create User interface in types/User.ts"
- "Add error handling to API call in services/auth.ts"

**Bad Examples**:
- "Fix the user system" (too broad)
- "Refactor everything" (no clear scope)
- "Make it better" (no specific outcome)

### Breaking Down Complex Tasks

**Example: "Implement user authentication"**

Break into micro-tasks:
1. Create User interface and types
2. Add validation functions
3. Create login form component
4. Implement API service
5. Add error handling
6. Create success/error states
7. Add tests

## Commit Strategy

### Micro-Commit Pattern

**Commit after each successful micro-task**:

```bash
# After completing "Add email validation"
git add src/utils/validation.ts
git commit -m "feat: add email validation utility"

# After completing "Update UserForm component"  
git add src/components/UserForm.tsx
git commit -m "feat: integrate email validation in UserForm"
```

**Benefits**:
- **Instant rollback points**
- **Clear progress tracking**
- **Atomic changes**
- **Easy debugging**

### Commit Message Format

Use conventional commits:

```bash
npx czg  # Interactive commit tool
```

**Types**:
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation
- `style:` - Code formatting
- `refactor:` - Code refactoring
- `test:` - Adding tests
- `chore:` - Maintenance tasks

## Quality Gates

### Before Each Commit

**Checklist**:
- [ ] Code follows project standards
- [ ] No TypeScript errors
- [ ] No console.log statements
- [ ] Proper error handling
- [ ] Tests pass (if applicable)

### Testing Strategy

**For each micro-task**:
1. **Manual testing** - Does it work as expected?
2. **Unit tests** - For utility functions
3. **Integration tests** - For component changes
4. **Regression testing** - Does existing functionality still work?

## Troubleshooting

### When Things Go Wrong

**Stop after 2-3 failed corrections**:

1. **STOP immediately**
2. **Revert to last good commit**
3. **Analyze the failure**
4. **Break task smaller**
5. **Retry with better context**

### Common Failure Patterns

**AI touching wrong files**:
- Add more specific file paths to plan
- Use more detailed scope control rules
- Break task into smaller pieces

**AI misunderstanding requirements**:
- Provide more context in plan
- Add examples to requirements
- Use more specific language

**AI generating too much code**:
- Break task into smaller pieces
- Be more specific about what to change
- Use scope control rules

### Emergency Protocols

**If completely stuck**:
1. **Revert to last good commit**
2. **Take a break**
3. **Review the task requirements**
4. **Break into even smaller pieces**
5. **Ask for help or clarification**

## End of Day Routine

### 1. Update Progress

**Mark completed tasks**:
```markdown
## ✅ Completed
- [x] [Task 1]
- [x] [Task 2]
```

**Update current progress**:
```markdown
## 🔄 In Progress
- [ ] [Next task]
```

### 2. Update AI Memory

**Document learnings**:
```markdown
## Lessons Learned
- [Pattern that worked well]
- [Issue and how it was resolved]
- [Best practice discovered]
```

### 3. Plan Tomorrow

**Set up next day's tasks**:
```markdown
## 🎯 Next Actions
1. [First task for tomorrow]
2. [Second task for tomorrow]
3. [Third task for tomorrow]
```

## Weekly Review

### Every Friday

**Review the week**:
- What worked well?
- What didn't work?
- What patterns emerged?
- What rules need updating?

**Update rules**:
- Add new patterns to `.cursor/rules/`
- Update `AI_MEMORY.md` with learnings
- Refine workflow based on experience

**Plan next week**:
- Set sprint goals
- Break down large tasks
- Identify potential challenges

## Success Metrics

### Track These KPIs

- **Tasks completed per day**
- **Successful first-try generations**
- **Reverts needed per feature**
- **Time to feature completion**
- **Code quality metrics**

### Red Flags

- More than 3 prompt iterations per micro-task
- Frequently reverting due to AI misunderstandings
- Spending more time fixing AI code than writing from scratch
- AI frequently touching wrong files

### Green Flags

- AI understands requirements on first try
- Commits are small and atomic
- Code quality consistently high
- Rare need for major refactoring

## Advanced Workflows

### Spec-Driven Development

**With Spec Kit enabled**:
1. `specify plan <feature>` - Generate specification
2. Review and approve spec
3. Implement according to spec
4. `specify update` - Sync spec with implementation

### Team Collaboration

**For team projects**:
- Share `AI_MEMORY.md` with team
- Use consistent rule sets
- Document team-specific patterns
- Regular rule review sessions

### Multi-Project Management

**For multiple projects**:
- Maintain separate `AI_MEMORY.md` files
- Use project-specific rule sets
- Track patterns across projects
- Build personal rule library

## Next Steps

Now that you understand the daily workflow:

1. **Start with a simple task** to practice the cycle
2. **Build your AI Memory** with project learnings
3. **Experiment with different rules** to find what works
4. **Measure your productivity gains** over time
5. **Share your learnings** with the community

Remember: The goal isn't to be perfect from day one—it's to build a system that gets better over time through consistent practice and learning.
