# Feed the Pups - Art Style Guide

This document defines the visual style for all game assets. All artists (human or AI) should reference this guide to maintain consistency.

## Style Overview

**Style Name:** Chunky Cartoon

**Description:** Friendly, rounded, and bold. Characters and objects have exaggerated proportions, thick outlines, and saturated colors. The aesthetic prioritizes approachability and delight over realism.

**Target Audience:** Children ages 3-8 and their parents

**Style References:**
- **Bluey** (ABC Kids) - Soft, approachable characters with simple shapes
- **Angry Birds** - Bold outlines, exaggerated expressions, chunky proportions
- **Cut the Rope** - Rounded characters, bright colors, playful animations
- **Toca Boca games** - Kid-friendly, chunky UI elements

## Core Principles

### 1. Rounded Over Angular
All shapes should favor curves over sharp angles. Corners are rounded. Even "pointy" objects (like treat bones) have soft edges.

```
GOOD: (   )   Rounded, soft
BAD:  [   ]   Sharp, angular
```

### 2. Chunky Proportions
Characters and objects are "chonky" - thicker and more substantial than realistic proportions.

- **Dogs:** Big heads (40-50% of body height), stubby legs, round bodies
- **Treats:** Oversized relative to dogs (for visibility and catchability)
- **UI elements:** Large, tap-friendly (minimum 44pt touch targets)

### 3. Bold Outlines
All sprites have visible outlines that separate them from backgrounds.

