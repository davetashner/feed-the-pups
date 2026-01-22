# Feed the Pups - Current Focus

## Session Date: 2026-01-21

## Project Status: Planning Complete + Game Design Validation Added

### What Was Accomplished This Session
- Created comprehensive backlog with 8 initiatives, 35+ epics, and 100+ stories
- Established game design decisions through Q&A with stakeholder
- Selected technology stack (Godot 4, iOS 26+, landscape orientation)
- Created color reference guide (Bluey/Angry Birds inspired)
- Created game design parameters document
- Accepted all 7 ADRs
- **NEW: Added Game Design Validation initiative with 50+ new stories**
- **NEW: Prioritized early prototyping over documentation**
- **NEW: Added child-friendly accessibility features**

### Game Design Validation Changes (NEW)

The following changes were added based on expert game design review:

| Change | Purpose |
|--------|---------|
| Core Loop Prototype (bd-g001.1) | Validate fun before heavy investment |
| Tutorial System (bd-g001.2) | Guide young children through first play |
| Relaxed Mode (bd-g001.3) | Remove timer stress for young players |
| Game Feel/Juice (bd-g001.4) | Make catches satisfying with effects |
| Child-Friendly Difficulty (bd-g001.5) | Forgiving thresholds and generous hitboxes |
| Soft Failure (bd-c001.5) | No "game over", always complete levels |
| Kid-Friendly Unlocks (bd-p001.7) | Costumes/fantasy dogs vs. famous dogs |
| Location Narrative (bd-p001.8) | Story framing for world tour locations |
| Enhanced Catcher Mode (bd-d001.5) | Jump, bark, dog-themed obstacles |
| Endless Mode (bd-p001.9) | Replay value after completing all levels |

### Key Decisions Made

| Category | Decision |
|----------|----------|
| Engine | Godot 4 |
| Platform | iOS 26+ (iPhone + iPad) |
| Orientation | Landscape only |
| Art Style | Cartoon (Bluey/Angry Birds), see `docs/color-reference.md` |
| Backend | Local storage only (no AWS) |
| Data Format | JSON file in user directory |
| Art Pipeline | Hybrid (AI + assets) |
| Audio | Hybrid (record dogs + free libraries) |

### Updated Game Design Parameters

| Parameter | Original | Updated |
|-----------|----------|---------|
| Star thresholds | 50% / 75% / 90% | **40% / 65% / 85%** |
| Dog visibility (start) | 3.0 seconds | **4.0 seconds** |
| Dog visibility (end L10) | 1.5 seconds | **2.5 seconds** |
| Default mode | Timed | **Relaxed (no timer)** |
| Speed bonus | Active | **Hidden/deferred for MVP** |
| Streak bonus | 2x at 5 catches | 2x at 5 catches (unchanged) |
| Level completion | Required score | **Any score completes level** |

See `docs/game-design-parameters.md` for complete parameters (needs updating).

### Locations (10 Levels)

Grouped thematically with narrative framing ("Dream Adventures"):

**Home (Levels 1-2)**
1. Kitchen
2. Backyard

**Dream Adventures (Levels 3-9)**
3. Paris
4. Texas
5. Italy
6. New York City
7. Inside a Train
8. At the Beach
9. At the Pool

**Special (Level 10)**
10. Thanksgiving Table (bonus)

### Updated Recommended Next Item

**bd-g001.1.1: Create greybox throw prototype**

This is now the logical starting point because:
1. Validates core fun before building everything else
2. Only requires dev environment setup (bd-f001.1) as prerequisite
3. Uses placeholder art - no need for style guide first
4. Provides actionable feedback within days, not weeks

**Sequence:**
1. bd-f001.1.1-1.3: Set up Godot + iOS pipeline
2. bd-g001.1.1-1.4: Build and playtest greybox prototype
3. THEN proceed with architecture/documentation if prototype validates fun

### MVP Definition (Updated)

Minimum to show to daughter (age 7):

**Core (Must Have)**
- Thrower mode with Relaxed Mode option
- Tutorial for first-time players
- Scoring with streak bonus only
- Star ratings (1-3 treats) with forgiving thresholds
- Generous catch hitboxes
- At least 3 playable levels
- Kitchen background minimum
- 1 dog breed minimum (with anticipation animation)
- Basic treat sprite
- Mouse on miss
- Main menu, level select, results screens
- No "fail" state - all levels completable

**Polish (Should Have)**
- Screen shake and particle effects on catch
- Floating score numbers
- Encouraging messages for low scores
- Trajectory preview assist
- **Satisfying chomp sounds (elevated to critical)**
- **Streak celebration sounds**
- Quick replay button on results

**Deferred (Nice to Have)**
- **Catcher mode (explicitly post-MVP)**
- Speed bonus system
- Famous dogs / kid unlocks
- Multiple locations beyond 3
- Endless mode
- Free Play mode
- Dog personality system (adds variety but not required for MVP)
- Shareable score cards

### Priority Order (Updated)

