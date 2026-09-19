# Known Behavior Differences

## Physics and Gameplay
- **Fixed-Point Rounding:** Minor potential rounding deltas between Java's native 32-bit float/integer casts and Dart's standard 64-bit precision integers if bit masking isn't strictly enforced.

## UI/UX Differences
- **Frame Rate Independence:** Flame engine operates via tick durations whereas legacy client was bound directly to hardware paint cycles.

## Network / Handling
- **TCP Stream Chunking:** Dart streams emit varying chunk packet boundaries compared to older synchronous `DataInputStream` readers. Emulated perfectly via custom stream slice buffers.
