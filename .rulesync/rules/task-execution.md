---
targets:
  - '*'
root: false
description: Task workflow and execution protocol
globs: []
cursor:
  description: Task workflow and execution protocol
---

# Task Execution Protocol

## Pre-Task Checklist

1. Read @TASK.md to understand current context
2. Identify the FIRST unchecked item only
3. Break it into micro-tasks if needed
4. Confirm scope and requirements

## Execution Flow

1. **PLAN FIRST**: Present detailed step-by-step plan

   - List all files to be modified
   - Explain approach and rationale
   - Identify potential challenges
   - DO NOT WRITE CODE YET
   - Wait for "Proceed" command

2. **EXECUTE**: After approval, implement the plan

   - Follow the approved approach exactly
   - Make minimal, focused changes
   - Test each change if possible

3. **VERIFY**: After implementation
   - Check that code compiles/runs
   - Verify the change meets requirements
   - Update @TASK.md: change `- [ ]` to `- [x]`
   - Announce completion

## Micro-Task Guidelines

- Each micro-task should be completable in 5-15 minutes
- One logical unit of work per micro-task
- Clear success criteria
- Minimal file changes

## Quality Checks

- Code must compile without errors
- TypeScript types must be correct
- No console.log statements
- Proper error handling
- Follow project conventions

## Completion Protocol

After completing a task:

1. Mark as complete in @TASK.md
2. Announce: "✅ [Task name] completed"
3. Wait for next instruction
4. Do NOT start the next task automatically
