# Feed the Pups - Current Focus

## Session Date: 2026-01-22

## Project Status: Location System Complete

### What Was Accomplished This Session

**Touch Input System (bd-c001.2) - CLOSED:**
- bd-c001.2.1: Swipe detection - reviewed and closed (meets all acceptance criteria)
- bd-c001.2.2: Tap detection - closed as "not needed" for MVP
- bd-c001.2.3: Input tuning - closed (feels natural, good thresholds)

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
| 1-3 | Kitchen | bg_kitchen_main.png |
| 4-5 | Paris | bg_paris_main.png |
| 6-7 | Texas | bg_texas_main.png |
| 8-10 | Italy | bg_italy_main.png |

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

**Priority 0 (Core Engine):**
1. **bd-c001.3: Physics and Collision** - Treat physics and collision detection
2. **bd-c001.4: Timer and Scoring** - Formal timer/score system (prototype has basics)

**Priority 1 (Game Feel):**
- **bd-g001.4: Game Feel / Juice** - Screen shake, particles, animated feedback

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
