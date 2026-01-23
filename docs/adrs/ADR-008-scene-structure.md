# ADR-008: Scene Structure for Game States

## Status

Accepted

## Context

The game needs to manage multiple UI states: MainMenu, ModeSelect, LevelSelect, Playing, Paused, and Results. We need to decide how to structure these states in Godot 4.

Key considerations:
- **Target platform:** iOS (iPhone + iPad) with limited memory
- **Target audience:** Children 7+ who need instant, responsive UI
- **Development:** Solo developer needing maintainable architecture
- **Scope:** 10 levels, 2 game modes (Thrower MVP, Catcher post-MVP)

## Decision

**Hybrid approach: Separate scenes for major states, overlays for transient states**

### Major States (Separate Scenes)
- `main_menu.tscn` - Title screen, play button, settings access
- `level_select.tscn` - Level grid with stars and lock states
- `gameplay.tscn` - Active gameplay (refactored from prototype.tscn)
- `results.tscn` - End-of-level score, stars, navigation

### Transient States (Overlays within scenes)
- Pause menu - CanvasLayer overlay in gameplay.tscn
- Settings panel - CanvasLayer overlay (accessible from multiple scenes)
- Tutorial hints - CanvasLayer overlay in gameplay.tscn

### State Management
- **GameManager autoload** - Singleton managing current state, level data, player progress
- **SceneTree.change_scene_to_packed()** - Preloaded scenes for instant transitions
- **Signals** - Decouple scene transitions from game logic

### Scene Transition Flow
```
main_menu.tscn
    ↓ [Play]
level_select.tscn
    ↓ [Level N]
gameplay.tscn ←→ [Pause overlay]
    ↓ [Timer ends]
results.tscn
    ↓ [Next Level] → gameplay.tscn
    ↓ [Menu] → level_select.tscn
    ↓ [Replay] → gameplay.tscn (same level)
```

## Consequences

### Positive
- **Clean separation** - Each major screen is self-contained
- **Memory efficient** - Only active scene loaded (important for mobile)
- **Maintainable** - Easy to modify individual screens
- **Testable** - Can run any scene independently in editor
- **Idiomatic Godot** - Follows standard Godot patterns
- **Instant overlays** - Pause/settings feel responsive (no scene load)

### Negative
- **Scene transitions** - Brief load time between major states (mitigated by preloading)
- **Shared state complexity** - Need autoload singleton for cross-scene data
- **More files** - Multiple .tscn and .gd files to manage

### Neutral
- Requires refactoring prototype.tscn into gameplay.tscn structure

## Alternatives Considered

### Option A: Single Scene with Show/Hide
All UI states in one scene, toggle visibility.

**Pros:** Instant transitions, all UI in editor view
**Cons:** Large complex scene file, all UI in memory, harder to maintain, not idiomatic Godot

**Rejected:** Doesn't scale well for 10+ levels and multiple screens.

### Option B: Fully Separate Scenes (No Overlays)
Every state is its own scene, including pause and settings.

**Pros:** Maximum separation, simple architecture
**Cons:** Pause/settings would require scene change (perceptible delay), loss of gameplay context during pause

**Rejected:** Pause menu should feel instant and not disrupt gameplay state.

### Option C: Scene Stacking
Load new scenes on top without unloading previous.

**Pros:** Can "return" to previous scene state
**Cons:** Memory accumulation, complex scene tree management, Godot 4 doesn't have native scene stack

**Rejected:** Adds complexity without clear benefit for this game's flow.

## Implementation Notes

1. Create `GameManager.gd` autoload first
2. Preload all major scenes in GameManager._ready()
3. Expose scene transition methods: `go_to_main_menu()`, `start_level(level_num)`, etc.
4. Use signals for loose coupling: `level_completed`, `game_paused`, etc.
