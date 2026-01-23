# Feed the Pups - Current Focus

## Session Date: 2026-01-22

## Project Status: Game State Management Complete

### What Was Accomplished This Session

**Game Design Validation (bd-g001):**
- **bd-g001.1** (Epic): Core Loop Prototype - **CLOSED**
  - bd-g001.1.1-1.4: Prototype, dog target, timer, playtesting - all closed
  - Core loop validated as fun!
- **bd-g001.6.1-6.3**: Session pacing defined - **CLOSED**
  - 60-second fixed level duration with rationale
  - Spawn cadence: 5.0s (L1) → 3.2s (L10)
  - Catch opportunities: 10-12 (early) → 15-18 (late)
  - Dog visibility windows increased: 4.0s → 2.5s (child-friendly)

**Core Game Engine (bd-c001):**
- **bd-c001.1** (Epic): Game State Management - **CLOSED**
  - bd-c001.1.1: GameManager autoload with state machine, scene transitions, progress persistence
  - bd-c001.1.2: Main menu scene with Play and Level Select
  - bd-c001.1.3: Level select scene with 10-level grid, stars, locks
  - bd-c001.1.4: Pause overlay with Resume, Restart, Menu
  - bd-c001.1.5: Results scene with score, stars, encouraging messages

**Architecture:**
- **ADR-008**: Scene Structure (Hybrid Scenes + Overlays) - created and accepted

### New Project Structure

```
game/
├── game_manager.gd         # Autoload singleton (state, transitions, progress)
├── scenes/
│   ├── main_menu.tscn/gd   # Entry point
│   ├── level_select.tscn/gd # Level grid
│   ├── gameplay.tscn/gd    # Core gameplay (refactored from prototype)
│   └── results.tscn/gd     # End-of-level results
├── dog.tscn/gd             # Dog entity
├── treat.tscn/gd           # Treat projectile
└── assets/
    └── backgrounds/        # Kitchen, Paris, Texas backgrounds
```

### Technical Notes

| Component | Implementation |
|-----------|---------------|
| State Machine | GameManager.GameState enum with signals |
| Scene Transitions | Preloaded PackedScenes for instant transitions |
| Progress Persistence | JSON file at user://progress.json |
| Pause Handling | CanvasLayer overlay with process_mode=ALWAYS |
| Star Calculation | Accuracy-based: 40%=1★, 65%=2★, 85%=3★ |

### Recommended Next Item

**bd-c001.2: Touch Input System** or **bd-c001.3: Physics and Collision**

Both are priority 0 in Core Game Engine. The prototype already has basic implementations of both. Options:
1. **Polish touch input** - refine swipe detection, add tap-to-throw accessibility
2. **Polish physics** - tune trajectory, add generous hitboxes per bd-g001.5.4

Alternatively, focus on **art integration** since Texas and Paris backgrounds are ready.

### Setup for New Session

The game now starts at `scenes/main_menu.tscn`. To test:
1. Open project in Godot
2. Press F5 or click Play
3. Click "Play" for quick start or "Select Level" for level grid

### Not Ready Yet

- Art/audio creation beyond backgrounds (needs more sprites)
- iPad support (needs iPhone working first)
- Catcher mode (DEFERRED TO POST-MVP)
- Tutorial system (needs core gameplay polished first)

### Open Questions / Blockers

1. **Test on device** - Game runs in editor but needs iOS device testing
2. **Background integration** - Texas/Paris backgrounds added but not wired to levels yet
