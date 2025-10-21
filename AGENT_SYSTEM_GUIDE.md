# Intelligent Agent System Guide

## 🤖 Overview

This Vibecoding framework includes an **intelligent agent system** that guides
you from vague idea to production-ready MVP in days, not weeks.

## Agent Roster

### 1. **Project Orchestrator** 🎯

**Command**: `/start-project`

**Role**: Master coordinator that manages the entire project setup workflow.

**Workflow**:

```
Idea → Research → Stack Selection → Documentation → Custom Rules → Setup → Ready to Code
```

**Use When**: Starting any new project from scratch.

### 2. **Ideation Agent** 💡

**Command**: `/ideate`

**Role**: Transforms vague ideas into concrete, validated project concepts.

**Capabilities**:

- Clarifies problem statements
- Validates target users
- Scopes MVP ruthlessly
- Documents vision
- Challenges assumptions

**Delivers**:

- Updated PLANNING.md
- Initial TASK.md
- Project context in AI_MEMORY.md

### 3. **Research Agent** 🔍

**Command**: `/research`

**Role**: Deep research specialist for repos, tools, models, APIs, and data
sources.

**Research Areas**:

- GitHub repositories (reference implementations)
- AI models (latest benchmarks)
- npm packages/tools
- Public APIs & data sources
- Open datasets
- Competitive analysis

**Delivers**:

- Repository analysis (3-5 high-quality refs)
- Tool comparisons
- Real data source options
- Cost analysis

### 4. **Tech Stack Advisor** 🛠️

**Command**: `/techstack`

**Role**: Recommends optimal technology stack based on requirements and
research.

**Selection Criteria**:

1. Developer experience (fastest to build)
2. Free tiers (minimize costs)
3. Type safety (prevent bugs)
4. Battle-tested (production-proven)
5. Easy deployment (ship quickly)

**Delivers**:

- Complete stack recommendation
- Alternative options with trade-offs
- Cost breakdown
- Setup commands
- Timeline estimate

## Core Principles (Embedded in All Agents)

### 1. **No Mock Data - Ever**

All agents enforce the **zero tolerance** policy on fake data:

- ✅ Real APIs
- ✅ Actual datasets
- ✅ Live scraping
- ❌ Never mock data
- ❌ Never placeholders
- ❌ Never synthetic data

### 2. **MVP-First Mindset**

Every recommendation optimizes for:

- **Speed**: Ship in days, not weeks
- **Simplicity**: Minimum viable feature set
- **Real value**: Solves actual problems
- **Production-ready**: Deployable immediately

### 3. **State-of-the-Art Awareness**

Agents stay current with:

- Latest AI models & benchmarks
- Modern frameworks & tools
- Recent GitHub repos (2024+)
- Current best practices

## Workflow Examples

### Example 1: Complete Project Setup

```markdown
User: /start-project

Orchestrator: Let's build your project! What's your idea?

User: I want to track trending GitHub repos in AI/ML and get daily summaries

Orchestrator → Ideation Agent: ✅ Problem: Staying updated on AI/ML trends is
time-consuming ✅ User: AI/ML developers & researchers ✅ MVP: Daily email
digest of trending AI repos with GPT summaries ✅ Timeline: 2-3 days

Orchestrator → Research Agent: ✅ Found 3 reference repos (github-trending-api,
awesome-github-stats) ✅ Data source: GitHub REST API (free, 5K req/hour) ✅
Alternative: GitHub GraphQL (more efficient) ✅ Email options: Resend (3K free),
SendGrid (100/day free)

Orchestrator → Tech Stack Advisor: ✅ Runtime: Node.js + TypeScript ✅
Scheduler: GitHub Actions cron (free) ✅ AI: GPT-4o Mini ($0.15/1M tokens) ✅
Email: Resend (free tier sufficient) ✅ Storage: JSON files (simple, no DB
needed) ✅ Cost: ~$2/month

Orchestrator → Documentation: ✅ PLANNING.md updated with stack ✅ TASK.md has 8
tasks ✅ AI_MEMORY.md notes rate limits

Orchestrator → Custom Rules: ✅ Created .rulesync/rules/github-api-patterns.md
✅ Created .rulesync/rules/email-templates.md

Orchestrator → Project Setup: ✅ npm project initialized ✅ Dependencies
installed (@octokit/rest, resend, openai) ✅ Folder structure created ✅
.env.example with required keys ✅ AI configs regenerated

Orchestrator: 🎉 PROJECT READY!

Next steps:

1. Add GitHub token to .env.local
2. Add Resend API key to .env.local
3. Run: npm run dev
4. Test with: npm run test-scrape

Estimated MVP completion: 2 days
```

