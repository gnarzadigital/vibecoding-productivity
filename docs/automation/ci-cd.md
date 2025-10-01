# CI/CD Automation

Setting up continuous integration and deployment for your Vibecoding projects.

## Overview

The CI/CD automation provides:

- **Automated testing** on every push
- **Code quality checks** and linting
- **Automated documentation** deployment
- **Version management** and releases
- **GitHub Actions** workflows

## GitHub Actions Workflows

### Documentation Deployment

**`.github/workflows/docs.yml`**:
```yaml
name: Deploy Documentation

on:
  push:
    branches: [main]
    paths: ['docs/**', 'mkdocs.yml']

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          fetch-depth: 0
      
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.x'
      
      - name: Install dependencies
        run: |
          pip install mkdocs-material
          pip install mkdocs-git-revision-date-localized-plugin
      
      - name: Build docs
        run: mkdocs build
      
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./site
```

### Automated Releases

**`.github/workflows/release.yml`**:
```yaml
name: Release

on:
  push:
    branches: [main]

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          fetch-depth: 0
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
          cache: 'npm'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Create Release Pull Request
        id: changesets
        uses: changesets/action@v1
        with:
          publish: npm run release
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

### Code Quality Checks

**`.github/workflows/quality.yml`**:
```yaml
name: Code Quality

on: [push, pull_request]

jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
          cache: 'npm'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Run linting
        run: npm run lint
      
      - name: Check formatting
        run: npm run format:check
      
      - name: Run tests
        run: npm test
      
      - name: Build project
        run: npm run build
```

### TODO to Issue Automation

**`.github/workflows/todo-issue.yml`**:
```yaml
name: TODO to Issue

on:
  push:
    branches: [main]

jobs:
  todo-issue:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          fetch-depth: 0
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Run TODO to Issue
        run: |
          npx todo-to-issue
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Setup Instructions

### 1. Enable GitHub Pages

1. Go to **Settings** → **Pages**
2. Select **GitHub Actions** as source
3. Choose **main** branch
4. Set path to **/ (root)**

### 2. Configure Repository Secrets

**Required secrets**:
- `GITHUB_TOKEN` (automatically provided)
- `NPM_TOKEN` (for publishing packages)
- `OPENAI_API_KEY` (for AI features)

**Add secrets**:
1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Click **New repository secret**
3. Add each secret with appropriate values

### 3. Configure Repository Settings

**Repository settings**:
- **Description**: "AI-native development framework for productive coding"
- **Topics**: `vibecoding`, `ai-development`, `cursor`, `productivity`, `automation`
- **Website**: `https://yourusername.github.io/vibecoding-productivity`
- **Template repository**: Enable for easy forking

## Workflow Triggers

### Push Triggers

**Main branch pushes**:
- Documentation deployment
- Release automation
- TODO to Issue conversion

**All branch pushes**:
- Code quality checks
- Testing
- Linting

### Pull Request Triggers

**Pull request events**:
- Code quality checks
- Testing
- Linting
- Build verification

## Customization

### Adding New Workflows

**Create new workflow file**:
```yaml
# .github/workflows/custom.yml
name: Custom Workflow

on:
  push:
    branches: [main]

jobs:
  custom:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Custom step
        run: echo "Custom workflow"
```

### Environment Variables

**Set environment variables**:
```yaml
env:
  NODE_ENV: production
  API_URL: ${{ secrets.API_URL }}
  CUSTOM_VAR: ${{ secrets.CUSTOM_VAR }}
```

### Matrix Builds

**Test multiple Node versions**:
```yaml
strategy:
  matrix:
    node-version: [16, 18, 20]
steps:
  - name: Setup Node.js ${{ matrix.node-version }}
    uses: actions/setup-node@v4
    with:
      node-version: ${{ matrix.node-version }}
```

### Conditional Steps

**Run steps conditionally**:
```yaml
- name: Deploy to staging
  if: github.ref == 'refs/heads/develop'
  run: echo "Deploy to staging"

- name: Deploy to production
  if: github.ref == 'refs/heads/main'
  run: echo "Deploy to production"
```

