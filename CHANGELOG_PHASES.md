# Phase Changelog

## Phase 0
Repository inventory, dependency graph, mapping, unresolved registry.

## Phase 1
Flutter/Flame foundation, router placeholders, lifecycle coordinator, error boundary, and test sources.

## Phase 2
Legacy Q10 trigonometry, angle rules, Java int32 arithmetic, collision helpers, random abstraction, Java-generated golden fixtures, and tests.

## Phase 3
Asset inventory, canonical manifest, conversion tools, deterministic atlas packer, asset scope, repositories, and validation tests.

## Phase 4
Legacy map binary parser, map domain definitions, repository boundary, Flame render skeleton, debug spawn overlay, and map-switch lifecycle.

## Phase 5
Character/equipment definitions, manifest parsing, layered sprite composition, facing, animation runtime, appearance updates, and tests.

## Phase 6
Basic Player Movement and Collision: walking, falling, slope climbing (up to 4px), ground snapping, stamina consumption, and death by map boundaries. MovementIntent decoupling.

## Phase 7
Camera and Viewport: follow player/projectile, manual pan (drag) with return-to-player timeout, map clamping, and screen shake. Coordinate conversion for world-space interaction.

## Phase 8
Gameplay Input and Basic HUD: aim/move/fire controls with continuous hold support, power-bar charging, and HUD overlays (angle, force). Integrated Flame input events.

## Phase 9
Offline Projectile Skeleton: ballistic simulation (Q10 parity), wind/gravity effects, terrain collision, destructible terrain holes, camera follow, and power-bar charging (1..30).

## Phase 16 & 17
Gameplay Network Integration: `shootResult` (cmd 23) parity, multi-trajectory support (Miss 6), authoritative damage application, and synchronized Flame/Riverpod gameplay state.

## Phase 18 & 19
Refined Destruction: per-bullet explosion radii.
Integrated Chat: cross-feature ChatController and HUD overlay for real-time player communication in room and match.
Visual Effects Foundation: implemented `SmokeParticle` trails, `ExplosionComponent` on impact, and `DamageTextComponent` for floating damage numbers.

## Phase 20
Inventory & Equipment Foundation: added `InventoryScreen`, `InventoryController`, and `InventoryItem` domain model.
Lobby UI: implemented `LobbyScreen` with Area selection and Board/Room grid.
Match Lifecycle: integrated `skipTurn` (cmd 49) and improved `shootResult` (cmd 23) visual feedback in Flame.
Weapon Matrix Expansion: added Tazan (bullet 5) and Chicky (bullet 7) parameters to offline `TrajectorySimulator`.
