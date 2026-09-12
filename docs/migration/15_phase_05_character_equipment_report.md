# Phase 5 Character and Equipment Rendering Skeleton

## Status

`BLOCKED_CHARACTER_ASSETS`

## Audited client sources

- `player/CPlayer.java`, `player/PM.java`
- `Equipment/Equip.java`, `EquipGlass.java`, `PlayerEquip.java`, `TypeEquip.java`
- `model/AvatarInfo.java`, `FrameImage.java`

## Server comparison

- `server/Equip.java`, `Glass.java`, `GameData.java`
- Equipment geometry originates from data fields `x`, `y`, `w`, `h`, `dx`, and `dy`; bullet and glass/type ownership are data-driven.

## Confirmed composition behavior

Legacy `PlayerEquip.paint` invokes layers in this order: gun, wing, face/body base, hat, armor, glasses. The new skeleton reserves explicit priorities and keeps geometry outside render methods. Exact body/face ownership remains asset-dependent.

## Implemented

- Character definition, appearance, immutable animation state, and facing.
- Equipment slot and per-frame source/offset geometry.
- Equipment manifest parser with duplicate and frame-size validation.
- Atlas-backed sprite resolver with missing-equipment fallback.
- Layer components and character composition component.
- Delta-time animation controller supporting idle, walk, aim, fire, hurt, and death states.
- Runtime appearance replacement without recreating the whole game.
- Tests for geometry, immutability, animation timing, and legacy layer ordering.

## Blockers

Real character sprites, equipment atlases, frame names, and complete per-character anchor data are absent from the supplied Markdown. Therefore no real character is claimed rendered and no visual golden can be accepted.