1. **Prototype Validation** - Greybox throw, playtest, confirm fun
2. **Dev Environment** - Godot setup, iOS pipeline (parallel with prototype)
3. **Core Functionality** - Game loop, throwing, scoring, session pacing
4. **Child-Friendly Features** - Relaxed mode, tutorial, soft failure
5. **Game Feel & Audio** - Juice, particles, **sound effects (critical!)**
6. **Dog Personality** - Variety through different dog behaviors
7. **Level Flow** - Menu, level select, results, unlock previews
8. **Visual Polish** - Art, animations, locations
9. **Engagement Hooks** - Quick replay, star preview, celebrations
10. **Extra Features** - Free Play, unlockables, shareable moments
11. **Post-MVP** - Catcher mode, Endless mode, iPad support

### Not Ready Yet

The following items should NOT be started until prerequisites are complete:

- Art/audio creation (needs style guide AND prototype validation first)
- Level design beyond level 1-3 (needs core mechanics validated first)
- iPad support (needs iPhone working first)
- **Catcher mode (DEFERRED TO POST-MVP - focus on Thrower first)**
- Kid-friendly unlocks (needs base unlock system first)
- Endless mode (needs core game complete first)
- Location narrative (needs multiple locations first)
- Free Play mode (needs basic Thrower mechanics first)
- Dog Personality System (needs basic dog behavior first)
- Shareable Moments (needs results screen first)

### Open Questions / Blockers

1. **Prototype feedback** - Does throwing treats feel fun? Only playtesting will answer.
2. **Relaxed vs Challenge** - Should Challenge mode be hidden until unlocked, or always visible?

### Game Design Review Updates (2026-01-21)

Expert game design review added the following improvements:

| Addition | ID | Purpose |
|----------|-----|---------|
| Session Length & Pacing | bd-g001.6 | 60-90s levels, spawn cadence, quick replay |
| Free Play Mode | bd-g001.7 | No-pressure sandbox for pure fun |
| Dog Personality System | bd-t001.5 | Variety through impatient/greedy/sleepy dogs |
| One-More-Round Hooks | bd-g001.4.9-11 | Near-miss prompts, star preview, celebrations |
| Unlock Cadence | bd-p001.7.6-7 | Something every 1-2 levels, preview on level select |
| Perfect Feed Celebration | bd-g001.3.7 | Big payoff for flawless rounds |
| Difficulty Milestones | bd-p001.3.4 | Documented expected success rates |
| Shareable Moments | bd-i001.6 | Score card screenshots to photo roll |
| Coming Soon Preview | bd-p001.1.6 | Anticipation for future levels |
| Audio Enhancements | bd-a001.7.6-8 | Chomp sounds, streak sounds, per-breed sounds |

**Priority Changes:**
- Sound Effects (bd-a001.7) elevated to **priority 0** (critical)
- Catcher Mode (bd-d001) deferred to **priority 3** (post-MVP)

### Backlog Statistics (Updated)

| Initiative | ID | Open Epics | Open Stories |
|------------|-----|------------|--------------|
| Foundation | bd-f001 | 3 | 10 |
| Core Engine | bd-c001 | **5** | **18** |
| Thrower Mode | bd-t001 | **5** | **15** |
| Catcher Mode | bd-d001 | 5 | 14 *(post-MVP)* |
| Content/Progression | bd-p001 | **10** | **30** |
| Art/Audio | bd-a001 | 8 | **26** |
| Infrastructure | bd-i001 | **6** | **14** |
| iPad Support | bd-ipad | 2 | 6 |
| **Game Design Validation** | **bd-g001** | **7** | **41** |
| **Total** | | **51** | **174** |

*+5 epics, +24 stories from game design review*

### Backlog Maintenance (COMPLETED)

**Problem:** `backlog.jsonl` was ~28K tokens, exceeding the 25K read limit.

**Solution (implemented):** Split into per-initiative files + lightweight index:
```
beads/
├── backlog-index.jsonl    # 61 entries - initiatives & epics only
├── bd-f001.jsonl          # 16 entries - Foundation
├── bd-c001.jsonl          # 25 entries - Core Engine
├── bd-t001.jsonl          # 21 entries - Thrower Mode
├── bd-d001.jsonl          # 19 entries - Catcher Mode (post-MVP)
├── bd-p001.jsonl          # 46 entries - Content/Progression
├── bd-a001.jsonl          # 36 entries - Art/Audio
├── bd-i001.jsonl          # 24 entries - Infrastructure
├── bd-g001.jsonl          # 48 entries - Game Design
├── bd-ipad.jsonl          #  8 entries - iPad Support
├── bd-chore001.jsonl      #  7 entries - Maintenance
└── archive/
    └── backlog.jsonl      # Original monolithic file (archived)
```

CLAUDE.md has been updated with new reading instructions.

### Reference Documents
- `docs/game-design-parameters.md` - All gameplay numbers (NEEDS UPDATE)
- `docs/color-reference.md` - Color palette with hex codes
- `docs/adrs/` - Architecture Decision Records (all Accepted)
