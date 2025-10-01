# Core Concepts

Understanding the fundamental principles that make the Vibecoding Productivity Framework effective.

## The Vibecoding Philosophy

Vibecoding isn't just about using AI to write code—it's about **programming the AI itself** to be a reliable co-developer. This requires a systematic approach to AI interaction that goes far beyond casual prompting.

## Core Principles

### 1. Plan-Then-Act (Non-Negotiable)

**The Problem**: AI generates code immediately, often missing requirements or creating scope creep.

**The Solution**: Force a two-phase workflow:

1. **Planning Phase**: AI presents detailed implementation plan
2. **Approval Phase**: Human reviews and approves plan
3. **Implementation Phase**: AI executes approved plan exactly

**Why This Works**:
- Eliminates 70% of wasted AI-generated code
- Ensures alignment before implementation
- Reduces debugging time
- Improves code quality

### 2. Micro-Tasks, Micro-Commits

**The Problem**: Large tasks lead to complex failures and difficult rollbacks.

**The Solution**: Break everything into 5-15 minute chunks:

- Each micro-task has a single, clear objective
- Commit after each successful micro-task
- Create instant rollback points
- Build momentum through small wins

**Benefits**:
- Easy to debug when things go wrong
- Clear progress tracking
- Atomic changes that can be reverted
- Reduced cognitive load

### 3. Ruthless Revert Policy

**The Problem**: Developers often try to fix AI mistakes, leading to deeper problems.

**The Solution**: Stop after 2-3 failed corrections:

1. **Stop immediately** when struggling
2. **Revert to last good commit**
3. **Analyze the failure**
4. **Break the task smaller**
5. **Retry with better context**

**When to Revert**:
- More than 3 prompt iterations per micro-task
- AI frequently touching wrong files
- Spending more time fixing than building
- Requirements becoming unclear

### 4. Self-Improving Rules

**The Problem**: Static rules become outdated and don't adapt to project needs.

**The Solution**: Build a feedback loop:

1. **Document corrections** in `AI_MEMORY.md`
2. **Update rules** based on learnings
3. **Test new patterns** systematically
4. **Refine over time**

**Rule Categories**:
- **Core rules**: Universal principles
- **Framework rules**: Tech-stack specific
- **Project rules**: Domain-specific patterns
- **Team rules**: Collaboration patterns

## The AI Memory System

### Purpose

`AI_MEMORY.md` serves as the project's institutional knowledge base, helping AI understand:

- Project-specific patterns and conventions
- Common pitfalls and workarounds
- Domain knowledge and business logic
- Technical decisions and rationale

### Structure

```markdown
# AI Memory - [Project Name]

## Project Context
- [High-level project description]
- [Key technologies and frameworks]
- [Business domain and requirements]

## Common Patterns
- [Frequently used code patterns]
- [API conventions]
- [Database schemas]

## Known Issues
- [Common problems and solutions]
- [Workarounds for framework limitations]
- [Performance considerations]

## Lessons Learned
- [What works well]
- [What to avoid]
- [Best practices discovered]
```

### Maintenance

- **Update after each session** with new learnings
- **Review weekly** for outdated information
- **Share with team** for collective knowledge
- **Version control** to track evolution

## Task Execution Workflow

### 1. Context Loading

Always start by reading:
1. `@PLANNING.md` - Project vision and architecture
2. `@TASK.md` - Current sprint and tasks
3. `@AI_MEMORY.md` - Project-specific learnings

### 2. Task Selection

- Pick the **first unchecked item** from `@TASK.md`
- Ensure the task is **specific and actionable**
- Break down complex tasks into micro-tasks

### 3. Planning Phase

Present a detailed plan including:
- **Files to modify** (be specific)
- **Implementation approach** (step-by-step)
- **Dependencies and imports** needed
- **Potential challenges** and solutions
- **Testing approach**

### 4. Approval Phase

Wait for explicit approval:
- **"Proceed"** or **"Plan approved"**
- **Do not start coding** without approval
- **Clarify any concerns** before proceeding

### 5. Implementation

Execute the approved plan:
- **Follow the plan exactly**
- **Make atomic changes**
- **Test each change**
- **Commit successful changes**

### 6. Completion

- **Mark task complete** in `@TASK.md`
- **Update `AI_MEMORY.md`** with learnings
- **Announce completion**
- **Wait for next instruction**

## Scope Control

### The Problem

AI often makes "helpful" changes to unrelated files, creating scope creep and unexpected side effects.

### The Solution

**Strict scope rules**:
- Only modify files directly related to the current task
- No unsolicited refactoring or cleanup
- No "while we're here" improvements
- If changing multiple files, list them and get approval

### Multi-File Change Protocol

When a task requires multiple files:

1. **List all files** that will be modified
2. **Explain why each file** is necessary
3. **Wait for explicit approval**
4. **Then implement**

## Quality Gates

### Code Standards

- **TypeScript strict mode** enabled
- **No 'any' types** allowed
- **Files must be <500 lines**
- **Feature-based folder structure**
- **Proper error handling** for all async operations

### Testing Requirements

- **Test each change** if possible
- **Unit tests** for new functions
- **Integration tests** for new features
- **Manual testing** for UI changes

### Documentation

- **Update `@TASK.md`** after completing tasks
- **Log quirks** to `@AI_MEMORY.md`
- **Add reasoning comments** for complex decisions
- **Follow conventional commit messages**

## Success Metrics

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

## Advanced Concepts

### Model Selection Strategy

Different AI models excel at different tasks:

- **Complex reasoning**: GPT-4o, Claude Opus
- **Code implementation**: Claude 3.7 Sonnet, GPT-4o
- **Quick iterations**: Claude 3.7 Sonnet
- **Creative problem solving**: GPT-4o

### Rule Hierarchy

1. **Core rules**: Universal principles (always apply)
2. **Framework rules**: Tech-stack specific (React, Vue, etc.)
3. **Project rules**: Domain-specific patterns
4. **Team rules**: Collaboration and workflow patterns

### Emergency Protocols

**If struggling after 2-3 corrections**:
1. **STOP immediately**
2. **Revert to last good commit**
3. **Break task into smaller pieces**
4. **Retry with better context**

**If uncertain about API/syntax**:
1. **STOP and ask for verification**
2. **Never guess or hallucinate**
3. **Use documentation or examples**
4. **Get confirmation before proceeding**

## Next Steps

Now that you understand the core concepts:

1. **Set up your first project** with the framework
2. **Practice the Plan-Then-Act workflow**
3. **Build your AI Memory system**
4. **Experiment with different rules**
5. **Measure your productivity gains**

Remember: Vibecoding mastery isn't about finding perfect prompts—it's about building systems that make AI a reliable, programmable co-developer.
