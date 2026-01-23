# Feed the Pups - Current Focus

## Session Date: 2026-01-22

## Project Status: Location System Complete

### What Was Accomplished This Session

**Touch Input System (bd-c001.2) - CLOSED:**
- bd-c001.2.1: Swipe detection - reviewed and closed (meets all acceptance criteria)
- bd-c001.2.2: Tap detection - closed as "not needed" for MVP
- bd-c001.2.3: Input tuning - closed (feels natural, good thresholds)

**Physics and Collision (bd-c001.3) - CLOSED:**
- bd-c001.3.1: Treat projectile physics - RigidBody2D with gravity, arc trajectory works
- bd-c001.3.2: Collision detection - Dog Area2D catches treats, floor detects misses

**Timer and Scoring (bd-c001.4) - IN PROGRESS:**
- bd-c001.4.1: Level timer - **CLOSED** (60s countdown, red warning)
- bd-c001.4.2: Base scoring - **CLOSED** (100 pts base, score display)
- bd-c001.4.3: Streak bonus - **CLOSED** (3+ streak = +50% per level, visual feedback)
- bd-c001.4.5: Star rating - **CLOSED** (accuracy-based thresholds)
- bd-c001.4.4: Speed bonus - deferred to polish phase

**Soft Failure Handling (bd-c001.5) - CLOSED:**
- bd-c001.5.1: Design approach - no game-over, always complete, encourage retry
- bd-c001.5.2: Level completion regardless of score - timer ends = results screen
- bd-c001.5.3: Encouraging messages - varied positive messages for all star tiers
- bd-c001.5.4: Progressive unlock - next level always unlocks, stars for mastery only

**New Location Added:**
- Riverside (bg_oriental_main.png) - added for levels 9-10

**Location System (bd-p001.2):**
- bd-p001.2.1: Location/background system - **CLOSED**
  - Added `BACKGROUNDS` dict and `get_level_background()` to GameManager
  - `LEVEL_CONFIG` now includes `location` key per level
  - `gameplay.gd` loads background dynamically based on level
- bd-p001.2.2: Kitchen location - **CLOSED**
- bd-p001.2.3: Additional locations - **CLOSED**

**Background Art (bd-a001.4):**
- bd-a001.4.1: Kitchen background - **CLOSED**
- bd-a001.4.2: Additional backgrounds - **CLOSED** (Paris, Texas, Italy)

### Level-to-Location Mapping

| Levels | Location | Background |
|--------|----------|------------|
| 1-2 | Kitchen | bg_kitchen_main.png |
| 3-4 | Paris | bg_paris_main.png |
| 5-6 | Texas | bg_texas_main.png |
| 7-8 | Italy | bg_italy_main.png |
| 9-10 | Riverside | bg_oriental_main.png |

### Project Structure

```
game/
├── game_manager.gd         # Autoload singleton (state, transitions, progress, backgrounds)
├── scenes/
│   ├── main_menu.tscn/gd   # Entry point
│   ├── level_select.tscn/gd # Level grid
│   ├── gameplay.tscn/gd    # Core gameplay (now loads dynamic backgrounds)
│   └── results.tscn/gd     # End-of-level results
├── dog.tscn/gd             # Dog entity
├── treat.tscn/gd           # Treat projectile
└── assets/
    └── backgrounds/        # Kitchen, Paris, Texas, Italy backgrounds
```

### Recommended Next Items

**Core Engine Complete!** All priority 0-1 epics in bd-c001 are now closed.

**Priority 1 (Game Feel & Thrower Mode):**
- **bd-g001.4: Game Feel / Juice** - Screen shake, particles, animated feedback
- **bd-t001.2: Dog Spawning System** - Multiple dogs, spawn positions, visibility windows

**Priority 1 (First-Time Experience):**
- **bd-g001.2: First-Time Experience** - Tutorial hints for new players

### Setup for New Session

The game now shows different backgrounds per level. To test:
1. Open project in Godot
2. Press F5 or click Play
3. Select Level → try levels 1, 4, 6, 8 to see different backgrounds

### Not Ready Yet

- Thanksgiving bonus location (bd-p001.2.4) - needs special mechanics
- Art/audio beyond backgrounds (needs more sprites)
- iPad support (needs iPhone working first)
- Catcher mode (DEFERRED TO POST-MVP)
- Tutorial system (needs core gameplay polished first)

### Open Questions / Blockers

1. **Test on device** - Game runs in editor but needs iOS device testing
2. **Spawn points per location** - Currently dog position is static; may need location-specific spawn points
