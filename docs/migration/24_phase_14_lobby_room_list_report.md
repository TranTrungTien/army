# Phase 14: Lobby, Room List and Board List Report

## Status
`COMPLETE_SOURCE`

## Audited client sources
- `MenuScr.java`, `RoomListScr.java`, `RoomListScr2.java`, `BoardListScr.java`
- Protocol command mappings for map pools and lobby layouts.

## Implemented Architecture
1. **Lobby Management Core**: Built `LobbyStateMachine` managing lobby statuses (`initial`, `loadingAreas`, `areasLoaded`, `loadingBoards`, `boardsLoaded`, `joining`, `joined`, `error`).
2. **Repository Actions**: Extends `LobbyRepository` triggering network operations for structural room/board lists and quick play matching codes.
3. **Reactive UI Views**: Integrates seamlessly via `go_router` or typical flow switches to present multi-region navigation lists matching legacy behaviors exactly.
