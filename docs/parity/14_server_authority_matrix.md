# Server Authority Matrix

This document details the exact communication graphs for the 26 game loops, establishing call workflows, packet opcodes, error branches, and strict boundaries of Server Authority.

---

## 1. Scope Core Architectural Rules

### A. Client Render vs Server Validation Boundaries
- **Physics Trajectory Engine:** The client simulation (`BulletSimulator`) calculates trajectory arcs frame-by-frame *exclusively for presentation drawing layers*. The server executes an identical formula layout. The server holds total authority over whether a projectile hits or misses.
- **Player Damage:** Entirely server-authoritative. The client never decrements player health based on local collision prediction. It must wait for the definitive `UPDATE_HP` packet.

### B. Synchronization Rules
- **Player Position Reconciliation:** The client transmits position changes using `MOVE_ARMY`. The server replies with an authoritative position validation packet. If the values differ, the client must snap the player component back to the server-provided values.
- **Terrain Mutation:** When a bomb explodes, the server transmits `CHECK_MAKE_HOLE`. The client mutates its destructive bit array canvas *only after receiving this explicit authorization packet*.

---

## 2. 26 Core Business Flows Graph Analysis

### Luồng 1: App Launch
- **Trigger:** Operating system initializes the application task process.
- **Java Caller/Callee:** `AndroidLauncher` -> `MyGdxGame` -> `GameMidlet`.
- **Packets:** None.
- **State Mutated:** Lifecycle transitions to initializing bounds.
- **Flutter Equivalent:** `lib/main.dart` -> `BootstrapScreen`.
- **Gaps:** None. Completely handled by standard Flutter bootstrap.

### Luồng 2: Asset Bootstrap
- **Trigger:** Application transition into active initialization state.
- **Java Caller/Callee:** `GameMidlet` -> `FilePack.load()`.
- **Packets:** None.
- **Flutter Equivalent:** `lib/app/lifecycle/` loading assets from standard asset pathways.

### Luồng 3: Server-list Load
- **Trigger:** View navigation onto cluster endpoints nodes display.
- **Java Caller/Callee:** `ServerListScreen.show()`.
- **Packets:** None. (Cached local list or static bundle config).
- **Flutter Equivalent:** `ServerSelectionScreen` driven by Riverpod `ServerCatalog`.

### Luồng 4: Connect
- **Trigger:** Selecting a target game server entry endpoint.
- **Java Caller/Callee:** `ServerListScreen` -> `mSocket.connect()`.
- **Packets:** Establish low level raw TCP socket bounds connection.
- **Failure Branch:** Network timeout triggers fallback dialogue overlay.
- **Flutter Equivalent:** `TcpSession` using `Socket.connect`.

### Luồng 5: Key Handshake
- **Trigger:** TCP Socket connection open acknowledgment event.
- **Java Caller/Callee:** `Session_ME.run()` listener loops.
- **Packets Received:** Custom raw session initialization key bytes chunk sequences.
- **State Mutated:** `XorCodec` updates dynamic encryption key tracking variables.
- **Flutter Equivalent:** `XorCodec.setKey` in `tcp_session.dart`.

### Luồng 6: Login
- **Trigger:** Click the credentials sign-in submit button UI component.
- **Java Caller/Callee:** `LoginScr` -> `Cmd_Client2Server.LOGIN` Opcode 1.
- **Packets Sent:** `LOGIN` payload containing username and hash.
- **Packets Received:** `LOGIN_SUCESS` Opcode 3 or `LOGIN_FAIL` Opcode 4.
- **Flutter Equivalent:** `AuthRepository.login` and `AuthController`.

### Luồng 7: Post-login
- **Trigger:** Successful validation authorization response from server.
- **Java Caller/Callee:** `MessageHandler.processMessage` handling Opcode 3.
- **State Mutated:** User session shifts status flag to authenticated.
- **Flutter Equivalent:** `PostLoginService` mapping profile states data.

### Luồng 8: Dynamic Data Sync
- **Trigger:** Entry flow setup hooks after initial profile validation.
- **Java Caller/Callee:** `GameMidlet` -> Opcode 90 `GET_FILEPACK` query loop.
- **Packets Received:** Chunk byte buffers containing compressed binary game definitions asset sets.
- **Flutter Equivalent:** Riverpod `DataSyncService`.

### Luồng 9: Main Menu
- **Trigger:** Post login configuration caching sequences finish.
- **Java Caller/Callee:** `MenuScr.show()`.
- **Flutter Equivalent:** Routing node view switches context onto main features grid layout.

### Luồng 10: Room List
- **Trigger:** Click the network game play button item.
- **Java Caller/Callee:** `RoomListScr` sends Opcode 6 `REQUEST_ROOMLIST`.
- **Packets Received:** Opcode 6 `ROOM_LIST` housing matrix profiles.
- **Flutter Equivalent:** `LobbyService` provider updates state mappings.

