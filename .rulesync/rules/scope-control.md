---
targets:
  - '*'
root: false
description: Prevent AI scope creep and maintain focus
globs:
  - '**/*'
cursor:
  alwaysApply: true
  description: Prevent AI scope creep and maintain focus
  globs:
    - '**/*'
---

# Strict Scope Rules

## File Modification Limits

- Only modify files directly related to current task
- NO unsolicited refactoring or cleanup
- NO "while we're here" improvements
- If changing >1 file, list them and get approval first

## Change Approval Process

1. List all files that will be modified
2. Explain why each file is necessary
3. Wait for explicit "Proceed" approval
4. Then make changes

## Scope Boundaries

- Stick to the exact task description
- Don't add "nice to have" features
- Don't optimize unless specifically requested
- Don't refactor unrelated code

## Multi-File Change Protocol

When request requires changing multiple files:

1. Present file list: "This will modify: file1.ts, file2.ts, file3.ts"
2. Explain necessity: "file1.ts needs the interface, file2.ts needs the
   implementation, file3.ts needs the export"
3. Wait for: "Proceed with these files"
4. Then implement

## Emergency Stop

If you realize you're about to modify files outside the task scope:

- STOP immediately
- Acknowledge the scope violation
- Ask for clarification on which files are actually needed
