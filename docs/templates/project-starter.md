# Project Starter Template

A comprehensive guide to setting up new projects with the Vibecoding framework.

## Quick Start

### 1. Clone the Template

```bash
git clone https://github.com/yourusername/vibecoding-productivity.git my-project
cd my-project
```

### 2. Run Setup

```bash
npm run setup
```

### 3. Customize Configuration

Update these files with your project details:

- `PLANNING.md` - Project vision and architecture
- `TASK.md` - Current sprint and tasks
- `AI_MEMORY.md` - Project-specific learnings
- `mkdocs.yml` - Documentation site configuration

## Project Structure

```
my-project/
│
├── 📋 Core Vibecoding Files
│   ├── PLANNING.md              # Project vision & architecture
│   ├── TASK.md                  # Current sprint & tasks
│   ├── AI_MEMORY.md             # Project-specific learnings
│   ├── WORKFLOW.md              # Daily workflow guide
│   ├── CHANGELOG.md             # Version history
│   └── README.md                # Project documentation
│
├── 🤖 AI Behavior
│   ├── .cursorrules             # Main Cursor configuration
│   └── .cursor/rules/           # Modular AI behavior rules
│       ├── core.mdc             # Core project rules
│       ├── scope-control.mdc    # Prevent scope creep
│       ├── task-execution.mdc   # Task workflow
│       ├── planning-first.mdc   # Plan-Then-Act mandate
│       ├── automation.mdc       # Git hooks & CI/CD
│       └── ... (10 more rules)
│
├── 🔧 Automation Stack
│   ├── scripts/bootstrap.sh     # One-shot setup
│   ├── package.json             # Dependencies & scripts
│   ├── lefthook.yml             # Git hooks
│   ├── .lintstagedrc.json       # Staged file linting
│   ├── commitlint.config.js     # Commit standards
│   ├── .prettierrc              # Code formatting
│   ├── .gitignore               # Git ignore rules
│   └── .changeset/              # Version management
│
├── 📚 Documentation
│   ├── docs/                    # MkDocs documentation
│   │   ├── index.md             # Documentation home
│   │   ├── getting-started/     # Setup guides
│   │   ├── framework/           # Core concepts
│   │   ├── automation/          # CI/CD guides
│   │   ├── templates/           # Project templates
│   │   └── reference/           # Advanced guides
│   └── mkdocs.yml               # Docs configuration
│
├── 🚀 CI/CD
│   └── .github/workflows/       # GitHub Actions
│       ├── docs.yml             # Documentation deployment
│       ├── release.yml          # Automated releases
│       └── todo-issue.yml      # TODO to Issue automation
│
├── 📦 Templates
│   └── templates/               # Reusable project templates
│       ├── project-starter.md   # Project setup guide
│       ├── react-rules.mdc      # React/Next.js rules
│       ├── vue-rules.mdc        # Vue.js rules
│       ├── python-rules.mdc     # Python/FastAPI rules
│       ├── nodejs-rules.mdc     # Node.js/Express rules
│       ├── git-workflow.mdc     # Git standards
│       └── deployment.mdc       # Deployment patterns
│
└── 💻 Your Actual Code (Add when using as template)
    ├── src/                     # Source code
    ├── tests/                   # Test files
    └── public/                  # Static assets
```

## Configuration Files

### PLANNING.md Template

```markdown
# Project: [Your Project Name]

## Vision
[Your project's purpose and goals]

## Tech Stack
- Frontend: [React, Vue, etc.]
- Backend: [Node.js, Python, etc.]
- Database: [PostgreSQL, MongoDB, etc.]
- Deployment: [Vercel, AWS, etc.]

## Architecture
[High-level system design]

## Key Features
- [Feature 1]
- [Feature 2]
- [Feature 3]

## Development Environment
- Node.js: [Version]
- Package Manager: [npm, yarn, pnpm]
- IDE: [Cursor, Windsurf, etc.]

## Deployment
- Staging: [URL]
- Production: [URL]
- CI/CD: [GitHub Actions, etc.]
```

### TASK.md Template

```markdown
# Sprint: [Current Sprint Name]

## 🎯 Sprint Goals
- [ ] [Primary goal 1]
- [ ] [Primary goal 2]
- [ ] [Primary goal 3]

## ✅ Completed
- [x] [Completed task 1]
- [x] [Completed task 2]

## 🔄 In Progress
- [ ] [Current task - be specific]
  - [ ] [Sub-task 1]
  - [ ] [Sub-task 2]
  - [ ] [Sub-task 3]

## 📋 Backlog
- [ ] [Future task 1]
- [ ] [Future task 2]
- [ ] [Future task 3]

## 🐛 Known Issues
- [ ] [Issue 1 - brief description]
- [ ] [Issue 2 - brief description]

## 📝 Notes
- [Important note 1]
- [Important note 2]

## 🎯 Next Actions
1. [Immediate next step]
2. [Following step]
3. [Third step]

---
**Sprint Start**: [Date]
**Sprint End**: [Date]
**Last Updated**: [Date]
```

### AI_MEMORY.md Template

```markdown
# AI Memory - [Project Name]

## Project Context
[Key project details for AI context]

## Common Patterns
[Frequently used code patterns]

## Known Issues
[Issues and workarounds]

## Lessons Learned
[What works well, what to avoid]

## Best Practices
[Project-specific best practices]

## API Endpoints
[Key API endpoints and their usage]

## Database Schema
[Key database tables and relationships]

## Environment Variables
[Required environment variables]

## Deployment Notes
[Deployment-specific information]
```

## Framework-Specific Setup

### React/Next.js Projects

