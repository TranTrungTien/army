# Phase 4 Map Loading and Tile Rendering Skeleton

## Status

`BLOCKED_REAL_ASSETS`

## Source audit

Client: `MapFile`, `CMap`, `MM`, `Background`, `MapImage`, `ManagerTile`, plus `CRes.getShort`.
Server: `server.Map`, `war.MapData`, and database-backed map metadata.

## Confirmed legacy payload

- Big-endian unsigned 16-bit map width.
- Big-endian unsigned 16-bit map height.
- One byte brick count.
- For each brick: one byte tile/material ID, signed 16-bit X, signed 16-bit Y.
- Environment metadata is a separate five-short array: background ID, background Y, cloud Y, water Y, water/glass class.
- Spawn points are server metadata, not part of this client brick payload.

## Implemented

- Immutable map, layer, tileset, environment, brick, and spawn definitions.
- Bounds-checked parser with explicit truncation and trailing-byte failures.
- Repository/data-source boundary.
- Flame background, terrain skeleton, spawn debug overlay, and map world replacement controller.
- Map switching removes the previous component before mounting the next.
- Synthetic parser fixture used only for structural tests.

## Deferred

- Real tile sprites, backgrounds, collision masks, and real-map snapshots are blocked by absent binary assets.
- Destructible terrain is intentionally deferred to Phase 18.
- Placeholder rectangles visually mark brick bounds but are not counted as real rendering parity.
