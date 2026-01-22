# ADR-001: Game Engine Selection

## Status
Accepted

## Date
2026-01-21

## Context

We need to select a game engine for developing "Feed the Pups," a 2D casual mobile game for iOS. Key requirements:

- **2D game** with cartoon-style graphics
- **iOS deployment** (no Android initially)
- **Touch input** (swipe and tap gestures)
- **Low budget** (learning project, minimal investment)
- **Developer experience:** Strong systems/infrastructure background, minimal OOP experience, preference for Claude Code to handle most coding
- **Future flexibility:** Possible Android support later

## Decision

We will use **Godot 4** as the game engine.

## Consequences

### Positive
- **100% free and open source** - No licensing fees, no royalties, ever
- **Excellent 2D support** - Godot's 2D engine is first-class, not bolted onto a 3D engine
- **GDScript is approachable** - Python-like syntax, easier to read and generate
- **iOS export available** - Built-in iOS export templates
- **Small binary size** - Important for mobile games
- **Active community** - Good documentation and tutorials
- **No account required** - Can start immediately without sign-ups
- **Claude Code compatibility** - GDScript is well-documented and Claude can generate it effectively

### Negative
- **Smaller asset marketplace** - Unity Asset Store has more pre-made assets
- **Fewer tutorials than Unity** - Though Godot 4 tutorials are growing rapidly
- **Less industry name recognition** - Doesn't matter for a learning project
- **iOS export requires macOS** - Not an issue since we're developing on Mac

### Neutral
- Learning curve similar to other engines for beginners
- Export process requires Xcode regardless of engine choice

## Alternatives Considered

### Unity
- **Pros:** Industry standard, massive asset store, abundant tutorials
- **Cons:** Licensing complexity (runtime fees above revenue thresholds), C# requires more OOP knowledge, larger binary sizes
- **Why rejected:** Licensing uncertainty and C# learning curve

### SpriteKit (Apple native)
- **Pros:** Tight iOS integration, Swift is modern, no third-party dependencies
- **Cons:** iOS/macOS only (no future Android), requires learning Swift and Apple frameworks
- **Why rejected:** Platform lock-in, steeper Apple ecosystem learning curve

### Flutter with Flame
- **Pros:** Cross-platform, Dart is approachable, hot reload
- **Cons:** Not purpose-built for games, fewer game-specific features
- **Why rejected:** Game development is secondary to Flutter's purpose

### Cocos2d-x
- **Pros:** Free, good 2D support, used in many mobile games
- **Cons:** C++ based (complex), smaller community than Godot/Unity
- **Why rejected:** C++ complexity

## References
- [Godot Engine](https://godotengine.org/)
- [Godot iOS Export Documentation](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_ios.html)
