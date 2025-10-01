# Contributing to Vibecoding Productivity Framework

Thank you for your interest in contributing! This document provides guidelines for contributing to this project.

## Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md).

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in [Issues](https://github.com/yourusername/vibecoding-productivity/issues)
2. If not, create a new issue using the **Bug Report** template
3. Provide as much detail as possible:
   - Steps to reproduce
   - Expected vs actual behavior
   - Your environment (OS, Node version, etc.)
   - Screenshots if applicable

### Suggesting Features

1. Check if the feature has already been suggested
2. Create a new issue using the **Feature Request** template
3. Explain:
   - The problem this feature solves
   - How it aligns with vibecoding principles
   - Potential implementation approach

### Contributing Code

#### Getting Started

1. **Fork the repository**
   ```bash
   git clone https://github.com/yourusername/vibecoding-productivity.git
   cd vibecoding-productivity
   ```

2. **Install dependencies**
   ```bash
   npm run setup
   ```

3. **Create a feature branch**
   ```bash
   git checkout -b feat/your-feature-name
   ```

#### Making Changes

1. **Follow the vibecoding workflow**:
   - Update `TASK.md` with your work items
   - Use Plan-Then-Act for significant changes
   - Make micro-commits with clear messages

2. **Code standards**:
   - Follow existing code style
   - Use TypeScript strict mode (if applicable)
   - Add tests for new features
   - Update documentation

3. **Commit messages**:
   ```bash
   # Use interactive commits
   npx czg

   # Follow Conventional Commits format
   # Examples:
   feat(rules): add new cursor rule for error handling
   fix(docs): correct broken links in README
   docs: update contributing guidelines
   ```

#### Submitting Changes

1. **Test your changes**
   ```bash
   npm run lint        # Check code style
   npm run test        # Run tests (if applicable)
   mkdocs build        # Verify docs build
   ```

2. **Push to your fork**
   ```bash
   git push origin feat/your-feature-name
   ```

3. **Create a Pull Request**
   - Use the PR template
   - Link related issues
   - Describe changes clearly
   - Add screenshots if UI changes

## Development Guidelines

### Project Structure

See [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md) for detailed structure information.

### Adding New Cursor Rules

1. Create rule in `.cursor/rules/your-rule.mdc`
2. Use frontmatter:
   ```markdown
   ---
   description: Brief description
   alwaysApply: true
   ---

   # Your Rule Content
   ```
3. Test the rule with actual Cursor usage
4. Document in `docs/framework/rules.md`

### Adding Documentation

1. Place docs in appropriate `docs/` subdirectory
2. Update `mkdocs.yml` navigation
3. Follow existing formatting style
4. Test with `mkdocs serve`

### Updating Automation

1. **Git hooks** (`lefthook.yml`):
   - Keep hooks fast (<5 seconds)
   - Only run on relevant files
   - Document in `docs/automation/git-hooks.md`

2. **GitHub Actions** (`.github/workflows/`):
   - Test workflows in your fork first
   - Keep jobs focused and parallel
   - Add comments explaining complex steps

## Review Process

1. **Automated checks must pass**:
   - Commit message format
   - Code formatting (Prettier)
   - Documentation build

2. **Maintainer review**:
   - Code quality and style
   - Documentation completeness
   - Alignment with project goals

3. **Merging**:
   - Squash commits for clean history
   - Update CHANGELOG.md (via Changesets)

## Release Process

This project uses [Changesets](https://github.com/changesets/changesets) for versioning:

1. **Add changeset** when contributing:
   ```bash
   npx changeset
   ```

2. **Select change type**:
   - `major` - Breaking changes
   - `minor` - New features
   - `patch` - Bug fixes

3. **Describe changes** for changelog

Maintainers will handle the actual release process.

## Community

- **Questions?** Open a [Discussion](https://github.com/yourusername/vibecoding-productivity/discussions)
- **Chat:** Join our [Discord](https://discord.gg/your-invite) (if applicable)
- **Twitter:** Follow [@yourusername](https://twitter.com/yourusername)

## Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Project documentation

Thank you for helping make vibecoding better for everyone! 🚀
