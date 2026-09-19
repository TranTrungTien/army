# State Machine Matrix

This document defines the 11 formal state machines governing the application lifecycle, connection authentication, synchronization data, battle gameplay loops, and transactional states.

---

## 1. Application Lifecycle State Diagram
```mermaid
stateDiagram-v2
    [*] --> Bootstrap : App Boot
    Bootstrap --> AssetsLoaded : AssetManifest Parsed Successfully
    Bootstrap --> ErrorCrash : Asset Manifest Corruption Exception
    AssetsLoaded --> LoginScreen : Init GoRouter Views
    LoginScreen --> Backgrounded : App lifecycle pause
    Backgrounded --> LoginScreen : App lifecycle resume
```

## 2. Authentication State Diagram
```mermaid
stateDiagram-v2
    [*] --> Unauthenticated : Socket Closed
    Unauthenticated --> HandshakeSent : Connect TCP Sockets
    HandshakeSent --> HandshakeSuccess : Receive Session Key
    HandshakeSuccess --> Authenticating : Send LOGIN Opcode 1
    Authenticating --> Authenticated : Receive LOGIN_SUCCESS Opcode 3
    Authenticating --> Unauthenticated : Receive LOGIN_FAIL Opcode 4
    Authenticated --> Unauthenticated : Handle Socket Disconnect
```

## 3. Data Sync State Diagram
```mermaid
stateDiagram-v2
    [*] --> Idle : Login Completed
    Idle --> SyncingFilePack : Receive GET_FILEPACK Opcode 90
    SyncingFilePack --> DataPopulated : Accumulate All Buffer Slices
    SyncingFilePack --> Disconnected : Timeout / Data Corruption Error
    DataPopulated --> Operational : Load Models Cache
```

## 4. Lobby State Diagram
```mermaid
stateDiagram-v2
    [*] --> LobbyIdle : Transition to Lobby Screen
    LobbyIdle --> FetchingRooms : Send REQUEST_ROOMLIST Opcode 6
    FetchingRooms --> LobbyIdle : Receive ROOM_LIST Opcode 6
    LobbyIdle --> JoiningBoard : Send JOIN_BOARD Opcode 8
```

## 5. Room State Diagram
```mermaid
stateDiagram-v2
    [*] --> WaitingRoom : Board Join Success
    WaitingRoom --> TeamChanged : Send CHANGE_TEAM Opcode 71
    TeamChanged --> WaitingRoom : Receive CHANGE_TEAM Broadcast
    WaitingRoom --> ReadyState : Send READY Opcode 16
    ReadyState --> GameStarting : Receive START_ARMY Opcode 20 (Server Triggered)
```

## 6. Match State Diagram
```mermaid
stateDiagram-v2
    [*] --> MatchLoading : Room Game Countdown Reached
    MatchLoading --> TurnLoop : Assets Bundles Injected Into Viewport
    TurnLoop --> WeaponFired : Client Submits Input Vectors
    WeaponFired --> TrajectoryEvaluation : Simulate Projectile Steps
    TrajectoryEvaluation --> TurnLoop : Next Player Turn Opcode 24
    TurnLoop --> MatchEnded : Receive FINISH Opcode 51
```

## 7. Player State Diagram
```mermaid
stateDiagram-v2
    [*] --> Spawned : Placed on Spawn Points
    Spawned --> Walking : Process Move Input Opcode 21
    Walking --> Spawned : Apply Velocity Reconcile Coordinates
    Spawned --> Damaged : Hit Confirmation Decrements HP
    Damaged --> Dead : HP Drops to Zero
```

## 8. Projectile State Diagram
```mermaid
stateDiagram-v2
    [*] --> Ignited : Player Presses Fire Key
    Ignited --> Traveling : Evaluate Next Ballistic Coordinates Frame-by-Frame
    Traveling --> TerrainHit : Intersect Destructible Alpha Matrix
    TerrainHit --> Exploded : Mutation Applied local Canvas
```

## 9. Item Status State Diagram
```mermaid
stateDiagram-v2
    [*] --> Available : Equipment Loaded
    Available --> Selected : Inventory Active Focus Toggle
    Selected --> Consumed : Sent USE_ITEM Opcode 26 to Server
```

## 10. Boss State Diagram
```mermaid
stateDiagram-v2
    [*] --> Sleeping : Scenario Initialized
    Sleeping --> Enraged : HP Decreases below threshold
    Enraged --> Defeated : Server validates Boss Defeated
```

## 11. Shop Transaction State Diagram
```mermaid
stateDiagram-v2
    [*] --> Browsing : Open Shop UI Layer
    Browsing --> ValidatingPurchase : Send BUY_EQUIP Opcode 104
    ValidatingPurchase --> InventoryUpdated : Success (Server Updates Currency Database)
    ValidatingPurchase --> Browsing : Insufficient Funds / Failure Branch
```