### Luồng 11: Board List
- **Trigger:** Selecting a room index node item layer.
- **Java Caller/Callee:** `BoardListScr` sends Opcode 7 `REQUEST_BOARDLIST`.
- **Flutter Equivalent:** Room board navigations list UI components.

### Luồng 12: Join Room
- **Trigger:** Clicking a specific active board slot node item.
- **Java Caller/Callee:** Send Opcode 8 `JOIN_BOARD`.
- **Packets Received:** Opcode 8 `JOINBOARD_SUCCESS` or Opcode 17 `JOINBOARD_FAIL`.
- **Flutter Equivalent:** `RoomService` updates internal wait lists profiles map.

### Luồng 13: Ready/Start
- **Trigger:** Clicking room player readiness confirmation checkbox button.
- **Java Caller/Callee:** Send Opcode 16 `READY`. Server broadcasts Opcode 20 `START_ARMY`.
- **Flutter Equivalent:** Riverpod tracking notifier handles state switches.

### Luồng 14: Match Init
- **Trigger:** Broadcast receipt of starting opcode frame sequence.
- **Java Caller/Callee:** `GameScr.loadMap()` -> initializing terrain layouts viewports.
- **Flutter Equivalent:** `ArmyGame` Flame widget lifecycle hook bindings initialize components.

### Luồng 15: Turn Loop
- **Trigger:** Server broadcast managing scheduling order loops.
- **Packets Received:** Opcode 24 `NEXT_TURN` tracking active indices values.
- **Flutter Equivalent:** `GameplayHandler` updates input action validation tokens flags.

### Luồng 16: Move
- **Trigger:** Player holds down left or right controller buttons.
- **Java Caller/Callee:** `GameScr` sends Opcode 21 `MOVE_ARMY`.
- **Packets Received:** Opcode 53 `UPDATE_XY` authoritatively re-positions client layout views.
- **Flutter Equivalent:** `PlayerMovementSystem` updates relative coordinates.

### Luồng 17: Aim
- **Trigger:** Player adjusts barrel height up/down buttons on screen controllers.
- **Java Caller/Callee:** Local changes modify character sprite angles parameters.
- **Packets:** None (Sent only at the final moment of firing).
- **Flutter Equivalent:** `GameplayInputController` hooks update angles state.

### Luồng 18: Shoot
- **Trigger:** Release or hit the firing button overlay item component.
- **Java Caller/Callee:** Send Opcode 22 `FIRE_ARMY` detailing power and coordinates.
- **Flutter Equivalent:** `CombatSystem` captures variables and streams command payload.

### Luồng 19: Projectile Replay
- **Trigger:** Firing opcode broad verification received from network channels.
- **Java Caller/Callee:** `Bullet.nextPosition()` frame tickers begin calculation loops.
- **Flutter Equivalent:** `BulletSimulator` calculates visual flight steps.

### Luồng 20: Damage/Death
- **Trigger:** Server confirms ballistic hit boxes intersect character coordinates.
- **Packets Received:** Opcode 51 `UPDATE_HP` and Opcode 60 `DIE`.
- **Flutter Equivalent:** Character layers flash red and update text labels components.

### Luồng 21: Match Finish
- **Trigger:** Only one team remains active inside server trackers.
- **Packets Received:** Opcode 37 `GAME_RESULT`.
- **Flutter Equivalent:** Displays outcome panel tracking updates rewards values.

### Luồng 22: Return to Room/Lobby
- **Trigger:** Closing result overlays confirmation dialog buttons.
- **Java Caller/Callee:** `GameScr` context switches view pointer nodes back to standard waiting lists.
- **Flutter Equivalent:** GoRouter paths navigate away from Flame layout back onto standard lobbies.

### Luồng 23: Disconnect/Background/Resume
- **Trigger:** User minimises application or network wire failure drop occurs.
- **Java Caller/Callee:** `mSocket.close()` triggers immediate session cleanups routines.
- **Flutter Equivalent:** `AppLifecycleCoordinator` monitors states hooks correctly.

### Luồng 24: Shop/inventory/equipment
- **Trigger:** Toggling custom equipment storage view lists tabs.
- **Java Caller/Callee:** Sends Opcode 104 `BUY_EQUIP` or Opcode 102 `CHANGE_EQUIP`.
- **Flutter Equivalent:** Riverpod data models map stock values items accurately.

### Luồng 25: Clan/friend/mission/ranking/lucky
- **Trigger:** Navigation click actions onto ancillary profile summary pages.
- **Packets:** Mapped to designated command constant indices (`LUCKY = 100`, v.v.).
- **Flutter Equivalent:** Tab views update context blocks synchronously.

### Luồng 26: Boss Mode
- **Trigger:** Setting map selection targeting specific boss layouts scenarios index keys.
- **Java Caller/Callee:** Mapped via `MapBoss` logic validations blocks.
- **Flutter Equivalent:** `SandboxScenario` parameters adjust triggers scripts.
