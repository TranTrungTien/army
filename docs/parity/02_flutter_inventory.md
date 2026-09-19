# Flutter Client Code Inventory

This document tracks all Dart structures, modules, screens, Flame components, and providers implemented within the modernization codebase.

---

## 1. Directory Structure Map & Classifications

Every class is explicitly tagged with its behavioral category designation from Phase 0:
- **[RUNTIME_PORT]**
- **[FRAMEWORK_REPLACE]**
- **[FEATURE_MERGE]**
- **[DEPRECATED_REACHABLE]**
- **[CLIENT_PRESENTATION]**

### App & Navigation Nodes
- `ArmyApp` **[FRAMEWORK_REPLACE]** - Material 3 base application configuration element.
- `AppLifecycleCoordinator` **[FRAMEWORK_REPLACE]** - Tracks focus lifecycle adjustments.
- `NavigationController` & `NavigationState` **[FRAMEWORK_REPLACE]** - GoRouter navigation bindings.

### Core Architecture & Primitives (`lib/core/`)
- `JavaInt32` **[RUNTIME_PORT]** - Emulates standard 32-bit signed bit shifts and overflows.
- `LegacyFixedPoint` **[RUNTIME_PORT]** - Emulates custom game layout fixed precision adjustments.
- `LegacyAngle` **[RUNTIME_PORT]** - Encapsulates 0-359 integer circles and delta evaluations.
- `LegacyCollisionMath` **[RUNTIME_PORT]** - Rect hit collision bounds check math.
- `LegacyTrigonometry` **[RUNTIME_PORT]** - Hardcoded 360 lookup lookup table sin/cos vectors.
- `ByteReader` & `ByteWriter` **[RUNTIME_PORT]** - Dynamic binary endian memory slice array manipulation.
- `XorCodec` **[RUNTIME_PORT]** - Rolling key encrypter engine interface.
- `TcpSession` **[RUNTIME_PORT]** - Low-level network socket interface.
- `MessageDispatcher` **[RUNTIME_PORT]** - Routes opcode packet events.
- `FilePackDecoder` & `FilePack` **[RUNTIME_PORT]** - De-serializes binary legacy sprite data bundle records.
- `LegacyRms` **[RUNTIME_PORT]** - Key-value mock replacement for phone flash storage records.

### Features & Service State Providers (`lib/features/`)
- `AuthController` & `AuthStateMachine` **[RUNTIME_PORT]** - Tracks unauthenticated -> logging in -> lobby transitions.
- `DataSyncService` **[SERVER_AUTHORITY]** - Fetches static character asset parameters, weapons indices, and maps cache fields.
- `ChatService` **[CLIENT_PRESENTATION]** - Feeds live scrolling boards room text blocks.
- `OnlineGameService` & `OnlineGameState` **[SERVER_AUTHORITY]** - Feeds live fight statistics.
- `RoomService` & `RoomWaitState` **[SERVER_AUTHORITY]** - Handles wait rooms status data maps.
- `LobbyService` **[SERVER_AUTHORITY]** - Houses matching active rooms tables.

### Flame Game System Components
- `ArmyGame` **[FRAMEWORK_REPLACE]** - Base game tick engine canvas.
- `DestructibleTerrain` **[RUNTIME_PORT]** - Tracks alpha bit arrays mask modifications.
- `LegacyMapParser` **[RUNTIME_PORT]** - Parses binary compressed map layouts.
- `CharacterComponent` **[CLIENT_PRESENTATION]** - Draws active animation sets.
- `EquipmentLayerComponent` **[CLIENT_PRESENTATION]** - Composites weapon or armor layers onto character bones.
- `BulletSimulator` **[RUNTIME_PORT]** - Updates ballistic trajectory equations tick-by-tick.
- `PlayerMovementSystem` **[RUNTIME_PORT]** - Coordinates frame velocity shifts.
- `PlayerCollisionSystem` **[RUNTIME_PORT]** - Performs continuous pixel intersection checking against terrain masks.

---

## 2. Complete Asset Catalog Paths Checklist

The following standard legacy media folders are integrated into the application manifest bundle:
1. `assets/gui/` - Panel textures, window frames, loading dialog vectors, buttons.
2. `assets/map/` - Level specific environment maps, brick sets, icon definitions.
3. `assets/map/bgItem/` - Background foliage decorations, castles, ambient objects.
4. `assets/item/` - Battle inventory graphics items (e.g., icons for bullets, teleports).
5. `assets/equip/` - Sprite sheets containing class armor fragments, weapons, hairstyles.
6. `assets/effect/` - Custom legacy `effect` pack containments (Explosions, smoke strips).
7. `assets/sound/` / `assets/music/` - Sound effect sfx clips and looping tracker music tracks.