## Advanced Features

### Caching

**Cache dependencies**:
```yaml
- name: Cache node modules
  uses: actions/cache@v3
  with:
    path: ~/.npm
    key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
```

**Cache build artifacts**:
```yaml
- name: Cache build
  uses: actions/cache@v3
  with:
    path: dist/
    key: ${{ runner.os }}-build-${{ github.sha }}
```

### Artifacts

**Upload build artifacts**:
```yaml
- name: Upload build artifacts
  uses: actions/upload-artifact@v3
  with:
    name: build-files
    path: dist/
```

**Download artifacts**:
```yaml
- name: Download build artifacts
  uses: actions/download-artifact@v3
  with:
    name: build-files
    path: dist/
```

### Notifications

**Slack notifications**:
```yaml
- name: Notify Slack
  uses: 8398a7/action-slack@v3
  with:
    status: ${{ job.status }}
    channel: '#deployments'
  env:
    SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
```

**Email notifications**:
```yaml
- name: Send email
  uses: dawidd6/action-send-mail@v3
  with:
    server_address: smtp.gmail.com
    server_port: 587
    username: ${{ secrets.EMAIL_USERNAME }}
    password: ${{ secrets.EMAIL_PASSWORD }}
    subject: "Deployment Status: ${{ job.status }}"
    body: "Deployment completed with status: ${{ job.status }}"
```

## Monitoring and Debugging

### Workflow Status

**Check workflow status**:
1. Go to **Actions** tab in GitHub
2. View workflow runs
3. Click on specific run for details
4. Check logs for errors

### Debugging Failed Workflows

**Common issues**:
- **Permission errors**: Check repository secrets
- **Node version issues**: Update Node.js version
- **Dependency issues**: Check package.json and lock files
- **Path issues**: Verify file paths in workflows

**Debug steps**:
```yaml
- name: Debug information
  run: |
    echo "Node version: $(node --version)"
    echo "NPM version: $(npm --version)"
    echo "Working directory: $(pwd)"
    echo "Files: $(ls -la)"
```

### Logs and Artifacts

**View logs**:
1. Go to **Actions** → **Workflow run**
2. Click on **job** to see steps
3. Click on **step** to see logs
4. Download artifacts if needed

## Security Best Practices

### Secrets Management

**Never commit secrets**:
- Use repository secrets for sensitive data
- Use environment variables for non-sensitive data
- Rotate secrets regularly
- Use least privilege principle

### Permissions

**Minimal permissions**:
```yaml
permissions:
  contents: read
  pages: write
  id-token: write
```

**Token scopes**:
- `GITHUB_TOKEN`: Automatic, limited scope
- `NPM_TOKEN`: For publishing packages
- `OPENAI_API_KEY`: For AI features

### Dependency Security

**Audit dependencies**:
```yaml
- name: Security audit
  run: npm audit
```

**Update dependencies**:
```yaml
- name: Update dependencies
  run: npm update
```

## Troubleshooting

### Common Issues

**Workflow not triggering**:
- Check file paths in workflow triggers
- Verify branch names
- Check workflow syntax

**Permission denied**:
- Check repository secrets
- Verify token permissions
- Check workflow permissions

**Build failures**:
- Check Node.js version
- Verify dependencies
- Check file paths

### Debug Commands

**Test locally**:
```bash
# Test workflow steps locally
npm ci
npm run lint
npm run test
npm run build
```

**Check GitHub CLI**:
```bash
# Install GitHub CLI
npm install -g @github/cli

# Check workflow status
gh run list
gh run view <run-id>
```

## Next Steps

Now that CI/CD is set up:

1. **Monitor workflow runs** for any issues
2. **Customize workflows** for your project needs
3. **Add additional checks** as needed
4. **Set up notifications** for important events
5. **Optimize workflow performance**

Remember: The goal is to automate repetitive tasks and catch issues early, so you can focus on building great software with AI assistance.
