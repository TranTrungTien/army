# 01 Dependency Graph

## Entry-point graph

```text
AndroidLauncher / DesktopLauncher / IOSLauncher
  -> MainGame
  -> GameMidlet.initGame
  -> CCanvas
  -> SplashScr
  -> ServerListScreen
  -> LoginScr
  -> MenuScr
  -> RoomListScr / BoardListScr
  -> PrepareScr
  -> GameScr
```

## Gameplay graph

```text
GameScr
  -> PM -> CPlayer
  -> BM -> Bullet -> effects
  -> MM -> CMap -> MapFile / Background / HoleInfo
  -> Camera
  -> InterfaceComponents.GamePad
  -> GameService -> Session_ME
```

## Network graph

```text
Client: mSocket -> Session_ME -> Message -> MessageHandler -> GameLogicHandler -> screens/runtime
Server: Server -> Session -> MessageHandler -> ControlHandler -> User/RoomWait/MapData
Server outbound: SessionHandler -> io.Message -> Session send queue -> Client MessageHandler
```

## Target event flow

```text
Socket bytes -> Incremental decoder -> Typed packet -> Typed server event
-> Reducer/controller -> Immutable domain state -> Flame synchronization adapter
-> Flame components
```

## High-coupling clusters

- `CCanvas`, `GameMidlet`, `GameScr`, `PM`, `MM`, and `Session_ME` are global-state boundaries and must not be recreated as one Dart singleton.
- `GameScr` is an orchestration god-object candidate. Split presentation, match reducer, runtime adapter, camera, input, and projectile presentation.
- `mGraphics` and `mImage` combine compatibility, coordinate transforms, clipping, assets, and disposal. Replace by scoped Flame/Flutter services.
- Client `GameService` and `MessageHandler` must be audited against server `ControlHandler` and `SessionHandler` command by command.

## Generated dependency evidence

See `01_import_edges.csv`. Edges are based on Java imports only and do not capture same-package references or reflection.
