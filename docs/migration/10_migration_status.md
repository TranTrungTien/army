# 10 Migration Status

## Phase 0 status

- Status: `PARTIALLY_COMPLETE`
- Repository tree coverage: `COMPLETE` for paths represented in the two supplied Markdown structure trees.
- Client Java inventory records: `172/172`.
- Server Java inventory records: `91/91`.
- Preliminary port/replace/reference decision: `336/336` listed files.
- Import dependency edges: generated for embedded file bodies.
- Method-level classification: `NOT_STARTED`, intentionally deferred to each owning phase because full bodies are unavailable for some files.
- Gameplay implementation: `NOT_STARTED`, forbidden in Phase 0.

## Gate assessment

- Every listed Java file appears in inventory: `PASS`.
- Required package groups represented: `PASS`.
- Every listed file has preliminary classification: `PASS`.
- Every unresolved behavior has ID: `PASS`.
- Complete body and method audit against original repositories: `BLOCKED` by files with `content_available=NO`.

## Next allowed work

Phase 1 foundation may begin without claiming full source parity. Before a source file is ported in later phases, its complete body, call sites, fields, subclasses/interfaces, packet usage, assets, and server counterpart must be re-audited.


## Phase 1

- Status: `PARTIALLY_COMPLETE_RUNTIME_NOT_VERIFIED`
- Foundation implementation: complete.
- Runtime analyzer/test/build: blocked because Flutter SDK is unavailable in the execution environment.
- Next phase: Phase 2 may begin for legacy math, but Phase 1 must be runtime-verified before milestone acceptance.


## Phase 2

- Status: `PARTIALLY_COMPLETE_DART_RUNTIME_NOT_VERIFIED`.
- Java oracle golden generation: `PASS`.
- Dart implementation and test sources: `COMPLETE`.
- `flutter analyze` / `flutter test`: `BLOCKED_ENVIRONMENT`.
- No unresolved angle convention within `CRes` helper semantics; projectile usage parity remains deferred.


## Phase 3

- Status: `BLOCKED_ASSET_MISSING`.
- Asset references inventoried: `270`.
- Manifest/parser/conversion/atlas/scoped-cache implementation: `COMPLETE_SOURCE`.
- Real atlas and map acceptance tests: blocked because binary assets are absent from supplied Markdown.
- Flutter analyzer/tests: `BLOCKED_ENVIRONMENT`.


## Phase 4

- Status: `BLOCKED_REAL_ASSETS`.
- Legacy map payload parser/model/repository: `COMPLETE_SOURCE`.
- Flame map/background/debug skeleton and map switching: `COMPLETE_SOURCE`.
- Real maps, tiles, collision masks, and render snapshot: `BLOCKED_ASSET_MISSING`.
- Flutter analyzer/tests: `BLOCKED_ENVIRONMENT`.


## Phase 5

- Status: `BLOCKED_CHARACTER_ASSETS`.
- Character/equipment domain, parser, resolver, layers, animation controller: `COMPLETE_SOURCE`.
- Real character and equipment rendering: `BLOCKED_ASSET_MISSING`.
- Flutter analyzer/tests: `BLOCKED_ENVIRONMENT`.
