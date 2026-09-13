# Phase 6: Basic Player Movement and Collision Report

## Status
`COMPLETE_SOURCE`

## Audited client sources
- `player/CPlayer.java`
- `player/PM.java`
- `map/MM.java`
- `map/CMap.java`
- Helper math functions in `CRes.java`

## Implemented Architecture
1. **Domain States**: Implemented `PlayerMovementKind` enum (`idle`, `walking`, `falling`, `hurt`, `dead`, `frozen`, `teleport`) and an immutable `PlayerMovementState` holding velocity, ground status, and stamina.
2. **Intent-Driven Input**: Separated raw inputs from positions; inputs now populate `MovementIntent` passed to systems.
3. **Systems**:
   - `PlayerMovementSystem`: Decouples step mechanics and slope climbing (up to a configurable slope limit). Consumes stamina during horizontal movement.
   - `PlayerCollisionSystem`: Handles gravity acceleration, terminal velocity, ground snap, map boundary clamps, and death zones (falling off or water boundaries).
   - `GroundProbe`: Handles exact pixel checks against the pixel-mask terrain layer.

## Parity and Assumptions
- Constant walk speed and stamina depletion matching legacy Java feel.
- Gravity acceleration is framed per-frame inside Flame game loop using delta time (`dt`) to remain frame-rate independent.
- Advanced features like dynamic wind effects on player movement or custom knockback behaviors are deferred to online integration phases.
