---
targets:
  - '*'
root: false
description: Automation stack integration for vibecoding
globs:
  - '**/*'
cursor:
  alwaysApply: true
  description: Automation stack integration for vibecoding
  globs:
    - '**/*'
---

# Automation Stack Integration

## Bootstrap Protocol

When starting a new project:

1. Run `npm run setup` to install all automation tools
2. Run `lefthook install` to activate Git hooks
3. Run `npx changeset init` to initialize versioning
4. Optionally run `specify init . --ai cursor` for Spec Kit

## Git Hooks (Lefthook)

- **Pre-commit**: Runs lint-staged and commitlint automatically
- **Pre-push**: Runs tests and build checks
- **Commit-msg**: Validates commit message format

## Commit Workflow

- Use `npx czg` for interactive commit messages
- Follow Conventional Commits format
- Commits are automatically linted and formatted

## Release Workflow

- Use `npx changeset` to add changesets
- Run `npm run release:version` to version packages
- Run `npm run release` to publish
- GitHub Actions handle automated releases

## Documentation

- MkDocs builds automatically on push to main
- Documentation is deployed to GitHub Pages
- Keep docs in sync with code changes

## TODO Management

- TODOs in code are automatically converted to GitHub Issues
- Use `TODO: description` format in comments
- Issues are labeled as 'todo' and 'automated'

## Quality Gates

- All staged files are linted and formatted
- Commit messages must follow conventional format
- Tests and builds must pass before push
- Documentation must build successfully

## Troubleshooting

- If hooks fail: Check lefthook installation with `lefthook install`
- If commitlint fails: Use `npx czg` for proper format
- If changesets fail: Run `npx changeset init` first
- If docs fail: Check mkdocs.yml configuration
