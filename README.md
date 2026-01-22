# Feed the Pups

A casual mobile game for iOS where players throw treats to hungry dogs. Built with Godot 4, designed for children ages 7+.

## Game Concept

**Thrower Mode:** Dogs pop up around the scene waiting for treats. Swipe to throw treats to feed them before they wander off. Build streaks for bonus points!

**Catcher Mode (Post-MVP):** Control a dog to catch falling treats. Move left and right, jump to catch high treats, and bark to scare away the treat-stealing mouse.

## Target Audience

- **Primary:** Children aged 7+
- **Secondary:** Parents playing with children
- **Design Philosophy:** Large touch targets, simple controls, forgiving timing, no harsh "game over" states

## Tech Stack

| Component | Choice |
|-----------|--------|
| Engine | Godot 4 |
| Platform | iOS (iPhone + iPad) |
| Min iOS | iOS 26+ |
| Orientation | Landscape only |
| Data Storage | Local JSON (no backend) |

## Project Status

**Phase:** Planning Complete, Ready for Prototype

The backlog contains 250+ stories across 10 initiatives. The next step is building a greybox prototype to validate that the core throwing mechanic is fun.

## Project Structure

```
feed-the-pups/
├── beads/                      # Backlog (JSONL format)
│   ├── backlog-index.jsonl     # Quick overview (initiatives + epics)
│   ├── bd-f001.jsonl           # Foundation
│   ├── bd-c001.jsonl           # Core Game Engine
│   ├── bd-t001.jsonl           # Thrower Mode
│   ├── bd-d001.jsonl           # Catcher Mode (post-MVP)
│   ├── bd-p001.jsonl           # Content & Progression
│   ├── bd-a001.jsonl           # Art & Audio
│   ├── bd-i001.jsonl           # Infrastructure
│   ├── bd-g001.jsonl           # Game Design Validation
│   ├── bd-ipad.jsonl           # iPad Support
│   ├── bd-chore001.jsonl       # Maintenance
│   ├── current-focus.md        # Session handoff notes
│   └── archive/                # Archived files
├── docs/
│   ├── game-design-parameters.md   # Gameplay numbers
│   ├── color-reference.md          # Art color palette
│   └── adrs/                       # Architecture Decision Records
└── .claude/                    # Claude Code configuration
```

## Initiatives

| ID | Initiative | Priority | Status |
|----|------------|----------|--------|
| bd-f001 | Foundation | 0 | Open |
| bd-g001 | Game Design Validation | 0 | Open |
| bd-c001 | Core Game Engine | 0 | Open |
| bd-t001 | Thrower Mode | 0 | Open |
| bd-a001 | Art & Audio | 1 | Open |
| bd-p001 | Content & Progression | 1 | Open |
| bd-i001 | Infrastructure | 2 | Open |
| bd-ipad | iPad Support | 2 | Open |
| bd-d001 | Catcher Mode | 3 | Deferred (post-MVP) |

## Game Design Highlights

### Child-Friendly Features
- **Relaxed Mode:** No timer pressure, dogs wait patiently
- **Soft Failure:** All levels completable regardless of score
- **Generous Hitboxes:** Near-misses count as catches
- **Encouraging Messages:** "The dogs are still hungry!" not "You failed"

### Gameplay Parameters
| Parameter | Value |
|-----------|-------|
| Level duration | 60-90 seconds |
| Star thresholds | 40% / 65% / 85% |
| Dog visibility | 4.0s (L1) → 2.5s (L10) |
| Dogs on screen | 1 (L1) → 5 (L10) |

### Locations (10 Levels)
1. Kitchen
2. Backyard
3. Paris
4. Texas
5. Italy
6. New York City
7. Inside a Train
8. At the Beach
9. At the Pool
10. Thanksgiving Table (bonus)

## Art Style

Cartoon style inspired by Bluey and Angry Birds.

| Color | Hex | Usage |
|-------|-----|-------|
| Sky Blue | #5DADE2 | Backgrounds, UI |
| Grass Green | #58D68D | Outdoor scenes |
| Sunshine Yellow | #F7DC6F | Stars, highlights |
| Warm Orange | #F39C12 | Treats |
| Charcoal | #2C3E50 | Text, outlines |

See [docs/color-reference.md](docs/color-reference.md) for the complete palette.

## Architecture Decisions

Key decisions are documented in ADRs:

- **ADR-001:** Godot 4 (open source, GDScript, good iOS support)
- **ADR-002:** iOS-only (simplify scope, target device known)
- **ADR-003:** Local storage only (no AWS needed for MVP)
- **ADR-004:** Hybrid art pipeline (AI + manual touchup)
- **ADR-005:** JSON file persistence (simple, debuggable)
- **ADR-006:** Local photo storage (no cloud upload)
- **ADR-007:** Hybrid audio (record dogs + free libraries)

See [docs/adrs/](docs/adrs/) for full details.

## Working with the Backlog

The backlog uses JSONL format split across multiple files for easier reading.

**For a quick overview:**
```bash
# Read the index (initiatives and epics only)
cat beads/backlog-index.jsonl | jq -r '.title'
```

**For detailed stories:**
```bash
# Read a specific initiative
cat beads/bd-t001.jsonl | jq -r '.title'
```

**Session handoff:**
```bash
# Check current focus and blockers
cat beads/current-focus.md
```

## MVP Definition

Minimum to show to target user (7-year-old):

**Must Have:**
- Thrower mode with Relaxed Mode option
- Tutorial for first-time players
- Streak bonus scoring
- Star ratings (1-3 treats)
- At least 3 playable levels
- Kitchen background
- 1 dog breed with animations
- Mouse on miss
- Menu, level select, results screens

**Should Have:**
- Screen shake and particles on catch
- Floating score numbers
- Satisfying chomp sounds
- Quick replay button

**Deferred:**
- Catcher mode
- Multiple locations
- Unlockable dogs and accessories
- iPad optimization

## Next Steps

1. **Set up Godot 4 + iOS pipeline** (bd-f001.1)
2. **Build greybox prototype** (bd-g001.1)
3. **Playtest with target user** (bd-g001.1.4)
4. If fun is validated, proceed with full implementation

## License

Private project. Not open source.
