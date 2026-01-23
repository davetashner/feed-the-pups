# Feed the Pups - Current Focus

## Session Date: 2026-01-22

## Project Status: Dog Spawning System In Progress

### What Was Accomplished This Session

**Treat Throwing Mechanics (bd-t001.1):**
- bd-t001.1.1: Throw aiming - **CLOSED** (implemented in prototype)
- bd-t001.1.2: Treat release and flight - **CLOSED** (implemented in prototype)

**Dog Spawning System (bd-t001.2) - IN PROGRESS:**
- bd-t001.2.1: Dog spawn positions - **CLOSED**
  - Added `SPAWN_POINTS` dict to GameManager with 3 positions per location
  - Added `get_spawn_point()` with time-seeded RNG
  - Added `get_spawn_points_for_level()` helper
  - Dogs spawn at location-appropriate positions (Y tuned for ground placement)
- bd-t001.2.5: Dog repositioning timer - **CLOSED**
  - Dog repositions every 10 seconds during gameplay
  - Picks a different spawn point (never same as current)
  - Smooth tween transition (0.5s ease-in-out)

### Spawn Points Per Location

| Location | Spawn Points (X, Y) |
|----------|---------------------|
| Kitchen | (1200, 850), (1500, 850), (1750, 850) |
| NYC | (1150, 830), (1450, 830), (1700, 830) |
| Paris | (1150, 820), (1450, 820), (1700, 820) |
| Camping | (1150, 860), (1450, 860), (1700, 860) |
| Ashland | (1150, 850), (1450, 850), (1700, 850) |
| Cave | (1150, 870), (1450, 870), (1700, 870) |
| Texas | (1100, 880), (1400, 880), (1700, 880) |
| Italy | (1200, 840), (1500, 840), (1750, 840) |
| Riverside | (1150, 860), (1450, 860), (1700, 860) |

### Level-to-Location Mapping (evolving to 1 background per level)

| Level | Location |
|-------|----------|
| 1 | Kitchen |
| 2 | NYC |
| 3 | Paris |
| 4 | Camping |
| 5 | Ashland |
| 6 | Cave |
| 7 | Italy |
| 8 | Texas |
| 9-10 | Riverside |

### Project Structure

```
game/
├── game_manager.gd         # Autoload singleton (state, transitions, progress, backgrounds, spawn points)
├── scenes/
│   ├── main_menu.tscn/gd   # Entry point
│   ├── level_select.tscn/gd # Level grid
│   ├── gameplay.tscn/gd    # Core gameplay (dynamic backgrounds, dog repositioning)
│   └── results.tscn/gd     # End-of-level results
├── dog.tscn/gd             # Dog entity
├── treat.tscn/gd           # Treat projectile
└── assets/
    └── backgrounds/        # Kitchen, Paris, Texas, Italy, Riverside backgrounds
```

### Recommended Next Items

**Priority 0 (Dog Spawning - continue epic):**
- **bd-t001.2.2: Dog availability window** - Dogs catchable for limited time, window shrinks per level

**Priority 1 (Game Feel & Animation):**
- **bd-g001.4: Game Feel / Juice** - Screen shake, particles, animated feedback
- **bd-t001.2.3: Dog exit animations** - Dogs leave via various animations
- **bd-t001.2.4: Dog catch reaction** - Happy animation/sound on catch

### Setup for New Session

The game now has dogs that reposition every 10 seconds. To test:
1. Open project in Godot
2. Press F5 or click Play
3. Select any level and watch the dog move to a new position every 10 seconds

### Not Ready Yet

- Thanksgiving bonus location (bd-p001.2.4) - needs special mechanics
- Art/audio beyond backgrounds (needs more sprites)
- iPad support (needs iPhone working first)
- Catcher mode (DEFERRED TO POST-MVP)
- Tutorial system (needs core gameplay polished first)

### Open Questions / Blockers

1. **Test on device** - Game runs in editor but needs iOS device testing
2. **Spawn point Y values** - May need tuning based on visual testing with actual backgrounds
3. **Repositioning during throw** - Currently dog can move while a treat is in flight; may want to delay repositioning if treat is airborne