**Add React rules**:
```bash
cp templates/react-rules.mdc .cursor/rules/
```

**Update package.json**:
```json
{
  "dependencies": {
    "react": "^18.2.0",
    "next": "^14.0.0"
  },
  "devDependencies": {
    "@types/react": "^18.2.0",
    "@types/node": "^20.0.0",
    "typescript": "^5.0.0"
  }
}
```

**Create Next.js config**:
```javascript
// next.config.js
/** @type {import('next').NextConfig} */
const nextConfig = {
  experimental: {
    appDir: true,
  },
}

module.exports = nextConfig
```

### Vue.js Projects

**Add Vue rules**:
```bash
cp templates/vue-rules.mdc .cursor/rules/
```

**Update package.json**:
```json
{
  "dependencies": {
    "vue": "^3.3.0"
  },
  "devDependencies": {
    "@vitejs/plugin-vue": "^4.0.0",
    "vite": "^4.0.0",
    "typescript": "^5.0.0"
  }
}
```

**Create Vite config**:
```javascript
// vite.config.js
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
})
```

### Python/FastAPI Projects

**Add Python rules**:
```bash
cp templates/python-rules.mdc .cursor/rules/
```

**Create requirements.txt**:
```txt
fastapi==0.104.1
uvicorn==0.24.0
pydantic==2.5.0
python-multipart==0.0.6
```

**Create main.py**:
```python
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}
```

### Node.js/Express Projects

**Add Node.js rules**:
```bash
cp templates/nodejs-rules.mdc .cursor/rules/
```

**Update package.json**:
```json
{
  "dependencies": {
    "express": "^4.18.0",
    "cors": "^2.8.5"
  },
  "devDependencies": {
    "@types/express": "^4.17.0",
    "@types/node": "^20.0.0",
    "typescript": "^5.0.0"
  }
}
```

**Create server.js**:
```javascript
const express = require('express');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.json({ message: 'Hello World!' });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

## Customization

### Adding New Rules

**Create custom rule**:
```markdown
# .cursor/rules/custom.mdc

# Custom Project Rules

## Project-Specific Patterns
- Use [specific pattern] for [specific use case]
- Avoid [anti-pattern] because [reason]
- Always [best practice] when [condition]

## Domain Knowledge
- [Business rule 1]
- [Business rule 2]
- [Business rule 3]

## Technical Constraints
- [Constraint 1]
- [Constraint 2]
- [Constraint 3]
```

### Environment Configuration

**Create .env.example**:
```bash
# Database
DATABASE_URL=postgresql://username:password@localhost:5432/dbname

# API Keys
OPENAI_API_KEY=your_openai_api_key_here
GITHUB_TOKEN=your_github_token_here

# Application
NODE_ENV=development
PORT=3000
```

**Update .gitignore**:
```gitignore
# Environment variables
.env
.env.local
.env.production

# Dependencies
node_modules/
__pycache__/

# Build outputs
dist/
build/
.next/
.nuxt/

# IDE
.vscode/
.idea/

# OS
.DS_Store
Thumbs.db
```

### Documentation Customization

**Update mkdocs.yml**:
```yaml
site_name: [Your Project Name]
site_description: [Your project description]
site_author: [Your Name]
site_url: https://yourusername.github.io/your-project

# Repository
repo_name: yourusername/your-project
repo_url: https://github.com/yourusername/your-project
```

## Testing Setup

### Unit Testing

**Jest configuration**:
```javascript
// jest.config.js
module.exports = {
  testEnvironment: 'node',
  testMatch: ['**/__tests__/**/*.test.js'],
  collectCoverageFrom: [
    'src/**/*.js',
    '!src/**/*.test.js'
  ]
};
```

**Test script**:
```javascript
// src/utils/validation.test.js
import { validateEmail } from './validation';

describe('validateEmail', () => {
  test('validates correct email', () => {
    expect(validateEmail('test@example.com')).toBe(true);
  });

  test('rejects invalid email', () => {
    expect(validateEmail('invalid-email')).toBe(false);
  });
});
```

### Integration Testing

**API testing**:
```javascript
// tests/api.test.js
import request from 'supertest';
import app from '../src/app';

describe('API Endpoints', () => {
  test('GET /', async () => {
    const response = await request(app).get('/');
    expect(response.status).toBe(200);
    expect(response.body).toHaveProperty('message');
  });
});
```

## Deployment

### Vercel Deployment

**vercel.json**:
```json
{
  "version": 2,
  "builds": [
    {
      "src": "package.json",
      "use": "@vercel/next"
    }
  ]
}
```

### Docker Deployment

**Dockerfile**:
```dockerfile
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
```

**docker-compose.yml**:
```yaml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
```

## Best Practices

### Project Organization

1. **Keep files under 500 lines**
2. **Use feature-based folder structure**
3. **Separate concerns** (components, services, utils)
4. **Follow naming conventions**

### Code Quality

1. **Use TypeScript** for type safety
2. **Write tests** for critical functionality
3. **Follow linting rules**
4. **Document complex logic**

### Git Workflow

1. **Use conventional commits**
2. **Make atomic commits**
3. **Write descriptive commit messages**
4. **Use feature branches**

### AI Development

1. **Always plan before coding**
2. **Break tasks into micro-tasks**
3. **Update AI_MEMORY.md** regularly
4. **Revert when struggling**

## Next Steps

Now that your project is set up:

1. **Start with a simple task** to practice the workflow
2. **Build your AI Memory** with project learnings
3. **Customize rules** for your specific needs
4. **Experiment with different patterns**
5. **Measure your productivity gains**

Remember: The goal is to build a system that gets better over time through consistent practice and learning.
