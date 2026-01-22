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

**Deferred (Nice to Have)**
- Catcher mode
- Speed bonus system
- Famous dogs / kid unlocks
- Multiple locations
- Endless mode

### Priority Order (Updated)

1. **Prototype Validation** - Greybox throw, playtest, confirm fun
2. **Dev Environment** - Godot setup, iOS pipeline (parallel with prototype)
3. **Core Functionality** - Game loop, throwing, catching, scoring
4. **Child-Friendly Features** - Relaxed mode, tutorial, soft failure
5. **Game Feel** - Juice, particles, animations
6. **Level Flow** - Menu, level select, results, progression
7. **Visual Polish** - Art, animations, locations
8. **Audio** - Sound effects, music
9. **Extra Features** - Unlockables, catcher mode enhancements

### Not Ready Yet

The following items should NOT be started until prerequisites are complete:

- Art/audio creation (needs style guide AND prototype validation first)
- Level design beyond level 1-3 (needs core mechanics validated first)
- iPad support (needs iPhone working first)
- Catcher mode (needs Thrower mode complete first)
- Kid-friendly unlocks (needs base unlock system first)
- Endless mode (needs core game complete first)
- Location narrative (needs multiple locations first)

### Open Questions / Blockers

1. **Prototype feedback** - Does throwing treats feel fun? Only playtesting will answer.
2. **Relaxed vs Challenge** - Should Challenge mode be hidden until unlocked, or always visible?

### Backlog Statistics (Updated)

| Initiative | ID | Open Epics | Open Stories |
|------------|-----|------------|--------------|
| Foundation | bd-f001 | 3 | 10 |
| Core Engine | bd-c001 | **5** | **18** |
| Thrower Mode | bd-t001 | 4 | 11 |
| Catcher Mode | bd-d001 | **5** | **14** |
| Content/Progression | bd-p001 | **9** | **27** |
| Art/Audio | bd-a001 | 8 | 22 |
| Infrastructure | bd-i001 | 5 | 12 |
| iPad Support | bd-ipad | 2 | 6 |
| **Game Design Validation** | **bd-g001** | **5** | **30** |
| **Total** | | **46** | **150** |

*+10 epics, +47 stories from game design validation*

### Reference Documents
- `docs/game-design-parameters.md` - All gameplay numbers (NEEDS UPDATE)
- `docs/color-reference.md` - Color palette with hex codes
- `docs/adrs/` - Architecture Decision Records (all Accepted)
