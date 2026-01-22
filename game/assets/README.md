# Game Assets

This folder contains all visual and audio assets for Feed the Pups.

## Folder Structure

```
assets/
├── sprites/
│   ├── dogs/          # Dog character sprites and animations
│   ├── treats/        # Treat item sprites
│   ├── mouse/         # Mouse character sprites
│   └── effects/       # Particle effects, sparkles, etc.
├── backgrounds/       # Level background images
├── ui/
│   ├── buttons/       # Button sprites (play, pause, etc.)
│   ├── hud/          # HUD elements (score, timer, streak)
│   └── menus/        # Menu backgrounds and decorations
└── fonts/            # Custom fonts (TTF/OTF)
```

## File Naming Convention

```
[category]_[name]_[variant]_[state].png

Examples:
  dog_golden_idle_01.png
  dog_golden_idle_02.png
  treat_bone_default.png
  bg_kitchen_main.png
  ui_button_play_default.png
  ui_button_play_pressed.png
```

## Specifications

| Asset Type | Base Size | @2x Size | Format |
|------------|-----------|----------|--------|
| Dogs | 256x256 | 512x512 | PNG |
| Treats | 64x64 | 128x128 | PNG |
| Mouse | 128x128 | 256x256 | PNG |
| Backgrounds | 1920x1080 | 3840x2160 | PNG |
| UI Buttons | 80x80+ | 160x160+ | PNG |
| Fonts | - | - | TTF/OTF |

## Importing Assets

1. Place asset files in the appropriate folder
2. Godot will auto-import PNG files
3. For sprites with animation frames, create a SpriteFrames resource
4. Reference assets using `res://assets/...` paths

## Style Guide

See `/docs/art-style-guide.md` for:
- Visual style requirements
- Color palette reference
- Character proportion guidelines
- Animation specifications

## Asset Sources

Current assets may come from:
- **itch.io** - Dog packs, character sprites
- **Kenney.nl** - UI elements (CC0 license)
- **AI-generated** - Backgrounds, custom items

Always verify license compatibility before adding assets.
