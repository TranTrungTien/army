# 02 Java to Dart Mapping

## Mapping principles

- Java source specifies behavior, not the target architecture.
- One Java class may map to multiple Dart files; compatibility wrappers may map to none.
- Flutter owns application UI, navigation, forms, dialogs, chat, inventory, and HUD overlays.
- Flame owns world rendering, components, camera, effects, input runtime, and the frame loop.
- Riverpod owns application/domain state, never per-frame position or animation state.
- Networking cannot mutate Widgets or Flame components directly.

## Primary mapping

- `MainGame`, `GameMidlet`, launchers -> `main.dart`, bootstrap, lifecycle coordinator.
- `CCanvas`, `CScreen`, screen classes -> Flutter router, feature screens, overlays.
- `mGraphics`, `Graphics`, `mImage`, `Image`, `Sprite` -> Flame Canvas/Sprite/SpriteSheet and scoped asset repositories.
- `mVector`, `mHashtable` -> typed `List<T>` and `Map<K,V>`.
- `mSocket`, `Session_ME`, `Message` -> `dart:io Socket`, incremental codec, session state machine.
- `GameService` -> feature repositories and typed client packet encoders.
- `MessageHandler`, `GameLogicHandler` -> packet registry, typed events, reducers.
- `MM`, `CMap`, `MapFile`, `Background` -> map definitions, repositories, tile/background/terrain components.
- `PM`, `CPlayer` -> player domain model, movement/collision systems, character component.
- `BM`, `Bullet`, `Item` -> projectile definition registry, path source, presentation components.
- `Equipment/*` -> equipment domain data, appearance resolver, layered sprite composition.
- `effect/*` -> scoped Flame effects and camera controller.
- `mSound`, `SoundSystem` -> pooled audio service with lifecycle ownership.
- RMS -> typed local persistence; credentials require secure storage.

## Per-file decisions

The exhaustive per-file classification and preliminary target module are in `00_repository_inventory.csv`. No Java file is considered completed by this preliminary mapping. Method-level classification occurs in its owning implementation phase.
