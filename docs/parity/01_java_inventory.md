# Java Client & Server Inventory

## 1. Java Client Inventory (LibGDX/J2ME Hybrid)

### 1.1. Core Library Abstraction (`CLib`)
These classes provide compatibility between J2ME-based graphics/IO and the LibGDX framework.

| Class | Path | Purpose | Key Methods |
|-------|------|---------|-------------|
| `Graphics` | `core/src/CLib/Graphics.java` | Core drawing API | `drawImage()`, `drawRegion()`, `fillRect()`, `drawString()` |
| `mGraphics` | `core/src/CLib/mGraphics.java` | Wrapper for libGDX Batch | `translate()`, `setClip()`, `drawRegion()`, `drawText()` |
| `Image` | `core/src/CLib/Image.java` | Bitmap storage | `createImage()`, `getRGB()` |
| `mImage` | `core/src/CLib/mImage.java` | LibGDX texture wrapper | `createImage()`, `createImageFromBytes()` |
| `mFont` | `core/src/CLib/mFont.java` | Bitmap font handler | `drawString()`, `getWidth()`, `getHeight()` |
| `mSocket` | `core/src/CLib/mSocket.java` | TCP Socket wrapper | `getInputStream()`, `getOutputStream()`, `close()` |
| `RMS` | `core/src/CLib/RMS.java` | Persistent Storage | `loadRMS()`, `saveRMS()`, `saveRMSInt()`, `loadRMSInt()` |
| `SoundSystem` | `core/src/CLib/SoundSystem.java` | Audio manager | `play()`, `stop()`, `setVolume()` |
| `TField` | `core/src/CLib/TField.java` | Text input component | `keyPressed()`, `paint()`, `setText()` |

### 1.2. Game Models and Logic (`model`, `item`, `Equipment`, `map`)

| Class | Path | Purpose | Key Methods |
|-------|------|---------|-------------|
| `PlayerInfo` | `core/src/model/PlayerInfo.java` | User profile data | `getLevel()`, `getExp()`, `getMoney()` |
| `UserData` | `core/src/model/UserData.java` | Account state | `load()`, `save()` |
| `CMap` | `core/src/map/CMap.java` | Game map & collision | `loadMap()`, `isCollide()`, `makeHole()` |
| `Bullet` | `core/src/item/Bullet.java` | Projectile physics | `update()`, `paint()`, `onCollision()` |
| `Item` | `core/src/item/Item.java` | Consumable items | `use()`, `update()`, `paint()` |
| `Equip` | `core/src/Equipment/Equip.java` | Wearable items | `load()`, `getAttributes()` |
| `Fomula` | `core/src/model/Fomula.java` | Math utilities | `sin()`, `cos()`, `atan2()`, `getAngle()` |

### 1.3. Networking (`network`)

| Class | Path | Purpose | Key Methods |
|-------|------|---------|-------------|
| `Message` | `core/src/network/Message.java` | Packet data structure | `reader()`, `writer()`, `getCommand()` |
| `Session_ME` | `core/src/network/Session_ME.java` | TCP session lifecycle | `connect()`, `sendMessage()`, `doSendMessage()` |
| `MessageHandler` | `core/src/network/MessageHandler.java` | Message processing | `onMessage()`, `onConnectOK()`, `onDisconnected()` |
| `GameLogicHandler` | `core/src/network/GameLogicHandler.java` | High-level game events | `onLoginSuccess()`, `onGameStart()`, `onMove()` |

---

## 2. Java Server Inventory (TCP Socket Server)

### 2.1. Server Infrastructure (`mobiarmy.server`, `mobiarmy.io`)