- **Line color:** Charcoal (#2C3E50) - NOT pure black
- **Line weight:**
  - Characters: 3-4px at 256px sprite height
  - Items: 2-3px at 64px sprite height
  - UI: 2px
- **Line style:** Consistent width (no tapered/brushy lines)

### 4. Flat with Subtle Depth
Primarily flat coloring with minimal shading.

- Use 2-3 tones per color area maximum
- Shadow tone: 15-20% darker than base
- Highlight tone: 10-15% lighter than base
- No gradients (except special effects)
- No realistic lighting/shadows

### 5. Expressive Faces
Characters communicate emotion through simple, exaggerated facial expressions.

- **Eyes:** Large, round, high on face (Bluey style)
- **Eyebrows:** Thick, expressive (can float above head for comedy)
- **Mouth:** Simple shapes - smile curve, open circle for excitement
- **No noses** on dogs (or very simple dot/triangle)

## Character Design: Dogs

### Proportions
```
        HEAD (40%)
    ┌─────────────┐
    │   ◉     ◉   │  <- Eyes in upper third
    │      ▽      │  <- Nose (optional)
    │    ‿‿‿‿     │  <- Mouth
    └─────────────┘
         │
    ┌────┴────┐
    │  BODY   │  (45%)
    │ (round) │
    └┬──┬──┬──┘
     │  │  │      <- Stubby legs (15%)
     ▼  ▼  ▼
```

### Design Guidelines
- **Silhouette:** Each dog breed should be recognizable by silhouette alone
- **Head shapes:**
  - Round (poodle, chihuahua)
  - Slightly oval (lab, retriever)
  - Squared-round (bulldog)
- **Ears:** Exaggerated - floppy ears are VERY floppy, pointy ears are triangle shapes
- **Tails:** Simple shapes, used for expression (wagging = happiness)
- **Colors:** See `color-reference.md` for fur colors

### Required Poses/Animations
| Pose | Description | Frame Count |
|------|-------------|-------------|
| Idle | Slight breathing, tail wag | 4-6 frames |
| Alert | Ears up, eyes wide, waiting for treat | 2 frames |
| Catch | Mouth open, eating treat | 3-4 frames |
| Happy | Jumping, tail wagging fast | 4-6 frames |
| Miss | Sad eyes, ears down | 2-3 frames |
| Exit | Walking/running off screen | 4-6 frames |

## Character Design: Mouse

The treat-stealing mouse should be:
- **Smaller than dogs** (about 1/3 the size)
- **Mischievous expression** (sneaky grin, shifty eyes)
- **Quick and nimble** looking (long tail, big ears)
- **Not scary** - cute pest, not vermin
- **Gray fur** with pink ears/nose/tail

## Item Design: Treats

### Size
Treats should be **large and readable** - about 1/4 the size of a dog's head.

### Types
| Treat | Shape | Color |
|-------|-------|-------|
| Basic treat | Rounded rectangle | Warm Orange (#F39C12) |
| Bone | Classic bone shape | Cream/Tan (#F5CBA7) |
| Biscuit | Circle with dots | Brown (#A04000) |
| Hot dog | Curved cylinder in bun | Pink/Tan |

### Motion
Treats should have a slight rotation while in flight to feel dynamic.

## Background Design

### Layering
Backgrounds consist of 3 layers:
1. **Far background** (sky/wall) - static, simple
2. **Mid ground** (furniture, obstacles) - where dogs appear from
3. **Ground plane** - where treats land if missed

### Style
- **Simplified shapes** - furniture is suggested, not detailed
- **Bright, saturated colors** - match the color palette
- **No realistic textures** - flat colors or simple patterns only
- **Clear play area** - bottom 60% of screen should be uncluttered

### Required Backgrounds (MVP)
1. **Kitchen** - counter, cabinets, floor tiles
2. **Backyard** - grass, fence, sky

## UI Design

### Buttons
- **Shape:** Rounded rectangles (border-radius: 50% of height)
- **Size:** Minimum 80x80px tap target
- **States:**
  - Default: Solid color with outline
  - Pressed: 10% darker, slight scale down (95%)
  - Disabled: Gray (#BDC3C7)

### Typography
- **Primary font:** Rounded, bold sans-serif (like Fredoka One, Baloo, or similar)
- **Numbers:** Large, clear, easy to read
- **No small text** - minimum 24pt for any text

### HUD Elements
- **Score:** Large numbers, top-left
- **Timer:** Clear countdown, top-right
- **Streak:** Celebratory treatment (stars/sparkles at milestones)

## Animation Guidelines

### Timing
- **Snappy and responsive** - animations should feel immediate
- **Idle animations:** 0.5-1 second loops
- **Reactions:** 0.2-0.3 seconds
- **Transitions:** 0.3-0.5 seconds

### Principles
1. **Squash and stretch** - exaggerate on impacts and jumps
2. **Anticipation** - brief wind-up before actions
3. **Follow-through** - ears/tails continue moving after body stops
4. **Overlapping action** - different parts move at different speeds

## Asset File Specifications

### Sprite Formats
- **Format:** PNG with transparency
- **Resolution:** 2x base size for retina displays
- **Base sizes:**
  - Dogs: 256x256px (512x512 @ 2x)
  - Treats: 64x64px (128x128 @ 2x)
  - UI buttons: 80x80px minimum
  - Backgrounds: 1920x1080px (3840x2160 @ 2x)

### Naming Convention
```
[category]_[name]_[variant]_[state].png

Examples:
dog_golden_idle_01.png
dog_golden_idle_02.png
treat_bone_default.png
bg_kitchen_main.png
ui_button_play_pressed.png
```

### Folder Structure
```
game/
└── assets/
    ├── sprites/
    │   ├── dogs/
    │   ├── treats/
    │   ├── mouse/
    │   └── effects/
    ├── backgrounds/
    ├── ui/
    │   ├── buttons/
    │   ├── hud/
    │   └── menus/
    └── fonts/
```

## Recommended Asset Packs

Based on the chunky cartoon style, these asset packs may be compatible:

### Itch.io
- **[Cartoon + Cute tagged assets](https://itch.io/game-assets/tag-cartoon/tag-cute)** - Browse for matching styles
- **Boba Animals Megapack** - Described as "the roundest" animals
- **[Animals + Characters](https://itch.io/game-assets/tag-animals/tag-characters)** - Dog and animal sprites

### Kenney.nl (Free)
- **Animal Pack** - Simple, clean animal sprites
- **UI Pack** - Rounded, game-ready UI elements

### When Evaluating Asset Packs
Check for:
1. Consistent outline weight with our style (2-4px)
2. Saturated, bright colors (not pastel)
3. Rounded shapes (not angular)
4. Animation frames included (or static poses we can animate)
5. Commercial license included

## Color Reference

See `color-reference.md` for the complete color palette.

**Quick reference - most used colors:**
| Use | Color | Hex |
|-----|-------|-----|
| Outlines | Charcoal | #2C3E50 |
| Sky | Sky Blue | #5DADE2 |
| Grass | Grass Green | #58D68D |
| Treats | Warm Orange | #F39C12 |
| Stars | Sunshine Yellow | #F7DC6F |

## Examples and Inspiration

When creating or selecting assets, reference these games for the target aesthetic:

1. **Bluey: Let's Play!** - Character proportions, expression style
2. **Angry Birds 2** - Bold outlines, chunky shapes, bright colors
3. **Cut the Rope** - Rounded character design, playful animations
4. **Toca Kitchen** - UI style, kid-friendly interactions
5. **My Talking Tom** - Pet character expressions and reactions

---

*Last updated: 2026-01-21*
*Version: 1.0*
