# ADR-003: Backend Architecture

## Status
Accepted

## Date
2026-01-21

## Context

We need to decide whether "Feed the Pups" requires backend services, and if so, which AWS services to use.

Potential backend needs:
- **Photo storage** for uploaded dog avatars (if cloud sync desired)
- **Save game sync** across devices (if desired)
- **Analytics** (if desired)
- **Leaderboards** (if desired in future)

Key constraints:
- Minimal budget (prefer pay-per-use)
- Existing AWS account available
- Game requires internet connection (per requirements)
- No multiplayer initially

## Decision

**Option A: Local-Only Storage**

All data will be stored on device. No AWS services needed for MVP.

### What this means:
- All data stored on device using Godot's `user://` directory
- No AWS services needed initially
- Simplest and cheapest ($0)
- Photo avatar stored locally
- Cannot sync between devices (acceptable for learning project)

### Rejected Options:

**Option B: Minimal AWS (S3 only)** - Adds complexity for minimal benefit in a learning project.

**Option C: AWS with Lambda + S3** - Overkill for current scope.

## Consequences

### Positive
- Zero hosting costs
- No network dependencies for core gameplay
- Simpler implementation
- No privacy concerns with photo storage
- Faster development

### Negative
- No cross-device sync (if user gets new phone, progress lost)
- No cloud backup of photos
- Cannot add leaderboards without future backend work

### Mitigation
If cloud features become important later, we can add AWS backend as a new initiative. The local storage implementation won't need to change significantly.

## Cost Analysis

| Service | Free Tier | Beyond Free Tier |
|---------|-----------|------------------|
| S3 | 5GB storage, 20K GET, 2K PUT/month | $0.023/GB/month |
| Lambda | 1M requests, 400K GB-seconds/month | $0.20/1M requests |
| API Gateway | 1M calls/month (12 months) | $3.50/1M calls |

For a personal learning project with minimal usage, AWS costs should be <$1/month after free tier.

## Recommendation

**Option A (Local-Only)** for initial development. We can add cloud features later if needed. The game doesn't require cloud sync for the MVP, and keeping things local simplifies development significantly.

## Alternatives Considered

- **Firebase:** Good free tier but adds Google dependency
- **Supabase:** PostgreSQL-based, overkill for this use case
- **Self-hosted:** Too much operational overhead

## References
- [AWS Free Tier](https://aws.amazon.com/free/)
- [S3 Pricing](https://aws.amazon.com/s3/pricing/)
