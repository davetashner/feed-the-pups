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
| Dog visibility window (start) | 4.0 seconds | Level 1 (child-friendly adjustment) |
| Dog visibility window (end) | 2.5 seconds | Level 10 (still achievable for kids) |
| Window shrink per level | -0.15 seconds | Gradual difficulty increase |

### Level Duration Rationale

**Decision: Fixed 60 seconds for all levels**

Why 60 seconds (not shorter):
- **30 seconds feels rushed** - Playtesting showed young children need time to aim carefully
- **Builds completion satisfaction** - Enough time to achieve meaningful scores
- **Allows 10-15 catch opportunities** - With dogs spawning every 4-6 seconds

Why 60 seconds (not longer):
- **Attention span sweet spot** - Children 7+ can focus for 1-2 minute chunks
- **Quick retry loop** - Failed attempts don't feel like wasted time
- **Session pacing** - 3-5 levels in 10-15 minutes feels like a complete play session

Why fixed (not variable per level):
- **Predictability** - Children learn the rhythm and can anticipate round endings
- **Difficulty via other levers** - Dog speed, visibility windows, and count increase challenge
- **Fairness** - All levels give equal time to achieve star thresholds

### Dog Visibility Window Rationale

**Adjusted from original 3.0s→1.5s to 4.0s→2.5s for child-friendliness**

- Level 1 at 4.0s gives children time to see the dog, aim, and throw without pressure
- Level 10 at 2.5s is challenging but achievable - still enough time to complete a swipe
- Original 1.5s end window was too punishing for young players in playtesting

## Session Pacing

### Spawn Cadence

| Level Tier | Spawn Interval | Dogs Per Minute |
|------------|----------------|-----------------|
| Early (1-3) | 5.0-4.6s | 12-13 |
| Mid (4-6) | 4.4-4.0s | 13-15 |
| Late (7-10) | 3.8-3.2s | 15-18 |

**Design goals:**
- **Steady rhythm** - Dogs appear at predictable intervals, not random bursts
- **Breathing room** - Time between dogs allows aiming without panic
- **Progressive intensity** - Later levels feel faster without being frantic

### Catch Opportunities Per Level

| Level Tier | Target Catches | Rationale |
|------------|---------------|-----------|
| Early (1-3) | 10-12 | Low bar for success, learning phase |
| Mid (4-6) | 12-15 | Building skill, more chances to score |
| Late (7-10) | 15-18 | Reward mastery with more scoring opportunities |

**Calculations based on:**
- 60-second level duration
- Spawn interval per level
- ~1 second for each catch attempt cycle

### Session Length Targets

| Session Type | Duration | Levels | Notes |
|--------------|----------|--------|-------|
| Quick play | 3-5 min | 2-3 levels | Waiting room, car ride |
| Standard session | 10-15 min | 5-8 levels | Typical play session |
| Extended play | 20-30 min | 10+ levels | Engaged play with breaks |

**Natural stopping points:**
- After any level (results screen with clear exit option)
- After unlocking new content (dog breed, location, accessory)
- After achieving 3 stars on a level

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

| Level | Dogs on Screen | Visibility Window | Spawn Interval | Catch Opportunities |
|-------|---------------|-------------------|----------------|---------------------|
| 1 | 1 | 4.0s | 5.0s | ~12 |
| 2 | 1-2 | 3.85s | 4.8s | ~12 |
| 3 | 1-2 | 3.70s | 4.6s | ~13 |
| 4 | 2 | 3.55s | 4.4s | ~13 |
| 5 | 2-3 | 3.40s | 4.2s | ~14 |
| 6 | 2-3 | 3.25s | 4.0s | ~15 |
| 7 | 3 | 3.10s | 3.8s | ~15 |
| 8 | 3-4 | 2.95s | 3.6s | ~16 |
| 9 | 3-4 | 2.80s | 3.4s | ~17 |
| 10 | 4-5 | 2.65s | 3.2s | ~18 |

### Difficulty Scaling Rationale

- **Visibility window** decreases gradually from 4.0s to 2.65s (not below 2.5s threshold)
- **Spawn interval** decreases from 5.0s to 3.2s, increasing pace without overwhelming
- **Catch opportunities** increase from ~12 to ~18 per level, rewarding skilled play
- **Dogs on screen** caps at 4-5 to avoid visual clutter for young players
- **Speed multiplier removed** - difficulty comes from timing, not reflexes

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
