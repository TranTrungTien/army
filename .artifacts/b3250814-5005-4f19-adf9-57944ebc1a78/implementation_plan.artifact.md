# Phase 6: Basic Player Movement and Collision

Implement the core player movement logic, including horizontal walking, simple gravity, and terrain collision based on the legacy MobiArmy2 behavior.

## User Review Required

> [!IMPORTANT]
> This phase implements **local** movement logic which will eventually be synchronized with server packets in Phase 16. For now, it will support offline sandbox movement.

## Proposed Changes

### Domain Layer

#### [NEW] [player_movement_state.dart](file:///C:/Users/Administrator/StudioProjects/army/lib/features/gameplay/domain/player/player_movement_state.dart)
Defines the `PlayerMovementKind` enum (idle, walk, fall, etc.) and `PlayerMovementState` class to track physical properties like velocity and current ground state.

### Gameplay Layer (Systems)

#### [NEW] [player_movement_system.dart](file:///C:/Users/Administrator/StudioProjects/army/lib/features/gameplay/game/systems/player_movement_system.dart)
Handles horizontal movement based on `GameplayInputState`. It will update the player's position and handle stamina/steps logic if applicable.

#### [NEW] [player_collision_system.dart](file:///C:/Users/Administrator/StudioProjects/army/lib/features/gameplay/game/systems/player_collision_system.dart)
Handles vertical movement (gravity), detects ground collision using `DestructibleTerrain`, and clamps the player within map boundaries.

#### [NEW] [ground_probe.dart](file:///C:/Users/Administrator/StudioProjects/army/lib/features/gameplay/game/systems/ground_probe.dart)
A utility to check terrain solidity at specific points (e.g., under the player's feet).

### Gameplay Layer (Integration)

#### [MODIFY] [army_game.dart](file:///C:/Users/Administrator/StudioProjects/army/lib/features/gameplay/game/army_game.dart)
Integrate the new systems into the Flame update loop.

## Verification Plan

### Automated Tests
- Unit tests for `PlayerMovementSystem`: walking left/right, stopping.
- Unit tests for `PlayerCollisionSystem`: falling from height, landing on solid ground, walking off edges.
- Map boundary tests: player cannot move outside map width/height.

### Manual Verification
- Move the player in the gameplay sandbox and verify they stop at terrain and fall when in air.
