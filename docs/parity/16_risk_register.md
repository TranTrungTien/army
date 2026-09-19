# Risk Register

This artifact details all identified technical risks associated with the codebase migration, protocol compatibility layer, and deterministic physics execution pipelines.

---

## 1. Active Technical Risks

### RISK-01: Rolling XOR Encryption State De-synchronization
- **Description:** Java Server implements sequential key rolling on every byte stream transaction (`XorCodec`). In asynchronous Dart flows, if multiple packets write concurrently without synchronization, the encryption keys will become out of sync.
- **Impact:** **CRITICAL**. Disconnects the player instantly upon turning, moving, or firing.
- **Mitigation Plan:** Implement a serial task queue or single-lock mutex wrapper within `TcpSession` ensuring that all outbound payloads are encoded sequentially in exact thread-safe FIFO order.

### RISK-02: Fixed-Point Multi-Platform Arithmetic Variance
- **Description:** Legacy coordinate physics parameters depend on custom 32-bit bit masks and lookup tables. Dart's numbers run natively at 64-bit precision.
- **Impact:** **HIGH**. Small rounding drifts compound frame-by-frame, causing projectiles to land at different pixel offsets on the client versus the server authority.
- **Mitigation Plan:** Wrap math parameters explicitly using the strict bit truncation rules specified in `JavaInt32`, and execute the `test/fixtures/legacy_math_golden.json` baseline suite on every commit loop.

### RISK-03: Destroyable Terrain Alpha Mask Stream Boundary Exceptions
- **Description:** Exploded coordinates change bitmap alphas in `DestructibleTerrain`. Differences in file formats or memory alignment might leak boundary limits.
- **Impact:** **HIGH**. App crashes or memory out-of-bound errors occur when standard heavy weapons are fired near map edges.
- **Mitigation Plan:** Add strict min/max boundary constraints matching J2ME width/height checks inside `makeHole` calculations.

### RISK-04: Multi-packet Fragment Streaming Corruptions
- **Description:** Large server payloads (like map definitions from opcode 90) can be split across network frames.
- **Impact:** **MEDIUM**. Missing sub-asset buffers break the map loading states.
- **Mitigation Plan:** Maintain an internal accumulation packet slice buffer that checks the declared frame length headers before invoking the de-serializer layers.