### Example 2: Just Ideation

```markdown
User: /ideate

Ideation Agent: Tell me about your project!

User: A social media app for developers

Agent: Let's narrow this down:

- What specific problem does it solve?
- Which social media aspect? (sharing, messaging, communities?)
- Who are the first 10 users?
- What's the ONE thing it does better than existing solutions?

User: It's for sharing code snippets with syntax highlighting

Agent: Good! More specific. But "sharing code snippets" exists (GitHub Gists,
Carbon, etc.)

What's your unique angle?

- Is it about discovery? (find snippets by use case)
- Is it about collaboration? (edit together)
- Is it about learning? (snippets with explanations)

User: It's about finding snippets for specific problems, like StackOverflow but
just code

Agent: ✅ MUCH BETTER!

**Refined Concept**: Problem: Finding working code examples takes too long (read
through SO answers) Solution: Curated, tested code snippets searchable by
problem User: Developers stuck on specific implementation tasks

**MVP Scope** (2-3 days):

1. Submit code snippet (form)
2. Tag with problem/language/framework
3. Search snippets (simple text search)
4. Copy snippet (one click)

**Cut for MVP**:

- ❌ User accounts (add later)
- ❌ Comments (add later)
- ❌ Voting (add later)
- ❌ Syntax highlighting (use library)

**Real Data Strategy**:

- Seed with your own snippets (10-20)
- Scrape code from GitHub Issues (real solutions)
- Import from StackOverflow accepted answers

**Tech Stack Ideas**:

- Next.js + Supabase (fast setup)
- Meilisearch for search (typo-tolerant)
- Shiki for syntax highlighting

Ready for /techstack to research tools?
```

### Example 3: Just Research

```markdown
User: /research for best Next.js database options

Research Agent: Researching Next.js database options...

## Database Options for Next.js

**Researched**: 15 options, filtered to top 5

### Option 1: Neon PostgreSQL

- **Type**: Serverless Postgres
- **Free Tier**: 10GB storage, 100 hours compute/month
- **DX**: ⭐⭐⭐⭐⭐ (Excellent)
- **Setup Time**: 2 minutes
- **Next.js Integration**: Native (works great with Drizzle/Prisma)
- **Pros**: Generous free tier, instant setup, serverless
- **Cons**: Newer service (less mature than AWS RDS)
- **Best For**: Most Next.js projects

### Option 2: Supabase PostgreSQL

- **Type**: PostgreSQL + Auth + Storage + Realtime
- **Free Tier**: 500MB database, 1GB file storage
- **DX**: ⭐⭐⭐⭐⭐ (Excellent)
- **Setup Time**: 3 minutes
- **Next.js Integration**: Official SDK, great docs
- **Pros**: All-in-one (DB + Auth + Storage), realtime subscriptions
- **Cons**: Smaller free DB tier than Neon
- **Best For**: Apps needing auth + realtime features

### Option 3: PlanetScale

- **Type**: Serverless MySQL
- **Free Tier**: 5GB storage, 1 billion row reads/month
- **DX**: ⭐⭐⭐⭐ (Very Good)
- **Setup Time**: 5 minutes
- **Next.js Integration**: Works with Drizzle/Prisma
- **Pros**: Database branching (like Git), generous reads
- **Cons**: MySQL (not Postgres), branching can be complex
- **Best For**: MySQL preference, need DB branching

### Option 4: Upstash (Redis)

- **Type**: Serverless Redis
- **Free Tier**: 10,000 commands/day
- **DX**: ⭐⭐⭐⭐ (Very Good)
- **Setup Time**: 2 minutes
- **Next.js Integration**: Official SDK, edge-ready
- **Pros**: Super fast (edge), free tier sufficient for small apps
- **Cons**: Key-value only (not relational)
- **Best For**: Caching, sessions, simple data

### Option 5: MongoDB Atlas

- **Type**: Document database
- **Free Tier**: 512MB storage
- **DX**: ⭐⭐⭐ (Good)
- **Setup Time**: 10 minutes (more config)
- **Next.js Integration**: Mongoose/MongoDB driver
- **Pros**: Flexible schema, good for rapid prototyping
- **Cons**: Small free tier, NoSQL trade-offs
- **Best For**: Document-heavy data, flexible schemas

## Recommendation

**For most Next.js MVPs**: **Neon PostgreSQL**

- Best free tier (10GB)
- Fastest setup
- PostgreSQL (industry standard)
- Great DX

**If you need auth/storage too**: **Supabase**

- All-in-one solution
- Built-in auth, storage, realtime
- Slightly smaller DB free tier but worth it for extras

**If you're doing mostly caching**: **Upstash Redis**

- Edge-ready
- Super fast
- Perfect for sessions, cache

## Reference Repos Using These DBs

1. **next-saas-starter** (4.5k ⭐) - Uses Neon

   - Great reference for schema design
   - Shows proper migrations

2. **taxonomy** (15k ⭐) - Uses PlanetScale

   - Vercel's official demo
   - Clean DB patterns

3. **supabase-examples/nextjs** (Official) - Uses Supabase
   - Shows auth + DB integration
   - Realtime examples

Need help choosing for your specific use case?
```

