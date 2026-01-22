# ADR-005: Data Persistence Strategy

## Status
Accepted

## Date
2026-01-21

## Context

We need to decide how to save game progress, including:
- Level completion and star ratings
- Unlocked items (treats, hats, famous dogs)
- Player settings (sound on/off, etc.)
- Uploaded dog photo avatar

Constraints:
- Game requires internet (but could work offline for basic play)
- Minimal backend desired
- Single device focus (no cross-device sync needed initially)

## Decision

**[TO BE DECIDED]**

Options under consideration:

### Option A: Godot Built-in (ConfigFile/ResourceSaver)
- Use Godot's ConfigFile for simple key-value data
- Store in user:// directory (iOS app sandbox)
- **Pros:** Simple, no dependencies, works offline
- **Cons:** No backup, lost if app deleted
- **Best for:** Settings, simple progress

### Option B: JSON File
- Serialize game state to JSON
- Store in user:// directory
- **Pros:** Human-readable, easy to debug, flexible schema
- **Cons:** No built-in encryption, manual serialization
- **Best for:** Complex nested data structures

### Option C: SQLite
- Use Godot SQLite plugin
- Store in local database
- **Pros:** Structured queries, good for large data
- **Cons:** Overkill for this game, adds dependency
- **Best for:** Games with inventory systems, complex relationships

### Option D: iCloud (via iOS plugin)
- Sync to iCloud automatically
- **Pros:** Backup, cross-device sync
- **Cons:** Requires iOS plugin, more complex, may need paid Apple account
- **Best for:** If cross-device sync becomes important

## Recommendation

**Option B (JSON File)** - Simple, flexible, easy to debug. Store a single `save_data.json` in the user directory with structure:

```json
{
  "version": 1,
  "levels": {
    "1": {"completed": true, "stars": 3},
    "2": {"completed": true, "stars": 2}
  },
  "unlocks": {
    "treats": ["basic", "bone"],
    "hats": ["none"],
    "dogs": ["default"]
  },
  "settings": {
    "sound_enabled": true,
    "music_enabled": true
  },
  "avatar_path": "user://avatar.png"
}
```

## Consequences

[To be filled after decision]

## References
- [Godot File System](https://docs.godotengine.org/en/stable/tutorials/io/data_paths.html)
- [Godot ConfigFile](https://docs.godotengine.org/en/stable/classes/class_configfile.html)
