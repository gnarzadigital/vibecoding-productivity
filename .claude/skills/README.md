# Claude Agent Skills

This directory contains specialized agent skills for the vibecoding productivity
framework.

## Available Skills

### 1. **project-orchestrator**

**Purpose**: Master coordinator for complete project setup from ideation to
ready-to-code

**Use when**: Starting a new project from scratch

**What it does**:

- Coordinates all phases of project setup
- Invokes other skills in the right order
- Updates PLANNING.md, TASK.md, AI_MEMORY.md
- Creates custom rules for your framework
- Initializes project structure
- Provides deployment-ready setup

**Example**: "Help me start a new project" or invoke with `project-orchestrator`
skill

---

### 2. **ideation**

**Purpose**: Transform vague ideas into concrete, validated project concepts

**Use when**: You have a rough idea but need to clarify scope and validate the
concept

**What it does**:

- Asks discovery questions to clarify the idea
- Validates problem-solution fit
- Identifies target users
- Ruthlessly scopes MVP (cuts non-essential features)
- Documents vision in PLANNING.md, TASK.md, AI_MEMORY.md
- Ensures real data sources (no mocks!)

**Example**: "I want to build something with AI" → Ideation skill helps narrow
it down to a concrete MVP

---

### 3. **research**

**Purpose**: Deep research specialist for finding repos, tools, models, APIs,
and data sources

**Use when**: You need to find the best tools, libraries, or data sources for
your project

**What it does**:

- Searches GitHub for reference implementations
- Compares npm packages and libraries
- Researches latest AI model benchmarks
- Discovers public APIs and datasets
- Performs competitive analysis
- Provides data-driven recommendations

**Example**: "Find the best web scraping libraries for TypeScript" or "What's
the state-of-the-art for text embeddings?"

---

### 4. **techstack**

**Purpose**: Research and recommend optimal tech stacks for rapid MVP
development

**Use when**: You need to select technologies for a new project

**What it does**:

- Analyzes project requirements
- Recommends languages, frameworks, databases
- Suggests AI models (if needed)
- Identifies APIs and services
- Recommends deployment platforms
- Provides cost analysis and timeline estimates
- Links to reference GitHub projects

**Example**: "Recommend a tech stack for a real-time chat app" or "What's the
best stack for data scraping?"

---

## How to Use Skills

### In Claude Code

Skills are invoked by name using the Skill tool:

```
"Use the ideation skill to help me refine my project idea"
"Invoke the research skill to find the best libraries for web scraping"
"Use techstack to recommend a stack for my AI chat app"
"Use project-orchestrator to set up a complete new project"
```

### Workflow

**Typical project setup flow**:

1. **Start**: Invoke `project-orchestrator` skill
2. **Ideation**: Automatically invokes `ideation` to clarify concept
3. **Research**: Automatically invokes `research` to find tools/data
4. **Stack Selection**: Automatically invokes `techstack` to recommend
   technologies
5. **Documentation**: Updates all project docs
6. **Setup**: Initializes project structure
7. **Ready to Code**: You start building!

**Individual skill usage**:

- **Need to validate an idea?** → Use `ideation`
- **Need to find tools/APIs?** → Use `research`
- **Need tech recommendations?** → Use `techstack`
- **Need complete setup?** → Use `project-orchestrator`

---

## Key Principles

All skills follow these vibecoding principles:

- **No mock data** - Only real data sources (APIs, datasets, scraping)
- **MVP-first** - Ruthlessly cut scope to ship fast
- **Real benchmarks** - Use latest performance data
- **Free tiers first** - Minimize costs for MVP
- **Type safety** - Prefer TypeScript and typed languages
- **Battle-tested** - Recommend proven technologies
- **Speed to deploy** - Prioritize easy deployment

---

## Skill Structure

Each skill follows the Claude Agent Skills format:

```
skill-name/
└── SKILL.md          # Contains YAML frontmatter + instructions
```

**SKILL.md format**:

```markdown
---
name: skill-name
description: Brief description (max 1024 chars)
---

# Skill Name

[Detailed instructions for Claude]
```

---

## Differences from .rulesync/subagents

The original `.rulesync/subagents/` files have been converted to Claude skills:

| Original                 | Claude Skill                 | Changes                           |
| ------------------------ | ---------------------------- | --------------------------------- |
| `/start-project` trigger | `project-orchestrator` skill | No slash commands, invoke by name |
| `/ideate` trigger        | `ideation` skill             | No slash commands                 |
| `/research` trigger      | `research` skill             | No slash commands                 |
| `/techstack` trigger     | `techstack` skill            | No slash commands                 |

**Key differences**:

- **No triggers field** - Skills are invoked by name, not slash commands
- **Simpler frontmatter** - Only `name` and `description` required
- **Progressive loading** - Claude loads skills only when needed
- **Standard format** - Works across Claude.ai, Claude Code, SDK, API

---

## Contributing

To add new skills:

1. Create a new directory: `.claude/skills/skill-name/`
2. Create `SKILL.md` with YAML frontmatter
3. Keep `name` under 64 chars, `description` under 1024 chars
4. Write clear, actionable instructions
5. Follow vibecoding principles (MVP-first, no mocks, etc.)

---

## Resources

- [Claude Agent Skills Documentation](https://docs.claude.com/en/docs/agents-and-tools/agent-skills/overview)
- [Anthropic Skills Blog Post](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills)
- [Claude Skills Cookbook](https://github.com/anthropics/claude-cookbooks/tree/main/skills)
