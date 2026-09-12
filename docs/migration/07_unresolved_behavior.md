# 07 Unresolved Behavior

Every unresolved item has a stable ID. Resolution requires call-site tracing, server comparison, runtime capture, or explicit product decision.

## Items

- `UNR-0001` Asset corpus completeness. Binary PNG, font, audio, map packs, and extensionless resources are not represented fully by Markdown. Blocks visual parity, not Phase 0 documentation.
- `UNR-0002` Embedded source completeness. Files listed in repository trees with `content_available=NO` require retrieval from the original repository before method-level parity claims.
- `UNR-0003` Packet framing variants. Verify normal and large-message length policies byte-for-byte on both directions.
- `UNR-0004` XOR handshake activation and cursor lifetime. Verify commands `-27` and `-28`, independent read/write cursors, reconnect reset, and whether cursors persist across packets.
- `UNR-0005` Java Modified UTF-8 use. Confirm every string field using `DataInputStream/DataOutputStream` semantics and distinguish raw UTF-8 resources.
- `UNR-0006` Coordinate conventions. Reconcile LibGDX Y inversion, J2ME anchors/transforms, map tile origin, projectile coordinates, and Flame world coordinates.
- `UNR-0007` Legacy angle/fixed-point rules. Resolve lookup tables, integer truncation, overflow, and random behavior against server formulas.
- `UNR-0008` `SHOOT_RESULT` timing. Determine exact presentation completion condition for every bullet family.
- `UNR-0009` Empty methods. Each empty method must be classified as placeholder, dead, platform-specific, Flutter replacement, Flame replacement, or unresolved.
- `UNR-0010` Swallowed exceptions. Determine intended fallback behavior for asset, map, RMS, graphics, networking, and disposal catches.
- `UNR-0011` Asynchronous image construction. Existing `postRunnable` APIs may expose partially initialized images. Preserve user-visible behavior but replace unsafe lifecycle.
- `UNR-0012` Hardcoded endpoints and placeholder provider/agent configuration. Determine supported server-selection behavior.
- `UNR-0013` Suspected legacy null bug in `ShopEquipment.paintDetail` (`||` versus `&&`). Verify call sites before fixing and record as a migration note.
- `UNR-0014` Destructible terrain ownership. Confirm exact split between server authoritative collision/position correction and client visual mask mutation.
- `UNR-0015` Bullet matrix completeness. Every client bullet ID, server `Gun` branch, and server bullet subclass requires a registry row in Phase 17.
- `UNR-0016` Boss-map rules and resource dependencies for map IDs 30-39.
- `UNR-0017` Payment and advertising features. Determine deprecated, unsupported, or platform-specific status rather than porting stubs.
- `UNR-0018` Unity subtree ownership. It is a partial migration workspace and is reference-only unless an implementation contains behavior absent from Java core.
