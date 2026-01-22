# ADR-006: Photo Upload Implementation

## Status
Accepted

## Date
2026-01-21

## Context

Users should be able to upload a photo of their dog to use as a circular avatar in the game.

Requirements:
- Select photo from iOS photo library
- Crop to circular shape
- Display as avatar in game UI
- Persist between sessions

Constraints:
- iOS only
- Minimal backend (prefer local storage)
- Simple implementation (Option A from earlier discussion)

## Decision

**[TO BE DECIDED]**

Implementation approach:

### Photo Selection
- Use Godot iOS plugin or native bridge to access iOS photo picker
- Request photo library permission
- Let user select single image

### Cropping
Options:
1. **Simple center crop** - Take center square, mask to circle in-game
2. **Interactive crop** - Let user position crop area (more complex)
3. **No crop** - Scale and mask entire photo to circle

**Recommendation:** Option 1 (center crop) for simplicity

### Storage
- Save cropped image to `user://avatar.png`
- Reference path in save data JSON
- Load on game start if exists

### Display
- Show circular masked sprite in:
  - Main menu corner
  - Level select screen
  - Results screen
- Use shader or mask for circular display

## Technical Approach

```gdscript
# Pseudocode for photo handling
func on_photo_selected(image: Image):
    # Resize to reasonable size (256x256)
    image.resize(256, 256)

    # Save to user directory
    image.save_png("user://avatar.png")

    # Update in-game display
    update_avatar_display()
```

## iOS Permissions Required

Add to export settings / Info.plist:
- `NSPhotoLibraryUsageDescription`: "Select a photo of your dog to use as your avatar"

## Consequences

[To be filled after implementation]

## Future Enhancement (Deferred)

AI cartoonification (Option C from discussion) could be added later:
- Send photo to AI service API
- Receive cartoon-style version
- Cost: $0.01-0.05 per image
- Requires backend or direct API call

## References
- [Godot iOS Plugins](https://docs.godotengine.org/en/stable/tutorials/platform/ios/ios_plugins.html)
- [iOS Photo Library Permission](https://developer.apple.com/documentation/photokit)
