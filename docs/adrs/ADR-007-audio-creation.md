# ADR-007: Audio Asset Creation

## Status
Accepted

## Date
2026-01-21

## Context

We need to create audio assets for "Feed the Pups":
- **Sound Effects:** Dog barks, catch sounds, miss sounds, UI clicks, mouse squeaks
- **Music:** Menu theme, gameplay music

Constraints:
- Minimal budget ($0-20)
- Developer mentioned possibly recording own dogs barking
- AI tools acceptable for generation
- Kid-friendly, not annoying on repeat

## Decision

**[TO BE DECIDED]**

Options under consideration:

### Option A: AI-Generated Audio
- Use AI tools (Suno, Udio for music; ElevenLabs sound effects)
- **Pros:** Fast, customizable, cheap
- **Cons:** Quality varies, may need iteration
- **Cost:** $0-15 depending on credits/subscriptions

### Option B: Free Sound Libraries
- Use Freesound.org, Pixabay, OpenGameArt
- **Pros:** Immediately usable, often high quality
- **Cons:** May not find exact sounds needed, attribution may be required
- **Cost:** $0

### Option C: Record Custom Audio
- Record dog barks from own dogs
- Create simple sound effects with household items
- **Pros:** Unique, personal, fun activity with daughter
- **Cons:** Requires decent microphone, audio editing skills
- **Cost:** $0 (assuming mic available)

### Option D: Paid Asset Packs
- Purchase sound effect packs from itch.io or Unity Asset Store
- **Pros:** Professional quality, comprehensive packs
- **Cons:** Cost, may not match exact vision
- **Cost:** $5-20

### Option E: Hybrid Approach
- Record dog barks (personal touch)
- Free libraries for standard UI sounds
- AI or free music for background tracks
- **Pros:** Best of all worlds
- **Cons:** Style consistency requires curation

## Recommendation

**Option E (Hybrid)**:
1. **Dog barks:** Record from own dogs (fun, personal, free)
2. **UI sounds:** Free libraries (Freesound.org)
3. **Catch/miss effects:** Free libraries or AI-generated
4. **Music:** AI-generated (Suno free tier) or royalty-free library

## Audio Specifications

| Type | Format | Sample Rate | Notes |
|------|--------|-------------|-------|
| Sound Effects | OGG or WAV | 44.1kHz | Short clips, < 2 seconds |
| Music | OGG | 44.1kHz | Loopable, 30-60 seconds |

## Consequences

[To be filled after decision]

## References
- [Freesound.org](https://freesound.org/) - Free sound effects (CC licensed)
- [Suno AI](https://suno.ai/) - AI music generation
- [Godot Audio Import](https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_audio_samples.html)
