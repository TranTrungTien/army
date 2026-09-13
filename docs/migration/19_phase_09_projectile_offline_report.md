# Phase 9: Offline Projectile Skeleton Report

## Status
`COMPLETE_SOURCE`

## Audited client sources
- `item/Bullet.java`
- `item/BM.java`
- Ballistic formulas from `CRes.java`

## Implemented Architecture
1. **Trajectory Representation**: Created `TrajectoryFrame` and `ProjectileTrajectory` datatypes to decouple simulation from drawing.
2. **Deterministic Playback Component**: Developed `ProjectileComponent` that reads server-computed (or offline-simulated) trajectories frames progressively using fixed-rate delta accumulators.
3. **Simulated Math Core**: Constructed `BulletSimulator` and `TrajectorySimulator` recreating legacy fixed-point trigonometric equations, acceleration tables, wind scaling parameters for various gun types, and line-segment raycasts for obstacle impact coordinates.
4. **Impact Side Effects**: Seamlessly triggers terrain pixel removal (`makeHole`), particle explosions, sound effects, and camera focus shifts upon detonation.