## Agent Interaction Patterns

### Pattern 1: Sequential (Full Workflow)

```
/start-project
  ↓
Ideation → Research → Stack Selection → Setup
```

### Pattern 2: Individual Agents

```
/ideate           # Just refine idea
/research [topic] # Just research something
/techstack        # Just get stack recommendation
```

### Pattern 3: Iterative Refinement

```
/ideate
  → User: "Actually, I want to change..."
/ideate (continues)
  → User: "That's better!"
/research
  → Found X options
User: "Research alternative Y"
/research Y
  → Here's comparison
```

## Best Practices

### For Users

**Do**:

- ✅ Start with `/start-project` for new projects
- ✅ Be specific when describing problems
- ✅ Ask agents to research alternatives
- ✅ Challenge recommendations (agents explain)
- ✅ Iterate until you're confident

**Don't**:

- ❌ Skip ideation phase (leads to scope creep)
- ❌ Ignore agent warnings about complexity
- ❌ Approve tech stacks you don't understand
- ❌ Rush through - agents save time later

### For Agents

**All agents must**:

- ✅ Enforce no mock data policy
- ✅ Prioritize MVP scope
- ✅ Provide alternatives with trade-offs
- ✅ Cite sources (links, repos, docs)
- ✅ Give concrete examples
- ✅ Update documentation
- ✅ Ask clarifying questions

**All agents must avoid**:

- ❌ Recommending mock/fake data
- ❌ Over-engineering solutions
- ❌ Suggesting untested tools
- ❌ Making assumptions without asking
- ❌ Leaving decisions undocumented

## Integration with Vibecoding Framework

### Automated Documentation

Agents automatically update:

- `PLANNING.md` - Vision, stack, architecture
- `TASK.md` - Implementation tasks
- `AI_MEMORY.md` - Decisions, constraints, learnings
- `.rulesync/rules/` - Custom framework rules

### Automated Setup

Project Orchestrator generates:

- Project structure
- Configuration files
- Environment templates
- Dependencies installation
- Git initialization
- AI rule synchronization

### Continuous Learning

Agents learn from:

- Latest GitHub trends (daily)
- Model benchmarks (weekly)
- Tool updates (monthly)
- User feedback (session-based)

## Troubleshooting

### "Agent gives generic advice"

**Solution**: Provide more context

- Mention your experience level
- Specify constraints (time, budget)
- Share technical preferences

### "Recommendations don't fit my use case"

**Solution**: Challenge and iterate

- Ask: "What about [alternative]?"
- Request: "Compare X vs Y for my specific case"
- Explain: "I prefer X because..."

### "Too many options, can't decide"

**Solution**: Ask for filtered recommendation

- "What's the safest choice?"
- "What's fastest to build with?"
- "What would you use?"

## Advanced Usage

### Custom Agent Invocation

Agents can be triggered mid-conversation:

```markdown
User: "I'm building X with Y, but need Z"
```
