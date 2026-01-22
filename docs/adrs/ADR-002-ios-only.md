# ADR-002: iOS-Only Platform

## Status
Accepted

## Date
2026-01-21

## Context

We need to decide which mobile platforms to target for the initial release of "Feed the Pups."

Key factors:
- This is a **learning project** to explore game development and agentic workflows
- Developer has **iOS devices available** for testing
- Developer **does not have Android devices**
- Goal is to build something fun with daughter, not maximize market reach
- Budget is minimal

## Decision

We will target **iOS only** for the initial development phase.

## Consequences

### Positive
- **Reduced complexity** - One platform = one set of guidelines, one testing matrix
- **Faster development** - No need to handle platform differences
- **Available test devices** - Can test on real hardware immediately
- **Consistent experience** - iOS devices have more uniform specs than Android
- **Simpler touch handling** - iOS touch APIs are well-documented
- **No Android Studio setup** - One less development environment to configure

### Negative
- **Limited audience** - ~27% of US smartphone users (though this doesn't matter for a learning project)
- **No Android testing** - If we later add Android, will need to acquire test devices
- **Apple ecosystem cost** - $99/year developer fee if we ever publish to App Store (not needed for local development)

### Neutral
- Godot supports both platforms, so adding Android later is technically feasible
- Most game logic will be platform-agnostic

## Migration Path to Android

If we decide to add Android support later:
1. Acquire Android test device(s)
2. Install Android Studio and SDK
3. Configure Godot Android export template
4. Test touch input (may need minor adjustments)
5. Test performance across device tiers
6. Handle Android-specific permissions (photo access, etc.)

Estimated additional effort: Medium (primarily testing and device-specific tuning)

## Alternatives Considered

### iOS + Android from start
- **Pros:** Broader reach, ensures cross-platform architecture
- **Cons:** Double the testing, need Android devices, slower initial progress
- **Why rejected:** Unnecessary complexity for a learning project

### Android only
- **Pros:** Larger market share globally, more device variety for testing
- **Cons:** No Android devices available, more fragmented testing
- **Why rejected:** No test hardware available

### Web (PWA)
- **Pros:** Universal access, no app store needed
- **Cons:** Touch handling less reliable, no native app feel, limited device APIs
- **Why rejected:** Native app experience preferred for a game

## References
- [Godot iOS Export](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_ios.html)
- [Godot Android Export](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html)
