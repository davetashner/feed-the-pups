# Feed the Pups - Current Focus

## Session Date: 2026-01-21

## Project Status: Dev Environment Complete, Ready for Prototype

### What Was Accomplished This Session

- **bd-f001.1.1**: Installed Godot 4.5.1 via Homebrew with iOS export templates
- **bd-f001.1.2**: Configured Xcode 26.2 with personal development team
- **bd-f001.1.3**: Created minimal Godot project, runs successfully in editor
- **bd-f001.1** (Epic): Development Environment Setup - **CLOSED**

### Technical Notes

| Component | Version/Status |
|-----------|---------------|
| Godot | 4.5.1 (`/Applications/Godot.app`) |
| Xcode | 26.2 |
| iOS Export Templates | Installed in `~/Library/Application Support/Godot/export_templates/4.5.1.stable/` |
| Team ID | Configured in `export_presets.cfg` (not committed - use template) |

### Known Limitations

**iOS Simulator on Apple Silicon:**
- Godot's official iOS export templates only include x86_64 for simulator
- Apple Silicon Macs require arm64 simulator binaries
- **Workaround**: Test in Godot editor during development, use physical iOS device for iOS-specific testing
- This does not block prototype development

### Project Structure

```
game/
├── project.godot          # Godot project config
├── main.tscn              # Main scene ("Feed the Pups!" label)
├── icon.svg               # App icon
├── export_presets.cfg     # iOS export config (gitignored - contains Team ID)
├── export_presets.cfg.template  # Template for export config
├── .gitignore             # Ignores .godot/, ios_build/, export_presets.cfg
└── .godot/                # Godot cache (gitignored)
```

### Recommended Next Item

**bd-g001.1.1: Create greybox throw prototype**

This is the first prototype task:
- Build minimal throw mechanic with placeholder art (colored rectangles)
- Swipe to throw a "treat" toward a "dog" target area
- No final art needed - placeholders only

**Acceptance Criteria:**
- Can swipe to throw
- Treat arcs toward target
- Placeholder graphics only

### Setup for New Session

If starting fresh, copy the export preset template:
```bash
cd game
cp export_presets.cfg.template export_presets.cfg
# Edit export_presets.cfg and replace YOUR_TEAM_ID_HERE with your Team ID
```

### Not Ready Yet

The following items should NOT be started until prerequisites are complete:

- Art/audio creation (needs style guide AND prototype validation first)
- Level design beyond level 1-3 (needs core mechanics validated first)
- iPad support (needs iPhone working first)
- Catcher mode (DEFERRED TO POST-MVP)
- iOS simulator testing (blocked by Godot template limitation - use physical device)

### Open Questions / Blockers

1. **Prototype feedback** - Does throwing treats feel fun? Only playtesting will answer.
2. **iOS device testing** - When ready for device testing, will need to configure signing properly.

### Backlog Statistics (Updated)

| Initiative | ID | Status |
|------------|-----|--------|
| Foundation | bd-f001 | 1 epic closed, 2 epics open |
| Game Design Validation | bd-g001 | Ready to start prototype |

**Completed this session:** 4 items (1 epic + 3 tasks)
