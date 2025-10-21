---
targets:
  - '*'
root: false
description: Spec Kit integration and bootstrap enforcement
globs:
  - '**/*'
cursor:
  alwaysApply: true
  description: Spec Kit integration and bootstrap enforcement
  globs:
    - '**/*'
---

# Spec Kit Integration & Setup Enforcement

## First-Time Setup Protocol

When this project is cloned for the first time:

1. **Remind user to run setup**:

   ```bash
   npm run setup
   # or
   ./scripts/bootstrap.sh
   ```

2. **Optional Spec Kit initialization**:
   ```bash
   npx specify init . --ai cursor
   ```

## Spec Kit Commands (Optional)

If user has initialized Spec Kit, these commands are available:

- `specify plan <feature>` - Create spec before coding
- `specify update` - Update spec after changes
- `specify validate` - Check implementation matches spec

## Integration with Plan-Then-Act

**Spec Kit complements Plan-Then-Act workflow**:

### Without Spec Kit (standard)

1. User requests feature
2. AI presents detailed plan (no code)
3. User approves with "Proceed"
4. AI implements

### With Spec Kit (enhanced)

1. User runs: `specify plan <feature>`
2. Spec Kit generates spec file in `specs/`
3. AI reads spec and presents implementation plan
4. User approves with "Proceed"
5. AI implements according to spec
6. AI updates spec with `specify update` if needed

## Onboarding Checklist

When opening this project, ensure:

- [ ] Dependencies installed (`npm install` or `npm run setup`)
- [ ] Git hooks active (lefthook installed)
- [ ] @PLANNING.md and @TASK.md reviewed
- [ ] Spec Kit initialized (optional, if using spec-driven workflow)

## Rule Hierarchy

1. **Always read context first**: @PLANNING.md, @TASK.md, @AI_MEMORY.md
2. **Always plan before coding**: Present plan, wait for approval
3. **Use specs if available**: Check `specs/` directory for feature specs
4. **Follow automation**: Respect git hooks, use `npx czg` for commits
5. **Update docs**: Keep PLANNING.md, TASK.md, AI_MEMORY.md current

## Bootstrap Reminder

**If user mentions setup issues, remind them**:

```bash
npm run setup    # Full bootstrap
npx czg          # Interactive commits
npm run release  # Publish changesets
```

## Spec Kit Best Practices (if enabled)

- **Before feature**: `specify plan feature-name` → review spec → start coding
- **During feature**: Reference spec in `@specs/feature-name.md`
- **After feature**: `specify update` to sync spec with implementation
- **Complex features**: Break into multiple specs (micro-task approach)

## Integration with Existing Rules

This rule works alongside:

- `planning-first.mdc` - Plan-Then-Act enforcement
- `task-execution.mdc` - Sequential task workflow
- `scope-control.mdc` - Prevent scope creep
- `automation.mdc` - Git hooks and automation

**Priority order**: Context loading → Planning → Spec (if available) →
Implementation
