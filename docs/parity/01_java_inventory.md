# Java Client and Server Code Inventory

This document forms the baseline snapshot of the Java subsystems, outlining all core packages, components, critical methods, networks, persistent tables, and classifications.

---

## 1. Subsystem Catalog & Classifications

Each Java component is tagged with its operational destination profile to enforce architectural clarity:
- **[RUNTIME_PORT]**: Strict bit-level or formulaic translation required.
- **[FRAMEWORK_REPLACE]**: Absorbed by modern framework primitives.
- **[FEATURE_MERGE]**: Combined into consolidated components.
- **[DEPRECATED_REACHABLE]**: Kept accessible via matching opcodes but hidden from clean paths.
- **[UNCALLED]**: Omitted completely or replaced by logging.
- **[PLATFORM_SPECIFIC]**: Replaced by cross-platform abstractions.
- **[SERVER_AUTHORITY]**: Validated only as incoming packet streams.
- **[CLIENT_PRESENTATION]**: Rendered using Flame UI layers.

### Java Client Package Inventory (`MobiArmy2-Client`)

#### CLib/
- `Main.java` **[FRAMEWORK_REPLACE]** - LibGDX window orchestrator loops.
- `Graphics.java`, `mGraphics.java`, `TemGraphics.java` **[FRAMEWORK_REPLACE]** - Low-level canvas clip regions and coordinate scaling bounds.
- `Image.java`, `mImage.java` **[FRAMEWORK_REPLACE]** - Texture reference containers.
- `mHashtable.java` **[FRAMEWORK_REPLACE]** - Legacy key mapping data collection structures.
- `mVector.java` **[FRAMEWORK_REPLACE]** - Legacy dynamic indexing storage array lists.
- `mSocket.java` **[RUNTIME_PORT]** - Raw socket connections management.
- `RMS.java` **[RUNTIME_PORT]** - Persistence mapping interface layer.
  - *Public Methods:* `public static byte[] loadRMS(String filename)`, `public static void saveRMS(String filename, byte[] data)`.
- `Sprite.java` **[FRAMEWORK_REPLACE]** - Frame transformation and drawing sequences.

#### com.teamobi.mobiarmy2/
- `GameMidlet.java`, `TemMidlet.java` **[FRAMEWORK_REPLACE]** - Application lifecycle bootstrap states.
- `MainGame.java` **[FRAMEWORK_REPLACE]** - LibGDX framework screens conductor.

#### effect/
- `Camera.java` **[FRAMEWORK_REPLACE]** - Screen viewport look-at shifts.
- `Explosion.java`, `Smoke.java`, `Snow.java`, `Tornado.java` **[CLIENT_PRESENTATION]** - Particle animation controllers.

#### Equipment/
- `Equip.java`, `EquipGlass.java`, `PlayerEquip.java` **[RUNTIME_PORT]** - Accessory modifiers.

#### item/
- `Bullet.java` **[RUNTIME_PORT]** - Critical frame-bound physics tracking engine.
  - *Methods:* `public void nextPosition()`, `public void checkCollision()`.

#### map/
- `CMap.java` **[RUNTIME_PORT]** - Destructible pixel grid array arrays.
  - *Methods:* `public void loadMap(byte[] mapData)`, `public void makeHole(int x, int y, int radius)`.

#### network/
- `Cmd_Client2Server.java`, `Cmd_Server2Client.java` **[RUNTIME_PORT]** - Protocol code enumerations.
- `Message.java` **[RUNTIME_PORT]** - Stream structure arrays.
- `Session_ME.java` **[RUNTIME_PORT]** - Encrypted stream listeners.
  - *Methods:* `public void sendMessage(Message msg)`, `public void run()`.

---

## 2. Command Constants Matrix

The client-server communications channel depends on these deterministic opcode commands:

### Client-to-Server Opcode Map (`Cmd_Client2Server`)
- `LOGIN = 1`
- `LOGOUT = 2`
- `CHAT_TO = 5`
- `REQUEST_ROOMLIST = 6`
- `REQUEST_BOARDLIST = 7`
- `JOIN_BOARD = 8`
- `CHAT_TO_BOARD = 9`
- `KICK = 11`
- `LEAVE_BOARD = 15`
- `READY = 16`
- `SET_MONEY = 19`
- `START_ARMY = 20`
- `MOVE_ARMY = 21`
- `FIRE_ARMY = 22`
- `SHOOT_RESULT = 23`
- `WIND = 25`
- `USE_ITEM = 26`
- `JOIN_ANY_BOARD = 28`
- `REQUEST_FRIENDLIST = 29`
- `PING = 42`
- `VERSION = 48`
- `SKIP = 49`
- `NEXT_TURN = 63`
- `CHOOSE_ITEM = 68`
- `CHOOSE_GUN = 69`
- `CHOOSE_MAP = 70`
- `CHANGE_TEAM = 71`
- `BUY_ITEM = 72`
- `GETSTRING = 127`

### Server-to-Client Opcode Map (`Cmd_Server2Client`)
- `LOGIN_SUCESS = 3`
- `LOGIN_FAIL = 4`
- `ROOM_LIST = 6`
- `BOARD_LIST = 7`
- `JOINBOARD_SUCCESS = 8`
- `SOMEONE_JOINBOARD = 12`
- `SOMEONE_LEAVEBOARD = 14`
- `SOMEONE_READY = 16`
- `GAME_RESULT = 37`
- `USER_DATA = 40`
- `PING = 42`
- `SERVER_MESSAGE = 45`
- `VERSION = 48`
- `STOP_GAME = 50`
- `UPDATE_HP = 51`
- `UPDATE_XY = 53`
- `RANDOM_ITEM = 59`
- `DIE = 60`
- `GET_FILEPACK = 90`
- `LUCKY = 100`
- `INVENTORY = 101`
- `SHOP_EQUIP = 103`
- `UPDATE_MONEY = 105`
- `FREEZE = 107`
- `POISON = 108`
- `TIME_BOMB = 109`

---

## 3. Persistent Storage Mapping (RMS / Cache Records)

Legacy storage records serialization formats:
1. `acc_creds` - Stores standard login session preferences: `[String username, String hash_or_raw_pass]`.
2. `game_settings` - Stores application audio states and custom mappings: `[boolean bgm_enabled, boolean sfx_enabled, byte touch_layout_index]`.

---

## 4. Server SQL Schema Inventory

Important game data definitions from the server MySQL definitions:

### A. Table: `shop_equipment`
- `id` (smallint) - Absolute item primary identifier.
- `glassID` (tinyint) - Character class category grouping.
- `equipId` (smallint) - Frame sheet visual index reference identifier.
- `name` (varchar) - Visual display text.
- `xu` (int) / `luong` (smallint) - Cost values.
- `inv_ability` (longtext JSON) - Flat absolute stat increment array `[HP, Attack, Defense, Team, Luck]`. For instance: `[0, 6, 0, 0, 0]`.

### B. Table: `map`
- `id` (tinyint) - Unique level layout selector code.
- `name` (varchar) - Visual map designation string.
- `file` (varchar) - Target file path pack pointer.

### C. Table: `item`
- `id` (tinyint) - Primary game item slot enumeration.
- `name` (varchar) - Battle items item definition text (e.g. Teleport, B52, Freeze).

