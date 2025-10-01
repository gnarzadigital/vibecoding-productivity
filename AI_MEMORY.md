# AI Memory - Vibecoding Productivity Framework

## Project Context
This is a comprehensive framework for AI-native development that transforms how you build software with AI assistance. The framework provides structure, rules, and workflows that separate casual prompt engineers from 10x AI-native builders.

## Core Principles
- **Plan-Then-Act**: Never let AI generate code immediately; always present detailed plan first
- **Micro-Tasks**: Break everything into 5-15 minute chunks with atomic commits
- **Ruthless Revert**: Stop after 2-3 failed corrections and revert to last good commit
- **Self-Improving Rules**: Build feedback loop to update rules based on learnings

## Common Patterns

### File Organization
- Core files always at root: PLANNING.md, TASK.md, AI_MEMORY.md, WORKFLOW.md
- AI rules in .cursor/rules/ directory (modular approach)
- Documentation in docs/ with MkDocs structure
- Automation stack: lefthook, commitlint, prettier, changesets

### Task Execution Workflow
1. Read context files (PLANNING.md, TASK.md, AI_MEMORY.md)
2. Pick first unchecked task from TASK.md
3. Present detailed implementation plan
4. Wait for explicit approval ("Proceed" or "Plan approved")
5. Execute approved plan exactly
6. Test and commit successful changes
7. Mark task complete in TASK.md
8. Update AI_MEMORY.md with learnings

### Commit Strategy
- Use `npx czg` for interactive commits
- Make atomic commits after each micro-task
- Follow conventional commit format
- Use scope control to prevent touching wrong files

## Known Issues

### Git Hooks Not Working
- **Issue**: Lefthook hooks not executing
- **Solution**: Run `npx lefthook install` and check permissions
- **Date**: 2025-01-27
- **Prevention**: Include in bootstrap script

### Commitlint Errors
- **Issue**: Commit messages not following conventional format
- **Solution**: Always use `npx czg` for interactive commits
- **Date**: 2025-01-27
- **Prevention**: Enforce through git hooks

### MkDocs Build Failures
- **Issue**: Documentation build fails due to missing dependencies
- **Solution**: Install mkdocs-material: `pip install mkdocs-material`
- **Date**: 2025-01-27
- **Prevention**: Include in CI/CD setup

## Lessons Learned

### What Works Well
- Plan-Then-Act workflow eliminates 70% of wasted AI code
- Micro-tasks create instant rollback points
- AI Memory system builds institutional knowledge over time
- Modular rules allow customization for different tech stacks

### What to Avoid
- Letting AI generate code without planning
- Making large commits that are hard to debug
- Ignoring scope control (AI touching wrong files)
- Not updating AI_MEMORY.md with new learnings

### Best Practices
- Always start with context loading (PLANNING.md, TASK.md, AI_MEMORY.md)
- Break complex tasks into 5-15 minute micro-tasks
- Use strict scope control to prevent file creep
- Update AI_MEMORY.md after each session with new patterns

## Framework-Specific Patterns

### React/Next.js Projects
- Use Server Components by default
- Follow feature-based folder structure
- Implement proper TypeScript types
- Use proper error boundaries

### Vue.js Projects
- Use Composition API for new components
- Follow Vue 3 best practices
- Implement proper reactivity patterns
- Use TypeScript for type safety

### Python/FastAPI Projects
- Use Pydantic for data validation
- Implement proper async patterns
- Follow FastAPI best practices
- Use proper error handling

### Node.js/Express Projects
- Use TypeScript for type safety
- Implement proper middleware patterns
- Follow Express best practices
- Use proper error handling

## Security Considerations

### Environment Variables
- Never commit .env files
- Use .env.example for required variables
- Keep API keys in environment variables
- Review .gitignore for comprehensive coverage

### Repository Security
- Remove personal paths and usernames
- Use generic placeholders in examples
- Sanitize all configuration files
- Check for exposed secrets before public release

## Performance Optimizations

### Build Process
- Use proper caching in CI/CD
- Optimize bundle sizes
- Implement proper tree shaking
- Use CDN for static assets

### Development Workflow
- Use proper linting and formatting
- Implement proper testing strategies
- Use proper debugging tools
- Optimize for development experience

## Maintenance Rules

### When to Add Entries
- Discover a workaround for a framework issue
- Find a deployment quirk that caused problems
- Identify a performance bottleneck
- Solve a security concern
- Work around an API limitation

### Entry Format
```markdown
#### [Category] [Specific Issue]
- **Issue**: [Clear description of the problem]
- **Solution**: [Exact steps or code to fix it]
- **Date**: [YYYY-MM-DD]
- **See**: [Issue number, PR, or reference]
- **Impact**: [Optional: what this solved]
```

### Regular Updates
- Review monthly for outdated entries
- Update solutions if better ones are found
- Archive resolved issues
- Add new discoveries immediately
- Share learnings with team

---
*This file should be updated whenever you discover project-specific quirks, workarounds, or solutions that would help future development. It serves as the institutional knowledge base for AI-assisted development.*
