# Repository Setup Instructions

Complete guide to configuring your GitHub repository for the Vibecoding Productivity Framework.

## Repository Configuration

### 1. Repository Settings

**Go to Settings → General:**

- **Repository name**: `vibecoding-productivity`
- **Description**: "AI-native development framework for productive coding with Cursor and AI assistants"
- **Website**: `https://yourusername.github.io/vibecoding-productivity`
- **Topics**: Add these tags:
  - `vibecoding`
  - `ai-development`
  - `cursor`
  - `productivity`
  - `automation`
  - `framework`
  - `template`
  - `typescript`
  - `nodejs`

### 2. Template Repository

**Enable template repository:**
1. Go to **Settings** → **General**
2. Check **Template repository**
3. This allows others to use "Use this template" button

### 3. GitHub Pages

**Configure GitHub Pages:**
1. Go to **Settings** → **Pages**
2. Source: **GitHub Actions**
3. This will automatically deploy documentation

### 4. Branch Protection

**Protect main branch:**
1. Go to **Settings** → **Branches**
2. Add rule for `main` branch:
   - Require pull request reviews
   - Require status checks to pass
   - Require branches to be up to date

## GitHub Actions Setup

### 1. Required Secrets

**Add these secrets in Settings → Secrets and variables → Actions:**

- `GITHUB_TOKEN` (automatically provided)
- `NPM_TOKEN` (for publishing packages, if applicable)
- `OPENAI_API_KEY` (for AI features, optional)

### 2. Workflow Permissions

**Go to Settings → Actions → General:**
- Workflow permissions: **Read and write permissions**
- Allow GitHub Actions to create and approve pull requests: **Enabled**

## Documentation Deployment

### 1. GitHub Pages Configuration

The documentation will automatically deploy when:
- You push to the `main` branch
- Files in `docs/` directory change
- `mkdocs.yml` is modified

### 2. Custom Domain (Optional)

If you want a custom domain:
1. Add `CNAME` file to `docs/` directory
2. Configure DNS settings
3. Enable HTTPS in GitHub Pages settings

## Social Preview

### 1. Social Preview Image

**Create a social preview image:**
- Size: 1280x640 pixels
- Include: Framework logo, "Vibecoding Productivity Framework"
- Save as: `.github/social-preview.png`

### 2. Repository Description

**Use this description:**
```
🚀 AI-native development framework that transforms how you build software with AI assistance. Features Plan-Then-Act workflow, micro-tasks, automation stack, and comprehensive documentation.
```

## README Badges

### 1. Add Status Badges

**Add to README.md:**
```markdown
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Node](https://img.shields.io/badge/node-%3E%3D18.0.0-brightgreen.svg)
![Template](https://img.shields.io/badge/template-repository-green.svg)
```

### 2. Documentation Badge

**Add documentation link:**
```markdown
[![Documentation](https://img.shields.io/badge/docs-live-blue.svg)](https://yourusername.github.io/vibecoding-productivity)
```

## Issue Templates

### 1. Issue Templates Created

The following issue templates are already configured:
- **Bug Report** (`.github/ISSUE_TEMPLATE/bug_report.md`)
- **Feature Request** (`.github/ISSUE_TEMPLATE/feature_request.md`)

### 2. Pull Request Template

**Pull request template** (`.github/PULL_REQUEST_TEMPLATE.md`) is configured with:
- Description section
- Type of change checklist
- Quality checklist
- Testing instructions

## Community

### 1. Discussion Categories

**Enable Discussions:**
1. Go to **Settings** → **General**
2. Enable **Discussions**
3. Create categories:
   - **General**: General discussions
   - **Q&A**: Questions and answers
   - **Ideas**: Feature ideas and suggestions
   - **Show and tell**: Share your projects

### 2. Community Guidelines

**Files already included:**
- `CONTRIBUTING.md` - Contribution guidelines
- `CODE_OF_CONDUCT.md` - Code of conduct
- `LICENSE` - MIT License

## Release Management

### 1. Changesets Configuration

**Changesets are configured for:**
- Automated versioning
- CHANGELOG.md updates
- GitHub releases
- NPM publishing (if applicable)

### 2. Release Workflow

**The release workflow:**
1. Add changeset: `npx changeset`
2. Create version PR: `npm run release:version`
3. Merge PR to create release
4. GitHub Actions handles the rest

## Security

### 1. Security Policy

**Create `.github/SECURITY.md`:**
```markdown
# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |

## Reporting a Vulnerability

Please report security vulnerabilities to [email@example.com]
```

### 2. Dependency Security

**Dependencies are configured for:**
- Automated security audits
- Dependency updates
- Vulnerability scanning

## Analytics (Optional)

### 1. GitHub Insights

**Enable GitHub Insights:**
- Go to **Insights** tab
- View traffic, clones, and forks
- Monitor repository health

### 2. External Analytics

**Optional integrations:**
- Google Analytics (for documentation)
- GitHub Apps for enhanced features
- Third-party monitoring tools

## Final Checklist

### Before Making Public

- [ ] All sensitive data removed
- [ ] Repository description set
- [ ] Topics added
- [ ] Template repository enabled
- [ ] GitHub Pages configured
- [ ] Branch protection enabled
- [ ] Issue templates working
- [ ] PR template working
- [ ] Documentation builds successfully
- [ ] All links work
- [ ] Social preview image added
- [ ] README badges added
- [ ] Security policy added
- [ ] Community guidelines clear

### After Making Public

- [ ] Monitor issues and discussions
- [ ] Respond to community feedback
- [ ] Update documentation as needed
- [ ] Maintain security updates
- [ ] Track usage analytics
- [ ] Celebrate community contributions

## Next Steps

1. **Configure repository settings** using this guide
2. **Test all workflows** to ensure they work
3. **Make repository public** when ready
4. **Share with community** on social media
5. **Monitor and maintain** the repository

## Support

If you need help with repository setup:

1. Check the [GitHub documentation](https://docs.github.com)
2. Review the [automation guides](../docs/automation/)
3. Open an issue for specific problems
4. Join community discussions

---

**Remember**: A well-configured repository makes it easy for others to discover, use, and contribute to your project. Take time to set it up properly!
