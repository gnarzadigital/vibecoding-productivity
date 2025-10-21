---
description: 'CRITICAL: Never use mock, synthetic, or placeholder data'
globs:
  - '**/*'
alwaysApply: true
---

# CRITICAL RULE: No Mock Data Policy

## Absolute Prohibition on Fake Data

**NEVER, under ANY circumstances, use:**

- ❌ Mock data
- ❌ Synthetic data
- ❌ Placeholder data
- ❌ Fake data
- ❌ Lorem ipsum text
- ❌ Example data
- ❌ Dummy data
- ❌ Test fixtures with fake values

## This Applies To ALL Phases

### ❌ Development

- NO mock APIs
- NO fake database seeds
- NO placeholder user accounts
- NO synthetic responses

### ❌ Testing

- NO test fixtures with fake data
- NO mocked API responses with fake values
- NO placeholder test data
- Tests MUST use real data sources

### ❌ Demos/MVPs

- NO fake user data
- NO synthetic metrics
- NO placeholder content
- Everything must be real and production-ready

## ✅ What You MUST Do Instead

### For Development

```typescript
// ❌ WRONG - Mock data
const mockUser = {
  id: 1,
  name: 'John Doe',
  email: 'john@example.com',
}

// ✅ CORRECT - Real data source
const user = await db.users.findFirst()
// Or use actual API
const user = await api.getCurrentUser()
```

### For Testing

```typescript
// ❌ WRONG - Synthetic test data
test('user profile', () => {
  const fakeUser = { name: 'Test User', email: 'test@test.com' }
  expect(renderProfile(fakeUser)).toBeDefined()
})

// ✅ CORRECT - Real data from test database
test('user profile', async () => {
  const realUser = await testDb.users.findFirst()
  expect(renderProfile(realUser)).toBeDefined()
})
```

### For Seeding

```typescript
// ❌ WRONG - Fake seed data
await db.products.createMany([
  { name: 'Product 1', price: 99.99 },
  { name: 'Product 2', price: 149.99 },
])

// ✅ CORRECT - Scrape/import real data
const realProducts = await scraper.fetchFromSource('https://...')
await db.products.createMany(realProducts)
```

## Why This Matters

1. **Production Parity**: Fake data hides real-world edge cases
2. **Real Validation**: Only real data reveals actual problems
3. **True Performance**: Synthetic data doesn't reflect actual data shapes/sizes
4. **Immediate Value**: MVP must work with real data from day one

## Approved Data Sources

### ✅ Always Acceptable

- Real user input
- Live API responses
- Scraped public data
- Open datasets (Kaggle, data.gov, etc.)
- Production database snapshots
- Real file uploads
- Actual third-party integrations

### ⚠️ Use With Caution

- Anonymized production data (ensure privacy compliance)
- Sampled subsets of real data
- Cached real API responses (with refresh mechanism)

## Exception Handling

**If you absolutely cannot get real data:**

1. **STOP** - Don't proceed with fake data
2. **Document** - Explain why real data is unavailable
3. **Plan** - Create immediate task to obtain real data
4. **Alternative** - Find a different real data source
5. **Ask** - Get explicit approval before using ANY non-real data

## Enforcement

- Code review MUST reject any mock data
- Tests MUST fail if using fake data
- CI/CD MUST block placeholder content
- Documentation MUST specify real data sources

## Examples of Real Data Sources

### APIs

```typescript
// Use real public APIs
const weather = await fetch('https://api.openweathermap.org/...')
const news = await fetch('https://newsapi.org/v2/...')
const github = await fetch('https://api.github.com/...')
```

### Datasets

```typescript
// Import real datasets
import { realUserData } from './datasets/kaggle-users.json'
import { stockPrices } from './datasets/yahoo-finance.csv'
```

### Web Scraping

```typescript
// Scrape real websites (respect robots.txt)
const products = await scrapeEcommerce('https://...')
const listings = await scrapeRealEstate('https://...')
```

### Public Databases

```typescript
// Use open data sources
const census = await fetch('https://data.census.gov/...')
const covid = await fetch('https://disease.sh/v3/covid-19/...')
```

## Remember

**Every piece of data in this project MUST be real.** **No exceptions. No
compromises. No shortcuts.**

If you're tempted to use fake data, STOP and find real data instead. This is
non-negotiable for building production-ready software.
