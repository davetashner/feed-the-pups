# ADR-004: Art Asset Pipeline

## Status
Accepted

## Date
2026-01-21

## Context

We need to decide how to create art assets (sprites, backgrounds, UI elements) for "Feed the Pups."

Requirements:
- Cartoon style with bright colors (greens, blues)
- Kid-friendly aesthetic
- Multiple dog breeds
- Various backgrounds (kitchen, living room, etc.)
- UI elements (buttons, HUD)
- Animations (dog movements, catch reactions, mouse)

Constraints:
- Minimal budget ($0-50 for assets)
- No professional artist on team
- Learning project (quality doesn't need to be AAA)

## Decision

**Option B (Asset Packs) initially, with Option A (AI-Generated) for gaps**

Start with curated asset packs that match the "chunky cartoon" style defined in `art-style-guide.md`. Fill gaps with AI-generated assets as needed. This approach prioritizes speed and consistency while staying within budget.

Options considered:

### Option A: AI-Generated Art
- Use AI tools (DALL-E, Midjourney, Stable Diffusion) to generate base assets
- Touch up in free tools (GIMP, Krita)
- **Pros:** Fast, cheap, consistent style achievable with good prompting
- **Cons:** May need iteration, animation requires frame-by-frame work
- **Cost:** $0-20 depending on AI credits

### Option B: Asset Store / Free Assets
- Use free game assets from itch.io, OpenGameArt, Kenney
- Customize colors/style as needed
- **Pros:** Immediately usable, professionally made
- **Cons:** May not match exact vision, mixing styles can look inconsistent
- **Cost:** $0-30

### Option C: Hand-Drawn (Simple Style)
- Draw simple assets in Krita/Procreate
- Lean into a charming "amateur" style
- **Pros:** Unique, personal, daughter could help
- **Cons:** Time-consuming, requires drawing ability
- **Cost:** $0 (tools are free or already owned)

### Option D: Hybrid Approach
- AI for backgrounds and complex assets
- Simple hand-drawn or asset pack items for smaller elements
- Mix and match based on what works
- **Pros:** Flexible, best of all worlds
- **Cons:** Style consistency may vary

## Recommendation

**Option D (Hybrid)** - Start with AI-generated art for backgrounds and base dog sprites, supplement with free asset packs for UI elements, and hand-draw simple items if desired. This maximizes flexibility while keeping costs near zero.

## Consequences

### Positive
- Fast iteration - can test assets immediately without creation time
- Professional quality from established asset creators
- Budget-friendly ($0-30 range)
- AI generation available as fallback for custom needs

### Negative
- May need to adjust game design to fit available assets
- Style consistency requires careful curation
- Dog-specific assets are limited; may need AI generation for variety

### Mitigations
- Created comprehensive `art-style-guide.md` to evaluate asset compatibility
- Defined clear specifications for asset formats and naming
- Will test assets in-game before committing to a pack

## Asset Sources (Evaluated)

### For Dogs
- **itch.io Dog Packs** - Several options available:
  - [Dogs tag](https://itch.io/game-assets/tag-dogs) - Dog Mega Pack, Pet Dogs Pack (8 breeds)
  - [2D + Dog](https://itch.io/game-assets/tag-2d/tag-dog) - Cartoonish pixel art dogs
  - [Free dog assets](https://itch.io/game-assets/free/tag-dog) - 18 free options
- Note: Kenney's Animal Pack does NOT include dogs

### For UI
- **Kenney UI Pack** - Clean, rounded buttons and elements (free, CC0)

### For Backgrounds
- AI-generated recommended (no good chunky cartoon background packs found)

## References
- [Kenney Game Assets](https://kenney.nl/) - Free, high-quality game assets
- [OpenGameArt](https://opengameart.org/) - Free game art repository
- [itch.io Game Assets](https://itch.io/game-assets) - Free and paid assets
