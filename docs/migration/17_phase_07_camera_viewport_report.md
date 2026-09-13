# Phase 7: Camera and Viewport Report

## Status
`COMPLETE_SOURCE`

## Audited client sources
- `effect/Camera.java`
- Camera routing and target switches in game screen loops.

## Implemented Architecture
1. **Camera Modes**: Created `CameraMode` enum managing `playerFollow`, `bulletFollow`, and `freePan`.
2. **Dynamic Priorities**:
   - The camera automatically locks onto the active player when no projectiles are active.
   - When a projectile is spawned, the system shifts focus to `bulletFollow` with higher movement speeds.
   - User drag gestures smoothly force a shift into `freePan`, which times out back to `playerFollow` after 3 seconds of inactivity.
3. **Terrain Clamping**: Ensures viewport bounds never venture outside map coordinates based on current resolution sizes.
4. **Screen Shake**: Extensible `ScreenShakeEffect` component hooks directly to visual rendering layers for explosion impacts.
