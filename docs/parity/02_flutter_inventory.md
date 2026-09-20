# Flutter Dart Inventory

## 1. Application Core (`app/`)
| Class / File | Purpose | Key Responsibilities |
|--------------|---------|----------------------|
| `ArmyApp` | Main Entry | Material/App configuration, router integration. |
| `AppLifecycleCoordinator` | Lifecycle | Managing app foreground/background states and network heartbeat. |
| `AppRouter` | Navigation | GoRouter definition for screen transitions. |

## 2. Shared Core Logic (`core/`)

### 2.1. Assets and Resources
| Class / File | Purpose | Key Responsibilities |
|--------------|---------|----------------------|
| `GameAssetLoader` | Loading | Loading sprites, maps, and fonts from `assets/`. |
| `FilePackDecoder` | Parsing | Decoding legacy `.dat` / `.bin` file packs from Java client. |
| `LegacyRMS` | Compatibility | SharedPreferences wrapper for Java `RMS.java` parity. |
| `MapAssetRepository` | Storage | In-memory cache for game map definitions. |

### 2.2. Legacy Math (Ported from Java)
| Class / File | Purpose | Key Responsibilities |
|--------------|---------|----------------------|
| `FixedPoint` | Physics | Fixed-point arithmetic parity with J2ME math. |
| `LegacyTrigonometry` | Lookup Tables | Sine/Cosine LUT for pixel-perfect trajectory parity. |
| `LegacyCollisionMath` | Geometry | Overlap checks and circle/line intersection for bullets. |

### 2.3. Network Infrastructure
| Class / File | Purpose | Key Responsibilities |
|--------------|---------|----------------------|
| `TcpSession` | Connection | Low-level Socket management and stream handling. |
| `XorCodec` | Security | Rotating XOR encryption parity with `MessageHandler.java`. |
| `ByteReader` / `ByteWriter` | Serialization | Parity with `DataInputStream` / `DataOutputStream`. |
| `MessageDispatcher` | Routing | Mapping command IDs to feature controllers. |
| `DataSyncService` | Synchronization | Managing game state updates from server. |

## 3. Feature Modules (`features/`)

### 3.1. Authentication
| Class / File | Purpose | Key Responsibilities |
|--------------|---------|----------------------|
| `AuthController` | State | Login flow management and session persistence. |
| `AuthStateMachine` | Lifecycle | Handing `Unauthenticated`, `Authenticating`, `Authenticated` states. |
| `SessionPacketMapper` | Network | Translating auth command packets (LOGIN, VERSION). |
| `LoginScreen` | Presentation | Login UI with username/password fields. |

### 3.2. Gameplay (Flame Engine Integration)
| Class / File | Purpose | Key Responsibilities |
|--------------|---------|----------------------|
| `ArmyGame` | Engine | Flame `FlameGame` implementation managing the loop. |
| `GameplayController` | Logic | Coordinating player turns and match events. |
| `MatchState` | Domain | Representing the current state of players, HP, and wind. |
| `CharacterComponent` | Actor | Sprite-based rendering and animation for players. |
| `MapComponent` | Terrain | Destructible terrain rendering via pixel masks. |
| `ProjectileComponent` | Physics | Active bullet actor with simulated trajectory. |
| `TrajectorySimulator` | Prediction | Rendering the aim guide based on power/angle/wind. |
| `GroundProbe` | Collision | System for detecting player grounding on terrain. |
| `CombatSystem` | System | Handling damage calculation and HP updates. |
| `CameraSystem` | System | Managing camera follow and screen shake. |

## 4. Presentation & Widgets
| Screen / Widget | Module | Purpose |
|-----------------|--------|---------|
| `SplashScreen` | Auth | Initial loading and version check. |
| `ServerSelectionScreen` | Auth | Choice of game clusters/servers. |
| `OnlineGameScreen` | Gameplay | The main active battle interface. |
| `GameplaySandboxScreen` | Gameplay | Offline testing environment for physics. |
| `MapDebugOverlay` | Gameplay | Visualizing collision masks and path nodes. |