| Class | Path | Purpose | Key Methods |
|-------|------|---------|-------------|
| `Server` | `src/mobiarmy/server/Server.java` | Server entry point | `main()`, `init()`, `start()` |
| `SessionManager` | `src/mobiarmy/server/SessionManager.java` | Client session tracker | `addUser()`, `removeUser()`, `findUserById()` |
| `DBManager` | `src/mobiarmy/server/DBManager.java` | MySQL database bridge | `execute()`, `select()`, `update()` |
| `Session` | `src/mobiarmy/server/Session.java` | Individual client link | `sendMessage()`, `requestDisconnect()` |
| `MessageHandler` | `src/mobiarmy/server/MessageHandler.java` | Encryption & framing | `readMessage()`, `doSendMessage()`, `setKey()` |
| `User` | `src/mobiarmy/server/User.java` | Online player state | `login()`, `save()`, `connect()` |

### 2.2. Game War Logic (`mobiarmy.war`)

| Class | Path | Purpose | Key Methods |
|-------|------|---------|-------------|
| `Room` | `src/mobiarmy/war/Room.java` | Game lobby/instance | `addPlayer()`, `removePlayer()`, `startGame()` |
| `Player` | `src/mobiarmy/war/Player.java` | In-game player actor | `move()`, `shoot()`, `updateHP()` |
| `Gun` | `src/mobiarmy/war/Gun.java` | Weapon data | `getAngle()`, `getPower()` |
| `Boss` | `src/mobiarmy/war/Boss/Boss.java` | AI controller | `nextTurn()`, `doAction()` |
| `PathSimulator` | `src/mobiarmy/war/PathSimulator.java` | Trajectory prediction | `getTrajectory()`, `checkCollision()` |

---

## 3. Network Command Constants

### 3.1. Client to Server (Request IDs)
| Constant | ID | Description |
|----------|----|-------------|
| `LOGIN` | 1 | Auth request |
| `LOGOUT` | 2 | End session |
| `CHAT_TO` | 5 | Private message |
| `REQUEST_ROOMLIST` | 6 | Get zones |
| `REQUEST_BOARDLIST` | 7 | Get tables in zone |
| `JOIN_BOARD` | 8 | Join specific table |
| `LEAVE_BOARD` | 15 | Exit table |
| `READY` | 16 | Toggle ready state |
| `START_ARMY` | 20 | Host starts game |
| `MOVE_ARMY` | 21 | Move left/right |
| `FIRE_ARMY` | 22 | Shoot projectile |
| `USE_ITEM` | 26 | Use consumable |
| `SKIP` | 49 | Skip turn |
| `DIE` | 60 | Player death notification |

### 3.2. Server to Client (Response IDs)
| Constant | ID | Description |
|----------|----|-------------|
| `LOGIN_SUCCESS` | 3 | Auth granted |
| `LOGIN_FAIL` | 4 | Auth denied |
| `SOMEONE_JOINBOARD` | 12 | Peer entry |
| `SOMEONE_LEAVEBOARD` | 14 | Peer exit |
| `START_ARMY` | 20 | Game session start |
| `NEXT_TURN` | 24 | Switch active player |
| `SHOOT_RESULT` | 23 | Explosion details |
| `UPDATE_HP` | 51 | Health change |
| `WIND` | 25 | Change wind vector |
| `RANDOM_ITEM` | 59 | Item drop |
| `GAME_RESULT` | 37 | XP/Money rewards |

---

## 4. Persistent Storage & Databases

### 4.1. RMS Records (Client Persistence)
- `ipArmy2`: Stores server IP/host configuration.
- `Graphic`: UI quality settings (integer).
- `ARMY2` / `AMRY2`: IP string cache.
- Version Tags: `iconversion2`, `valuesversion2`, `playerVersion2`, `equipVersion2`, `levelCVersion2`.

### 4.2. MySQL Schema (Server Database)
- `user`: Account credentials (username, password, id).
- `equip`: Equipment metadata and attributes.
- `exp`: Level progression mapping.
- `glass`: Bullet/glass attribute data.
- `item`: Consumable item metadata.
- `linhtinh`: Misc items/materials metadata.
- `map`: Terrain and background definition data.
- `map_boss`: Boss specific map configuration.
- `mission`: Daily/Achievement definitions.
- `shop_equipment`: Inventory available for purchase.
