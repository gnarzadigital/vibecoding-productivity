---
description: 'Build production-ready MVPs with extreme efficiency'
globs:
  - '**/*'
alwaysApply: true
---

# MVP-First Development

## Core Principle: Ship Fast, Ship Real

**Every project assumes immediate deadline.** **Build the simplest version that
delivers real value.**

## MVP Definition

An MVP must be:

- ✅ **Production-ready** - Actually deployable
- ✅ **Real data** - No mocks or placeholders
- ✅ **Core value** - Solves the primary problem
- ✅ **Minimal scope** - Ruthlessly cut non-essentials
- ✅ **Fast to build** - Days, not weeks

## Time-Boxing

### Feature Estimation

- **Core feature**: Max 1-2 days
- **Nice-to-have**: Cut it
- **Complex workflow**: Simplify or cut
- **Multiple integrations**: Pick one for MVP

### If It Takes Longer

```markdown
WRONG: "This will take 2 weeks to build properly" RIGHT: "What can we ship in 2
days that provides value?"
```

## Ruthless Prioritization

### Must Have (Build Now)

- Core user workflow
- Critical data source
- Minimal UI (can be CLI)
- Essential error handling
- Basic deployment

### Should Have (Next Iteration)

- Enhanced UI/UX
- Additional features
- Optimizations
- Advanced error handling
- Monitoring/analytics

### Could Have (Maybe Never)

- Perfect design
- All edge cases
- Complex abstractions
- Premature optimization
- Excessive configuration

## MVP Tech Stack Selection

### Prioritize

1. **Fastest to implement** - Use what you know
2. **Fewest dependencies** - Less complexity
3. **Battle-tested** - Proven in production
4. **Good defaults** - Minimal config
5. **Easy deployment** - One-command deploy

### Avoid

- ❌ New/unproven frameworks
- ❌ Over-engineered solutions
- ❌ Excessive microservices
- ❌ Complex build pipelines
- ❌ Premature abstractions

## Implementation Speed Guidelines

### Use Pre-Built Solutions

```typescript
// ❌ WRONG - Build from scratch
const customAuth = new AuthSystem()
await customAuth.configureOAuth()
await customAuth.setupJWT()

// ✅ CORRECT - Use proven library
import { auth } from '@clerk/nextjs/server'
const { userId } = auth()
```

### Leverage Existing Tools

- **Auth**: Clerk, Supabase Auth, Auth0
- **Database**: Supabase, PlanetScale, Neon
- **File Storage**: Uploadthing, S3, Cloudflare R2
- **Payments**: Stripe, LemonSqueezy
- **Email**: Resend, SendGrid
- **Hosting**: Vercel, Fly.io, Railway

### Copy Working Code

```bash
# Find proven implementations
gh search repos "authentication nextjs typescript" --stars ">1000"
# Adapt working patterns, don't reinvent
```

## MVP Code Standards

### Optimize for Speed, Not Perfection

```typescript
// ❌ WRONG - Premature abstraction
class DataProcessor {
  private validator: IValidator
  private transformer: ITransformer
  private loader: IDataLoader
  // ... 100 lines of abstraction
}

// ✅ CORRECT - Direct implementation
async function processData(input: string) {
  const cleaned = input.trim()
  const validated = z.string().parse(cleaned)
  return db.insert(validated)
}
```

### Use Type Safety, Skip Over-Engineering

```typescript
// ✅ Good - Type-safe but simple
type User = { id: string; email: string }

// ❌ Overkill for MVP
interface IUser extends BaseEntity, Timestamped, Auditable {
  // ... complex type hierarchy
}
```

## Deployment First

### MVP Deployment Checklist

- [ ] One-command deploy (`git push` to Vercel/Railway/Fly)
- [ ] Environment variables configured
- [ ] Database migrations automated
- [ ] Health check endpoint
- [ ] Error tracking (Sentry/basic logging)

### Don't Need for MVP

- ❌ Complex CI/CD pipelines
- ❌ Multi-region deployment
- ❌ Auto-scaling infrastructure
- ❌ Comprehensive monitoring
- ❌ Load balancers

## Real Data From Day One

**No mock data - use real sources:**

### Quick Real Data Sources

```typescript
// ✅ Public APIs (free tier)
const data = await fetch('https://api.github.com/users/...')
const weather = await fetch('https://api.openweathermap.org/...')
const news = await fetch('https://newsapi.org/v2/...')

// ✅ Web scraping (respect robots.txt)
import * as cheerio from 'cheerio'
const html = await fetch('https://...')
const $ = cheerio.load(html)

// ✅ Open datasets
import kaggleData from './data/real-dataset.json'
```

## MVP Testing Strategy

### Essential Tests Only

- ✅ Core user flow works end-to-end
- ✅ Data persistence works
- ✅ API integration works
- ⏭️ Skip unit tests for simple functions
- ⏭️ Skip edge case tests initially

### Use Real Data in Tests

```typescript
// ✅ CORRECT - Real test data
test('fetch user profile', async () => {
  const realUserId = 'real-test-user-id'
  const profile = await getUserProfile(realUserId)
  expect(profile.email).toContain('@')
})
```

## Speed vs Quality Trade-offs

### MVP: Optimize for Speed

- ✅ Direct database queries (optimize later)
- ✅ Inline styles (refactor to CSS later)
- ✅ Single file components (split later)
- ✅ Basic error messages (enhance later)
- ✅ Simple validation (add complexity later)

### Never Compromise On

- ✅ Real data (no mocks ever)
- ✅ Type safety (prevents bugs)
- ✅ Core functionality (must work)
- ✅ Data integrity (don't corrupt data)
- ✅ Security basics (auth, validation)

## Decision Framework

### When Adding Any Feature

Ask:

1. **Does this solve the core problem?** No → Cut it
2. **Can users live without it initially?** Yes → Next version
3. **Will this delay shipping?** Yes → Simplify or cut
4. **Is there a faster alternative?** Yes → Use it
5. **Can we add it later?** Yes → Add it later

### When Choosing Technology

Ask:

1. **Can I build this in 1-2 days?** No → Pick simpler tech
2. **Have I used this before?** No → Risky, consider alternatives
3. **Is setup complex?** Yes → Pick easier option
4. **Does it have good docs/examples?** No → Risky choice
5. **Can I deploy easily?** No → Deal-breaker

## Examples

### ✅ Good MVP

```typescript
// Simple, works, deployable today
import { NextRequest, NextResponse } from 'next/server'

export async function POST(req: NextRequest) {
  const { email } = await req.json()
  await db.users.create({ email })
  return NextResponse.json({ success: true })
}
```

### ❌ Not MVP

```typescript
// Over-engineered, delays shipping
import { injectable } from 'inversify'
@injectable()
class UserService implements IUserService {
  constructor(
    @inject(TYPES.Repository) private repo: IUserRepository,
    @inject(TYPES.Validator) private validator: IValidator,
    @inject(TYPES.Logger) private logger: ILogger
  ) {}
  // ... 200 lines of abstraction
}
```

## Remember

**Ship a working MVP today, not a perfect product next month.** **Real data,
real users, real value - everything else is negotiable.** **Cut ruthlessly, ship
quickly, iterate based on real feedback.**
