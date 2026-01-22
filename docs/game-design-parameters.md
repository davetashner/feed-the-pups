# Feed the Pups - Game Design Parameters

This document defines the core gameplay parameters. These values are the source of truth for implementation.

## Target Audience
- **Primary:** Children aged 7+
- **Secondary:** Parents playing with children
- **Accessibility:** Large touch targets, simple controls, forgiving timing

## Screen & Platform

| Parameter | Value |
|-----------|-------|
| Orientation | **Landscape only** |
| Platform | iOS (iPhone + iPad) |
| Minimum iOS | iOS 26 |
| Resolution | 1920x1080 base, scale to device |

## Core Timing

| Parameter | Value | Notes |
|-----------|-------|-------|
| Level duration | 60 seconds | All levels same duration |
| Dog visibility window (start) | 3.0 seconds | Level 1, beginning of level |
| Dog visibility window (end) | 1.5 seconds | Level 10, end of level |
| Window shrink per level | -0.15 seconds | Gradual difficulty increase |

## Scoring

| Parameter | Value |
|-----------|-------|
| Points per catch | 100 |
| Streak threshold | 5 consecutive catches |
| Streak multiplier | 2x points |
| Speed bonus threshold | 5 catches in 10 seconds |
| Speed bonus points | +100 |

## Star Rating Thresholds

Stars are awarded based on percentage of maximum possible score.

| Stars | Threshold |
|-------|-----------|
| 1 Star (Pass) | 50% of max score |
| 2 Stars | 75% of max score |
| 3 Stars | 90% of max score |

## Difficulty Scaling

| Level | Dogs on Screen | Visibility Window | Speed |
|-------|---------------|-------------------|-------|
| 1 | 1 | 3.0s | 1.0x |
| 2 | 1-2 | 2.85s | 1.0x |
| 3 | 1-2 | 2.70s | 1.1x |
| 4 | 2 | 2.55s | 1.1x |
| 5 | 2-3 | 2.40s | 1.2x |
| 6 | 2-3 | 2.25s | 1.2x |
| 7 | 3 | 2.10s | 1.3x |
| 8 | 3-4 | 1.95s | 1.3x |
| 9 | 4 | 1.80s | 1.4x |
| 10 | 4-5 | 1.65s | 1.5x |

## Locations (by level)

| Level | Location |
|-------|----------|
| 1 | Kitchen |
| 2 | Backyard |
| 3 | Paris |
| 4 | Texas |
| 5 | Italy |
| 6 | New York City |
| 7 | Inside a Train |
| 8 | At the Beach |
| 9 | At the Pool |
| 10 | Thanksgiving Table (bonus) |

## Dog Breeds

Available dog breeds (sprites needed for each):
1. Chihuahua
2. Golden Retriever
3. White and Brown Lab Mix
4. Poodle
5. St. Bernard
6. German Shepherd
7. Bulldog

## Unlockable Accessories

Hats that dogs can wear:
1. Top Hat
2. Bow Tie
3. Dog Saddle
4. Diamond Tiara
5. Unicorn Horn
6. Leprechaun Hat

## Famous Dogs (Unlockable)

Unlocked every 3 levels:
- Level 3: TBD (research public domain dogs)
- Level 6: TBD
- Level 9: TBD
- Level 10: TBD (bonus unlock)

## Dog Exit Behaviors

When a dog's visibility window expires, they exit via one of:
1. **Hide behind furniture** - Duck behind nearby object
2. **Chase squirrel** - See squirrel, bolt off screen
3. **Run away** - Generic exit off screen edge

Exit type chosen randomly or based on location context.

## Mouse Behavior

When a treat is missed (hits floor):
1. Mouse runs in from nearest screen edge
2. Mouse grabs treat (brief pause)
3. Mouse runs off screen with treat
4. Total animation: ~1.5 seconds

## Touch Controls

### Thrower Mode
- **Swipe:** Aim and throw treat (direction + velocity)
- **Tap on dog:** Auto-throw toward that dog (accessibility option)

### Catcher Mode (future)
- **Swipe left/right:** Move dog horizontally

## Visual Style

| Aspect | Specification |
|--------|--------------|
| Art style | Cartoon, Bluey/Angry Birds inspired |
| Color palette | See `docs/color-reference.md` |
| Outline weight | 2-3px at 1080p |
| Juiciness | Minimal for MVP |

## Audio

| Type | Specification |
|------|--------------|
| Dog barks | Record from real dogs or AI-generated |
| Catch sound | Satisfying "munch" + positive chime |
| Miss sound | Soft "thud" + mouse squeak |
| Music | Cheerful, loopable, kid-friendly |

## MVP Definition

Minimum Viable Product includes:
- [x] Thrower mode only (no Catcher mode)
- [x] Scoring system with streak/speed bonuses
- [x] Star ratings (1-3)
- [x] At least 3 playable levels
- [x] Kitchen background (Level 1)
- [x] 1 dog breed minimum
- [x] Basic treat sprite
- [x] Mouse on miss
- [x] Main menu, level select, results screens

## Priority Order

1. **Core Functionality** - Game loop, throwing, catching, scoring
2. **Level Flow** - Menu, level select, results, progression
3. **Visual Polish** - Art, animations, locations
4. **Audio** - Sound effects, music
5. **Extra Features** - Unlockables, famous dogs, photo upload
