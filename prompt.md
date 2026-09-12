Hoàn toàn có thể. Nhưng để chuyển toàn bộ Java Client sang Flutter + Flame mà không bỏ sót logic, kế hoạch phải dựa trên migration inventory, dependency graph, protocol parity và acceptance test, không chỉ là một chuỗi prompt “hãy port file này”.

Source đích nên dùng Flutter cho application UI, form, chat, dialog và navigation, còn Flame cho game world, camera, component lifecycle, input gameplay, game loop và rendering. Flame hỗ trợ component tree, router cho game page và Flutter overlays đặt trên game canvas, phù hợp với mô hình gameplay + HUD của MobiArmy2.

I. Chiến lược tổng thể
1. Không port 1:1, nhưng phải audit từng file

Quy trình đúng:

Mỗi file Java
→ phân loại trách nhiệm
→ liệt kê public API và side effects
→ xác định dependency
→ ánh xạ sang module Dart
→ port behavior
→ viết test parity
→ cập nhật migration matrix


Một file Java có thể được chuyển thành nhiều file Dart:

CPlayer.java
├── battle_player.dart
├── player_component.dart
├── player_movement_system.dart
├── aiming_controller.dart
├── player_animation_controller.dart
└── player_packet_mapper.dart


Ngược lại, một số compatibility class Java không cần tồn tại trong Dart:

mVector       → List<T>
mHashtable    → Map<K, V>
mSocket       → dart:io Socket
mGraphics     → Flame/Flutter Canvas
mImage        → Sprite, SpriteSheet, Images
MIDlet        → Flutter lifecycle
CCanvas route → Flutter Router hoặc Flame RouterComponent

II. Quy tắc bắt buộc xuyên suốt migration
1. Không tự suy đoán behavior

Nếu chưa hiểu một method Java:

Không bỏ qua.
Không giản lược âm thầm.
Đánh dấu UNRESOLVED.
Truy ngược call site.
Đối chiếu Server.
Viết test hoặc logging để xác minh.
2. Không đổi protocol

Những phần sau phải byte-compatible:

Command ID.
Signed byte.
Big-endian.
Java Modified UTF-8.
Packet framing.
XOR key stream.
Optional field theo command/bullet type.
Thứ tự field.
Timing của SHOOT_RESULT.
3. Không dùng Riverpod hoặc Bloc cho mỗi frame

State cấp ứng dụng:

Connection.
Authentication.
Lobby.
Room.
Match lifecycle.
Inventory.

Dùng Riverpod.

State runtime mỗi frame:

Position interpolation.
Animation frame.
Projectile playback.
Smoke.
Camera.
Screen shake.

Dùng Flame component state.

4. Server là authoritative

Trong online mode:

Client gửi angle + force
→ Server tính trajectory, collision và damage
→ Client phát lại kết quả


Java Client nhận các mảng trajectory rồi cập nhật projectile theo từng điểm, sau đó gửi SHOOT_RESULT khi presentation hoàn tất.

III. Kiến trúc đích Flutter + Flame
lib/
├── main.dart
├── app/
│   ├── bootstrap.dart
│   ├── army_app.dart
│   ├── router/
│   └── lifecycle/
│
├── core/
│   ├── config/
│   ├── diagnostics/
│   ├── errors/
│   ├── extensions/
│   ├── network/
│   │   ├── transport/
│   │   ├── protocol/
│   │   ├── codec/
│   │   ├── command/
│   │   ├── dispatcher/
│   │   └── security/
│   ├── assets/
│   ├── audio/
│   ├── storage/
│   └── legacy_math/
│
├── features/
│   ├── server_selection/
│   ├── authentication/
│   ├── main_menu/
│   ├── lobby/
│   ├── room/
│   ├── gameplay/
│   │   ├── domain/
│   │   ├── application/
│   │   ├── data/
│   │   ├── game/
│   │   │   ├── army_game.dart
│   │   │   ├── world/
│   │   │   ├── camera/
│   │   │   ├── map/
│   │   │   ├── player/
│   │   │   ├── projectile/
│   │   │   ├── effects/
│   │   │   ├── input/
│   │   │   └── systems/
│   │   └── presentation/
│   ├── inventory/
│   ├── equipment/
│   ├── shop/
│   ├── friends/
│   ├── clan/
│   ├── missions/
│   └── settings/
│
├── shared/
│   ├── widgets/
│   ├── dialogs/
│   ├── overlays/
│   └── theme/
│
└── generated/


Flame RouterComponent có thể quản lý các page nằm hoàn toàn trong game component tree. Tuy nhiên với MobiArmy2, tôi khuyến nghị dùng Flutter Router cho login, lobby, shop và room; dùng Flame router/component state bên trong gameplay. Popup, chat, pause và HUD có thể dùng Flame overlays để đặt Flutter Widget lên trên game canvas.

IV. Bộ tài liệu kiểm soát không bỏ sót

Trước khi port code, phải tạo:

docs/migration/
├── 00_repository_inventory.md
├── 01_dependency_graph.md
├── 02_java_to_dart_mapping.md
├── 03_protocol_matrix.md
├── 04_screen_matrix.md
├── 05_asset_matrix.md
├── 06_gameplay_parity_matrix.md
├── 07_unresolved_behavior.md
├── 08_test_matrix.md
├── 09_performance_budget.md
└── 10_migration_status.md

Trạng thái dùng trong migration matrix
NOT_ANALYZED
ANALYZED
DESIGNED
PARTIALLY_PORTED
PORTED
PARITY_TESTED
INTEGRATION_TESTED
BLOCKED
NOT_REQUIRED


Một file chỉ được đánh dấu hoàn thành khi:

PORTED
+ PARITY_TESTED hoặc INTEGRATION_TESTED
+ không còn UNRESOLVED behavior

V. Master Prompt dùng cho toàn bộ dự án

Đây là prompt nền cần gửi cho coding agent trước mọi giai đoạn.

Bạn đóng vai Senior Flutter/Flame Game Engineer và Software Architect,
chuyên migration Java/LibGDX/J2ME legacy game sang Flutter và Flame.

Nguồn tham chiếu:
- Java Client: https://github.com/vantu03/MobiArmy2-Client
- Java Server: https://github.com/vantu03/MobiArmy2-Server
- Flutter/Flame repository đích: [ĐƯỜNG DẪN REPOSITORY]

Mục tiêu:
Chuyển toàn bộ behavior cần thiết của MobiArmy2 Client sang Flutter + Flame,
tương thích ngược với Java Server hiện tại.

Nguyên tắc bắt buộc:

1. Java source là behavior specification, không phải kiến trúc đích.
2. Không port máy móc một Java class thành một Dart class.
3. Trước khi viết code phải:
   - đọc toàn bộ file Java liên quan;
   - tìm tất cả call site;
   - tìm tất cả field được đọc/ghi;
   - tìm subclass/interface liên quan;
   - đối chiếu Server nếu code liên quan packet hoặc authoritative state.
4. Không được bỏ qua method rỗng, magic number, nhánh switch hoặc exception bị nuốt.
5. Mọi behavior chưa hiểu phải ghi vào docs/migration/07_unresolved_behavior.md.
6. Không tự sáng tạo packet format.
7. Giữ nguyên:
   - command ID;
   - signed byte;
   - big-endian;
   - Java Modified UTF-8;
   - XOR stream cursor;
   - optional fields;
   - thứ tự field;
   - quy ước tọa độ;
   - quy ước angle;
   - fixed-point arithmetic khi parity yêu cầu.
8. Server là nguồn authoritative cho:
   - turn;
   - projectile trajectory;
   - damage;
   - status effect;
   - room state;
   - match result.
9. Riverpod chỉ quản lý application/domain state.
10. Flame update loop quản lý runtime state theo frame.
11. Flutter Widget/Overlay quản lý:
   - form;
   - HUD;
   - chat;
   - popup;
   - dialog;
   - inventory;
   - settings.
12. Không gọi networking trực tiếp từ Flame component.
13. Không để packet handler sửa Widget hoặc component trực tiếp.
14. Luồng bắt buộc:
   Packet → Typed Server Event → Reducer/Controller → Domain State
   → Synchronization Adapter → Flame Runtime.
15. Mọi tài nguyên phải có ownership và dispose lifecycle rõ ràng.
16. Không load asset trong render() hoặc update().
17. Không tạo object không cần thiết mỗi frame.
18. Mỗi giai đoạn phải có:
   - file inventory;
   - thiết kế;
   - implementation;
   - unit test;
   - parity test;
   - integration test;
   - migration document update.
19. Không sửa ngoài phạm vi giai đoạn nếu không cần thiết.
20. Nếu phát hiện thiết kế cũ sai, hãy ghi migration note thay vì âm thầm thay đổi behavior.

Trước khi code, hãy trả về:
A. Danh sách file Java đã đọc.
B. Danh sách file Server đã đối chiếu.
C. Dependency graph.
D. Behavior inventory.
E. Java-to-Dart mapping.
F. Những điểm chưa rõ.
G. Kế hoạch test.
H. Danh sách file Dart sẽ tạo hoặc sửa.

Sau khi code, hãy trả về:
A. File đã tạo/sửa.
B. Behavior đã port.
C. Behavior chưa port.
D. Test đã chạy và kết quả.
E. Rủi ro còn lại.
F. Cập nhật migration matrix.
G. Không tuyên bố hoàn thành nếu còn test fail hoặc unresolved logic.

VI. Các giai đoạn migration

Tôi đề xuất 20 giai đoạn, mỗi giai đoạn có một prompt riêng.

Giai đoạn 0: Audit toàn bộ repository
Mục tiêu
Lập danh sách toàn bộ file.
Phân loại file.
Xác định dependency.
Không viết implementation gameplay.
Prompt 0
PHASE 0: FULL REPOSITORY AUDIT

Hãy audit toàn bộ Java Client MobiArmy2.

Yêu cầu:

1. Liệt kê toàn bộ file theo package:
   - CLib
   - com.teamobi.mobiarmy2
   - coreLG
   - effect
   - Equipment
   - InApp
   - InterfaceComponents
   - item
   - javax.microedition
   - lib
   - map
   - model
   - network
   - player
   - screen
   - shop
   - android
   - desktop
   - ios
   - unity

2. Với mỗi file, ghi:
   - trách nhiệm chính;
   - public API;
   - mutable state;
   - static/global state;
   - file gọi nó;
   - file nó gọi;
   - asset liên quan;
   - packet liên quan;
   - có cần port hay không;
   - module Dart đích;
   - mức độ ưu tiên;
   - mức độ rủi ro.

3. Phân loại:
   - MUST_PORT_BEHAVIOR
   - REPLACE_WITH_FLUTTER
   - REPLACE_WITH_FLAME
   - SERVER_AUTHORITATIVE
   - PLATFORM_SPECIFIC
   - DEAD_OR_PLACEHOLDER
   - UNRESOLVED

4. Xây dependency graph cho các entry point:
   MainGame → GameMidlet → CCanvas → screen → gameplay.

5. Xây dependency graph gameplay:
   GameScr → PM/CPlayer → BM/Bullet → MM/CMap → effects/camera.

6. Xây dependency graph network:
   Session_ME → Message → MessageHandler → GameLogicHandler → screens.

7. Tạo hoặc cập nhật:
   docs/migration/00_repository_inventory.md
   docs/migration/01_dependency_graph.md
   docs/migration/02_java_to_dart_mapping.md
   docs/migration/07_unresolved_behavior.md
   docs/migration/10_migration_status.md

8. Không viết gameplay code trong phase này.

Definition of Done:
- Mọi file Java đều xuất hiện trong inventory.
- Không có package nào bị bỏ qua.
- Mọi file có quyết định port/replace/not-required.
- Mọi unresolved behavior có ID riêng.

Giai đoạn 1: Khởi tạo Flutter + Flame foundation
Mục tiêu
Tạo app.
Thêm Flame.
Landscape/fullscreen.
Logging, error boundary, lifecycle.
Chưa load game thật.
Prompt 1
PHASE 1: FLUTTER + FLAME FOUNDATION

Dựa trên repository inventory đã tạo, hãy khởi tạo foundation cho Flutter Client.

Yêu cầu:

1. Thiết lập dependencies phù hợp:
   - flame
   - flutter_riverpod
   - riverpod_annotation
   - freezed_annotation
   - go_router hoặc Flutter Router
   - package audio phù hợp nhưng chưa cần tích hợp sâu
   - collection
   - logging

2. Tạo:
   lib/main.dart
   lib/app/bootstrap.dart
   lib/app/army_app.dart
   lib/app/router/
   lib/core/config/
   lib/core/diagnostics/
   lib/core/errors/
   lib/features/gameplay/game/army_game.dart

3. App phải:
   - chạy landscape;
   - hỗ trợ fullscreen immersive;
   - pause game khi background;
   - resume an toàn;
   - có loading/error screen;
   - có debug flag;
   - không phụ thuộc global singleton.

4. Tạo ArmyGame extends FlameGame.

5. Thiết kế lifecycle:
   Flutter lifecycle
   → application coordinator
   → socket lifecycle
   → Flame pause/resume.

6. Tạo placeholder route:
   - bootstrap
   - server selection
   - login
   - lobby
   - room
   - gameplay sandbox

7. Gameplay sandbox hiển thị một Flame component mẫu.

8. Viết test:
   - app bootstrap;
   - router redirect;
   - ArmyGame load/pause/resume.

9. Cập nhật migration docs.

Không port Java gameplay trong phase này.

Definition of Done:
- App chạy Android/Desktop.
- Landscape hoạt động.
- Flame GameWidget mount/unmount đúng.
- Không còn Ticker hoặc stream sau dispose.

Giai đoạn 2: Legacy math và coordinate system
Nguồn Java chính
model/CRes.java
model/Fomula.java
model/Position.java
CLib/mSystem.java

Prompt 2
PHASE 2: LEGACY MATH AND COORDINATE PARITY

Hãy phân tích toàn bộ math utility trong Java Client.

Đọc:
- model/CRes.java
- model/Fomula.java
- model/Position.java
- tất cả call site của sin, cos, tan, angle, fixangle, random,
  distance, clamp, interpolation và collision helpers.
- các đoạn Server dùng công thức tương ứng.

Yêu cầu:

1. Liệt kê mọi hàm toán học và call site.
2. Xác định:
   - đơn vị angle;
   - khoảng angle;
   - hệ tọa độ Y;
   - scale sin/cos;
   - fixed-point shift;
   - integer division behavior;
   - overflow/truncation behavior;
   - random behavior có ảnh hưởng gameplay không.
3. Port thành:
   core/legacy_math/legacy_trigonometry.dart
   core/legacy_math/legacy_angle.dart
   core/legacy_math/fixed_point.dart
   core/legacy_math/legacy_collision_math.dart
   core/legacy_math/legacy_random.dart
4. Không thay integer arithmetic bằng double nếu làm sai parity.
5. Port lookup table nếu Java dùng lookup table.
6. Viết golden tests bằng input/output lấy từ Java:
   - sin/cos mọi angle hợp lệ;
   - fixangle với giá trị âm và >360;
   - angle theo bốn quadrant;
   - distance;
   - collision helper;
   - shift và integer truncation.
7. Ghi rõ hàm nào:
   - cần exact parity;
   - chỉ phục vụ UI;
   - có thể dùng double.
8. Không port projectile hoàn chỉnh trong phase này.

Definition of Done:
- Tất cả math helpers có mapping.
- Golden tests Java/Dart pass.
- Không còn unresolved angle convention.

Giai đoạn 3: Asset inventory và conversion pipeline
Nguồn Java
CLib/Image.java
CLib/mImage.java
CLib/ManagerTile.java
model/FilePack.java
model/FrameImage.java
model/IconManager.java
model/ImageIcon.java

Prompt 3
PHASE 3: ASSET INVENTORY AND CONVERSION PIPELINE

Hãy audit toàn bộ asset loading của Java Client.

Yêu cầu:

1. Liệt kê:
   - image files;
   - .img resources;
   - sprites;
   - fonts;
   - tiles;
   - map assets;
   - sounds;
   - FilePack;
   - dynamic assets tải từ Server;
   - RMS cache.
2. Xác định mọi naming rule:
   - zoom level;
   - x1/x2/x3 folders;
   - .img → .png;
   - tile naming;
   - character equipment composition.
3. Tạo docs/migration/05_asset_matrix.md.
4. Thiết kế assets Flutter:
   assets/manifests/
   assets/sprites/
   assets/maps/
   assets/audio/
   assets/fonts/
5. Tạo tool/script chuyển:
   - resource cũ → PNG/WebP;
   - nhiều frame → atlas;
   - atlas metadata JSON;
   - map metadata JSON.
6. Tạo Flame asset layer:
   - GameAssetBundle
   - AssetManifest
   - SpriteAtlasRepository
   - MapAssetRepository
   - AssetScope
   - reference counting hoặc scoped cache.
7. Tạo preload strategy:
   - global;
   - lobby;
   - room;
   - match.
8. Mọi Image/Codec/Audio resource phải có owner và dispose.
9. Không load trong render/update.
10. Test:
   - manifest parsing;
   - missing asset;
   - duplicate frame;
   - atlas bounds;
   - unload/reload;
   - no use-after-dispose.

Definition of Done:
- 100% asset path Java có mapping hoặc trạng thái unresolved.
- Có ít nhất một atlas và một map được load qua pipeline mới.
- Không còn asset load trực tiếp rải rác trong gameplay code.

Giai đoạn 4: Map loader và tile rendering skeleton
Nguồn Java
map/Background.java
map/CMap.java
map/MapFile.java
map/MapImage.java
map/MM.java
CLib/ManagerTile.java
CLib/ManagerTile.java

Prompt 4
PHASE 4: MAP LOADING AND TILE RENDERING SKELETON

Hãy port phần tối thiểu để load và render map.

Yêu cầu:

1. Phân tích toàn bộ:
   - MapFile
   - CMap
   - MM
   - Background
   - MapImage
   - ManagerTile
2. Liệt kê định dạng map:
   - width/height;
   - tile size;
   - tile IDs;
   - layers;
   - background;
   - collision;
   - destructible flag;
   - water;
   - spawn point;
   - map-specific metadata.
3. Tạo:
   GameMapDefinition
   MapLayerDefinition
   TileSetDefinition
   SpawnPoint
   MapRepository
   MapComponent
   TileMapComponent
   BackgroundComponent
4. Load ít nhất một map thật từ asset Java đã chuyển đổi.
5. Render đúng:
   - tile index;
   - orientation;
   - scale;
   - zoom;
   - coordinate origin.
6. Thêm camera culling.
7. Chưa cần destructible terrain hoàn chỉnh.
8. Tạo debug overlay:
   - tile coordinate;
   - world coordinate;
   - map bounds;
   - spawn points.
9. Test:
   - map parser;
   - tile index;
   - out-of-bounds;
   - spawn parsing;
   - render snapshot nếu khả thi.

Definition of Done:
- Load được nhiều map bằng manifest.
- Chuyển map mà không restart game.
- Tile và background đúng vị trí.
- Không tạo sprite mới mỗi frame.

Giai đoạn 5: Character và equipment composition skeleton
Nguồn Java
player/CPlayer.java
player/PM.java
Equipment/Equip.java
Equipment/EquipGlass.java
Equipment/PlayerEquip.java
Equipment/TypeEquip.java
model/AvatarInfo.java
model/FrameImage.java

Prompt 5
PHASE 5: CHARACTER AND EQUIPMENT RENDERING SKELETON

Hãy port phần render nhân vật và equipment ở mức skeleton.

Yêu cầu:

1. Phân tích cách Java ghép:
   - body;
   - head;
   - gun;
   - glass;
   - backpack;
   - accessory;
   - facing direction;
   - frame index;
   - draw offset;
   - anchor;
   - character type.
2. Truy vết dữ liệu x, y, w, h, dx, dy từ resource/database packet.
3. Tạo:
   CharacterDefinition
   EquipmentDefinition
   CharacterAppearance
   CharacterAnimationState
   CharacterComponent
   EquipmentLayerComponent
   CharacterSpriteResolver
4. Hỗ trợ:
   - idle;
   - walk;
   - aim;
   - fire placeholder;
   - hurt placeholder;
   - death placeholder;
   - flip trái/phải.
5. Không hardcode offset bên trong render method.
6. Offset phải đến từ manifest hoặc definition.
7. Spawn được nhiều character trên map.
8. Test:
   - layer order;
   - facing;
   - frame selection;
   - missing equipment fallback;
   - equipment offset.

Definition of Done:
- Load được character thật.
- Đổi equipment không cần reload toàn bộ game.
- Không có logic packet trong CharacterComponent.

Giai đoạn 6: Movement, gravity và collision cơ bản
Prompt 6
PHASE 6: BASIC PLAYER MOVEMENT AND COLLISION

Phân tích movement/falling trong:
- player/CPlayer.java
- player/PM.java
- map/MM.java
- map/CMap.java
- các helper trong CRes.

Yêu cầu:

1. Liệt kê mọi player state ảnh hưởng movement:
   idle, walking, running, falling, hurt, dead, frozen, teleport.
2. Xác định:
   - movement step;
   - run speed;
   - stamina;
   - gravity;
   - slope/terrain adjustment;
   - map boundary;
   - water behavior;
   - collision width/height;
   - yPoint/foot point.
3. Giai đoạn này triển khai:
   - left/right movement;
   - basic gravity;
   - solid terrain collision;
   - map boundary;
   - idle/walk/fall transition.
4. Tạo:
   PlayerMovementSystem
   PlayerCollisionSystem
   GroundProbe
   MovementIntent
   PlayerMovementState
5. Input không sửa position trực tiếp.
6. Input chỉ tạo MovementIntent.
7. Runtime system update position trong Flame update().
8. Thêm debug collision bounds.
9. Test:
   - đi trái/phải;
   - đứng trên nền;
   - rơi khỏi mép;
   - không xuyên nền;
   - boundary;
   - variable delta time.
10. Ghi rõ logic nâng cao chưa port.

Definition of Done:
- Character di chuyển ổn trên ít nhất ba map.
- Không phụ thuộc FPS.
- Không xuyên terrain trong test cơ bản.

Giai đoạn 7: Camera và viewport
Nguồn Java
effect/Camera.java
GameScr camera usage
MainGame OrthographicCamera

Prompt 7
PHASE 7: CAMERA AND VIEWPORT

Hãy phân tích toàn bộ camera behavior trong Java Client.

Yêu cầu:

1. Liệt kê camera mode:
   - player follow;
   - bullet follow;
   - free/pan;
   - focus target;
   - return to player;
   - shake;
   - map bounds.
2. Xác định smoothing, delay, zoom và coordinate conversion.
3. Port sang Flame CameraComponent:
   ArmyCameraController
   CameraMode
   CameraTarget
   CameraBoundsPolicy
   ScreenShakeEffect
4. Hỗ trợ:
   - follow player;
   - drag camera;
   - clamp map;
   - follow projectile;
   - trở lại player.
5. Tạo screenToWorld và worldToScreen thống nhất.
6. Input aiming phải dùng tọa độ world.
7. Test:
   - camera clamp;
   - target switch;
   - coordinate round trip;
   - viewport resize;
   - device aspect ratio.

Definition of Done:
- Camera không đi ngoài map.
- Gameplay input đúng khi zoom/pan.
- Player và projectile follow hoạt động.

Giai đoạn 8: Input gameplay và HUD cơ bản
Nguồn Java
CCanvas.java
InterfaceComponents/GamePad.java
CPlayer.onPointerHold
GameScr input handlers
MainGame InputProcessor

Prompt 8
PHASE 8: GAMEPLAY INPUT AND BASIC HUD

Hãy phân tích toàn bộ input routing Java.

Yêu cầu:

1. Liệt kê:
   - pointer down;
   - pointer up;
   - pointer drag;
   - pointer hold;
   - keyboard;
   - left/right;
   - crosshair drag;
   - fire hold/release;
   - item selection;
   - camera pan;
   - pause/chat.
2. Xác định priority khi gesture overlap.
3. Thiết kế:
   GameplayInputController
   InputIntent
   AimIntent
   MoveIntent
   FireIntent
   ItemIntent
4. Flutter overlay tạo:
   - left button;
   - right button;
   - fire button;
   - angle display;
   - power bar;
   - item placeholder.
5. Flame component không phụ thuộc BuildContext.
6. Flutter overlay không sửa entity trực tiếp.
7. Dùng controller/command bus giữa overlay và game runtime.
8. Hỗ trợ multitouch:
   - giữ move;
   - đồng thời chỉnh camera nếu rule cho phép;
   - fire pointer riêng.
9. Test:
   - pointer cancel;
   - app background khi đang hold;
   - mất lượt khi đang charge;
   - overlay chặn input world;
   - landscape safe area.

Definition of Done:
- Move và aim hoạt động trên touch.
- Không stuck input sau cancel/background.
- HUD nằm ngoài render world.

Giai đoạn 9: Projectile skeleton và bắn offline
Nguồn Java
item/Bullet.java
item/BM.java
model/CRes.java
CPlayer.fire/shoot

Prompt 9
PHASE 9: OFFLINE PROJECTILE SKELETON

Mục tiêu của phase này chỉ là một projectile cannon cơ bản để hoàn thiện vertical slice.

Yêu cầu:

1. Phân tích:
   - angle;
   - force;
   - initial position;
   - muzzle offset;
   - initial velocity;
   - gravity;
   - wind;
   - projectile lifecycle.
2. Tạo:
   ShotRequest
   ProjectileDefinition
   ProjectileComponent
   LocalBallisticPathSource
   ProjectileSystem
3. Dùng legacy angle convention đã test ở Phase 2.
4. Hỗ trợ:
   - hold fire để charge 1..30;
   - release tạo projectile;
   - gravity;
   - wind X/Y đơn giản;
   - collision terrain;
   - explosion placeholder;
   - camera bullet follow.
5. Không dùng local projectile để xác định damage online.
6. Tách ProjectilePathSource để sau này thay bằng Server path.
7. Test:
   - force min/max;
   - góc 0/45/90/180;
   - wind dương/âm;
   - collision;
   - projectile out-of-map.

Definition of Done:
- Một vòng chơi offline: move → aim → charge → fire → impact.


Đến đây bạn đã có skeleton mong muốn.

VII. Các giai đoạn chuyển toàn bộ Client
Giai đoạn 10: Binary protocol foundation
Prompt 10
PHASE 10: BINARY PROTOCOL FOUNDATION

Đọc toàn bộ:
Client:
- network/Message.java
- network/Session_ME.java
- network/ISession.java
- network/IMessageHandler.java
- network/Command.java
Server:
- io/Message.java
- server/MessageHandler.java
- server/Session.java

Yêu cầu:

1. Document packet framing từng chiều.
2. Xác minh:
   - signed command byte;
   - uint16 length;
   - int32 length commands;
   - big-endian;
   - empty payload;
   - packet fragmentation;
   - packet coalescing.
3. Port:
   JavaDataReader
   JavaDataWriter
   JavaModifiedUtf8Codec
   GamePacket
   PacketEncoder
   IncrementalPacketDecoder
   PacketLengthPolicy
4. Decoder phải xử lý TCP stream incremental.
5. Không coi một socket chunk là một packet.
6. Thêm limit chống payload bất hợp lệ.
7. Test byte-for-byte với Java:
   byte, boolean, short, int, long, UTF,
   negative command, empty packet, large packet.
8. Fuzz test fragmentation:
   - 1 byte/chunk;
   - ngẫu nhiên;
   - nhiều packet/chunk.
9. Tạo protocol matrix.

Definition of Done:
- Dart encode/decode giống Java cho toàn bộ primitive.
- Không còn unresolved framing behavior.

Giai đoạn 11: Socket, handshake và XOR
Prompt 11
PHASE 11: TCP SOCKET, HANDSHAKE AND XOR

Đọc:
- Client Session_ME
- Client mSocket
- Server Session
- Server MessageHandler
- command -27 và -28.

Yêu cầu:

1. Port raw TCP bằng dart:io Socket.
2. Tạo:
   GameSocket
   ConnectionController
   XorStreamCipher
   SendQueue
   ReceivePipeline
   ReconnectPolicy
3. Giữ curR và curW riêng.
4. Không reset XOR cursor theo packet.
5. Chỉ bật XOR sau handshake hoàn tất.
6. Serialize send operation.
7. Hỗ trợ:
   - connect;
   - timeout;
   - handshake;
   - ping;
   - disconnect;
   - reconnect;
   - dispose;
   - socket error.
8. Không log password hoặc payload nhạy cảm.
9. Test:
   - handshake key reconstruction;
   - nhiều packet liên tục;
   - full duplex cursor;
   - disconnect giữa packet;
   - reconnect reset state.
10. Integration test với Java Server thật.

Definition of Done:
- Dart Client connect thành công.
- Handshake pass.
- Ping hoặc packet đơn giản được hai phía hiểu.

Giai đoạn 12: Command inventory và typed packet layer
Prompt 12
PHASE 12: COMPLETE COMMAND AND PACKET INVENTORY

Đọc toàn bộ:
- Cmd_Client2Server.java
- Cmd_Server2Client.java
- GameService.java
- MessageHandler.java
- ControlHandler.java
- SessionHandler.java

Yêu cầu:

1. Liệt kê mọi command, không chỉ command quan trọng.
2. Với mỗi command:
   - direction;
   - numeric ID;
   - semantic name;
   - request fields;
   - response fields;
   - optional fields;
   - conditions;
   - related screen;
   - related Server method;
   - current implementation status.
3. Không bỏ qua command âm.
4. Không gộp hai command cùng ID nhưng khác direction.
5. Tạo typed DTO và codec cho từng packet.
6. Tách:
   Auth packets
   Lobby packets
   Room packets
   Gameplay packets
   Inventory packets
   Shop packets
   Friend/clan packets
   Resource packets
7. Unknown command phải được ghi log an toàn và giữ raw payload.
8. Kiểm tra reader.remaining sau parse.
9. Viết golden test cho từng command đã port.
10. Cập nhật protocol matrix.

Definition of Done:
- Mọi switch case trong GameService/MessageHandler có entry.
- Mọi Server ControlHandler/SessionHandler case có entry.
- Không có magic command rải rác ngoài command registry.

Giai đoạn 13: Authentication và server selection
Prompt 13
PHASE 13: SERVER SELECTION AND AUTHENTICATION

Đọc:
- ServerListScreen
- LoginScr
- GameService login/register/version
- MessageHandler login success/fail
- UserData
- RMS account storage.

Yêu cầu:

1. Port domain:
   GameServer
   AccountCredentials
   UserSession
   AuthenticationState
2. Port presentation:
   ServerSelectionScreen
   LoginScreen
   connection/error states
3. Port packet:
   connect
   handshake
   login
   login success
   login fail
   logout
   register nếu có
   version check
4. Port account persistence an toàn.
5. Không điều hướng trước Server success packet.
6. Tạo route guards.
7. Test:
   - connect fail;
   - handshake fail;
   - login success/fail;
   - reconnect;
   - stored account;
   - logout cleanup.

Definition of Done:
- Có thể chọn Server, login và tạo UserSession thật.

Giai đoạn 14: Lobby, room list và board list
Prompt 14
PHASE 14: LOBBY, ROOM LIST AND BOARD LIST

Đọc:
- MenuScr
- RoomListScr
- RoomListScr2
- BoardListScr
- model/RoomInfo
- model/BoardInfo
- GameService room/board methods
- Server Room/RoomInfo/RoomWait handlers.

Yêu cầu:

1. Port mọi lobby/room/board packet.
2. Tạo:
   LobbyRepository
   LobbyController
   LobbyState
   RoomSummary
   BoardSummary
3. UI:
   room list
   board list
   refresh
   quick join
   password prompt
   join loading
   join failure.
4. Server event là nguồn authoritative.
5. Không thêm member hoặc chuyển route trên client trước success packet.
6. Test:
   - empty list;
   - full board;
   - password;
   - concurrent updates;
   - reconnect;
   - join fail/success.

Definition of Done:
- Vào được phòng thật từ Flutter Client.

Giai đoạn 15: Room waiting và prepare state
Prompt 15
PHASE 15: ROOM WAITING / PREPARE SCREEN

Đọc:
- PrepareScr
- InviteInfo
- RoomInfo
- PlayerInfo
- GameService ready/team/map/money/pass/max-player/kick/start
- Server RoomWait.

Yêu cầu:

1. Inventory toàn bộ room waiting behavior:
   - slots;
   - teams;
   - owner;
   - ready;
   - map;
   - mode;
   - password;
   - bet;
   - max players;
   - invite;
   - kick;
   - equipment;
   - item selection;
   - chat;
   - start conditions.
2. Tạo immutable RoomWaitingState.
3. Port toàn bộ packet hai chiều.
4. UI responsive landscape.
5. Phân quyền owner/member.
6. Chỉ vào gameplay khi nhận START_ARMY từ Server.
7. Test mọi state transition.
8. Reconnect phải khôi phục room state hoặc quay về lobby an toàn.

Definition of Done:
- Nhiều Flutter/Java Client có thể cùng vào phòng, ready và start.

Giai đoạn 16: Gameplay packet integration
Prompt 16
PHASE 16: GAMEPLAY NETWORK INTEGRATION

Đọc:
- GameService movement/fire/item/shoot-result/update-xy
- MessageHandler gameplay cases
- GameLogicHandler
- GameScr network callbacks
- Server MapData/User/SessionHandler.

Yêu cầu:

1. Port typed events:
   MatchStarted
   PlayerMoved
   ShotStarted
   ProjectilePathReceived
   DamageApplied
   PlayerDied
   WindChanged
   TurnChanged
   PositionCorrected
   ItemUsed
   MatchEnded
2. Tạo GameplayEventReducer.
3. Tạo adapter:
   MatchState → Flame GameWorld.
4. Không để packet handler thao tác component trực tiếp.
5. Port:
   command 20 start
   21 move
   22 fire
   23 shoot result
   24 next turn
   25 wind
   26 use item
   53 update XY
   và mọi command gameplay khác trong matrix.
6. Thay LocalBallisticPathSource bằng ServerProjectilePathSource trong online mode.
7. Gửi SHOOT_RESULT đúng thời điểm.
8. Test replay từ captured packet logs.

Definition of Done:
- Flutter Client xem và thực hiện lượt bắn online cơ bản.

Giai đoạn 17: Full projectile matrix
Prompt 17
PHASE 17: COMPLETE PROJECTILE AND WEAPON MIGRATION

Đọc toàn bộ:
- item/Bullet.java
- item/BM.java
- item/Item.java
- mọi bullet constant
- mọi switch theo bullet type
- Server Gun và toàn bộ bullet subclasses.

Yêu cầu:

1. Lập exhaustive bullet matrix:
   - ID;
   - weapon;
   - projectile count;
   - path format;
   - delay;
   - force2;
   - wind effect;
   - gravity;
   - collision;
   - explosion;
   - terrain hole;
   - camera behavior;
   - sound;
   - visual effect;
   - status effect.
2. Không bỏ một switch case nào.
3. Thiết kế registry:
   ProjectileDefinitionRegistry
   ProjectileFactory
   ProjectileBehavior
   ProjectilePresentation
4. Tách authoritative data và presentation.
5. Port từng nhóm:
   - standard ballistic;
   - multi-shot;
   - double-force;
   - rocket;
   - laser;
   - boomerang/ping-pong;
   - meteor/rain;
   - teleport;
   - poison/freeze/blind;
   - no-collision;
   - timed;
   - special/boss.
6. Mỗi bullet có:
   - fixture packet;
   - deterministic playback test;
   - start/end lifecycle test;
   - effect cleanup test.
7. Không đánh dấu complete nếu còn bullet ID chưa mapping.

Definition of Done:
- 100% bullet ID có status.
- Mọi bullet dùng trong Server có factory hoặc explicit NOT_SUPPORTED với blocker.

Giai đoạn 18: Destructible terrain, water và falling parity
Prompt 18
PHASE 18: DESTRUCTIBLE TERRAIN AND FALLING PARITY

Đọc:
- MM.java
- CMap.java
- HoleInfo.java
- MapFile.java
- Bullet explosion calls
- CPlayer fall logic
- Server MapData terrain/collision logic.

Yêu cầu:

1. Phân tích:
   - hole dimensions theo bullet;
   - destructible flags;
   - terrain layers;
   - alpha/pixel mask;
   - water;
   - glass;
   - ground detection;
   - player fall activation;
   - update XY timing.
2. Tạo chunked TerrainMask.
3. Tách:
   CollisionMask
   VisualTerrainMask
   TerrainChunk
   TerrainMutation
   GroundProbe
4. Implement makeHole.
5. Chỉ rebuild chunk bị ảnh hưởng.
6. Port player falling và ground normalization.
7. Đối chiếu Server position correction.
8. Test:
   - hole near chunk boundary;
   - overlapping holes;
   - hole under player;
   - water;
   - map edge;
   - multiple players falling;
   - update XY packet.

Definition of Done:
- Terrain destruction và player falling khớp behavior chính.
- Không rebuild toàn map mỗi vụ nổ.

Giai đoạn 19: Effects, audio, popup và chat
Prompt 19
PHASE 19: EFFECTS, AUDIO, POPUPS AND CHAT

Đọc:
- effect/*
- CLib/mSound
- SoundSystem
- Sound_Key
- ChatPopup
- MsgPopup
- Popup
- Dialog
- MsgDlg
- ChatTextField
- GameScr chat logic.

Yêu cầu:

1. Inventory toàn bộ effect/sound/chat/popup behavior.
2. Port Flame components:
   Explosion
   Smoke
   Snow
   Cloud
   Tornado
   GiftEffect
   screen shake
3. Port audio service:
   music channel
   SFX pool
   volume
   pause/resume
   lifecycle
4. Port Flutter overlays:
   compact chat
   expanded room chat
   notification banner
   confirm dialog
   reconnect overlay
   result overlay.
5. Không tạo AudioPlayer mỗi effect.
6. Không giữ chat list vô hạn.
7. Test cleanup và app lifecycle.

Definition of Done:
- Không còn effect component hoặc audio instance sau match dispose.

Giai đoạn 20: Inventory, equipment, shop và toàn bộ feature còn lại
Prompt 20
PHASE 20: COMPLETE NON-GAMEPLAY FEATURES

Đọc toàn bộ:
- Equipment/*
- shop/*
- Inventory
- EquipScreen
- ChangePlayerCSr
- MissionScreen
- ClanScreen
- Friends-related screens
- LuckyGame/LuckyGift
- Money screens
- profile/detail screens
- GameService packet methods
- MessageHandler packet cases
- Server handlers tương ứng.

Yêu cầu:

1. Chia thành các feature:
   inventory
   equipment
   shop
   profile
   friends
   clan
   missions
   lucky game
   payment placeholders
2. Với mỗi feature:
   - inventory Java files;
   - packet inventory;
   - domain model;
   - repository;
   - controller;
   - Flutter screen;
   - error/loading state;
   - test.
3. Không port platform payment giả nếu backend không còn hỗ trợ.
4. Mọi feature không port phải có quyết định rõ:
   - deprecated;
   - platform unsupported;
   - Server unsupported;
   - postponed.
5. Kiểm tra mọi Client/Server command trong matrix đã có owner.

Definition of Done:
- Mọi screen Java có mapping.
- Mọi command có handler hoặc quyết định explicit.

VIII. Giai đoạn cuối: Parity audit
Prompt Final Audit
FINAL PHASE: FULL CLIENT PARITY AUDIT

Không viết thêm feature mới trước khi hoàn thành audit.

Yêu cầu:

1. So sánh lại toàn bộ Java repository với migration inventory.
2. Kiểm tra từng:
   - file;
   - class;
   - method;
   - field quan trọng;
   - switch case;
   - command;
   - asset;
   - screen;
   - game state;
   - bullet type;
   - item type;
   - map behavior;
   - audio/effect.
3. Báo mọi Java behavior chưa có Dart mapping.
4. Báo mọi Dart implementation chưa có test.
5. Chạy:
   - unit tests;
   - golden protocol tests;
   - captured packet replay tests;
   - integration tests với Server;
   - gameplay smoke tests;
   - memory lifecycle tests;
   - performance profiling.
6. Kiểm tra:
   - reconnect;
   - app background;
   - socket disconnect;
   - room leave;
   - match dispose;
   - map switching;
   - account switching.
7. Performance target:
   - frame pacing ổn định;
   - không asset decode trong update/render;
   - không tăng RAM vô hạn qua nhiều match;
   - không audio leak;
   - không stream/ticker leak.
8. Cập nhật toàn bộ docs/migration.
9. Xuất báo cáo:
   - completed;
   - partial;
   - blocked;
   - not required;
   - unresolved.
10. Không tuyên bố parity hoàn chỉnh nếu còn:
   - unresolved behavior;
   - unmapped command;
   - unmapped bullet;
   - unmapped asset;
   - failing test.

IX. Prompt lặp lại cho từng file Java

Khi cần xử lý một file cụ thể, sử dụng template này:

FILE MIGRATION TASK

Java file:
[PATH]

Related Java files:
[PATHS]

Related Server files:
[PATHS]

Dart target module:
[MODULE]

Hãy thực hiện theo thứ tự:

1. Đọc toàn bộ file, không chỉ đoạn liên quan.
2. Tìm mọi call site.
3. Tìm mọi field access từ class khác.
4. Tìm subclass/interface.
5. Liệt kê:
   - responsibilities;
   - state;
   - methods;
   - side effects;
   - packet usage;
   - asset usage;
   - global dependencies;
   - timing assumptions;
   - coordinate assumptions;
   - magic numbers;
   - swallowed exceptions.
6. Phân loại từng method:
   - PORT_EXACTLY
   - PORT_BEHAVIOR_ONLY
   - REPLACE_WITH_FLAME
   - REPLACE_WITH_FLUTTER
   - SERVER_AUTHORITATIVE
   - NOT_REQUIRED
   - UNRESOLVED.
7. Đề xuất Dart file mapping.
8. Viết implementation theo kiến trúc đích.
9. Không tạo singleton/global mutable state.
10. Viết test cho từng behavior đã port.
11. So sánh Java/Dart output khi có thể.
12. Cập nhật migration matrix.
13. Báo rõ logic chưa port.

Chỉ đánh dấu file hoàn tất nếu mọi method đã được phân loại
và mọi PORT_* behavior đã có implementation/test.

X. Thứ tự triển khai thực tế
Mốc A: Skeleton offline

Thực hiện:

Phase 0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9


Kết quả:

Load map/tile.
Render character.
Di chuyển.
Camera.
Aim.
Charge.
Bắn cannon offline.
Explosion placeholder.
Mốc B: Client online cơ bản

Thực hiện:

Phase 10 → 11 → 12 → 13 → 14 → 15 → 16


Kết quả:

Connect Server.
Login.
Vào lobby.
Vào room.
Ready/start.
Move/fire online.
Phát lại projectile path.
Mốc C: Gameplay parity

Thực hiện:

Phase 17 → 18 → 19


Kết quả:

Toàn bộ projectile.
Terrain destruction.
Falling.
Effects.
Sound.
Chat.
Mốc D: Full Client

Thực hiện:

Phase 20 → Final Audit


Kết quả:

Inventory.
Equipment.
Shop.
Friends.
Clan.
Missions.
Các screen còn lại.
Audit không bỏ sót.
XI. Điều kiện để đảm bảo “không thiếu logic”

Không thể đảm bảo chỉ bằng việc agent nói “đã đọc toàn bộ source”. Phải có các gate đo được:

100% Java file có inventory record
100% Java method có classification
100% command có protocol record
100% MessageHandler switch case có handler status
100% GameService method có migration status
100% bullet ID có behavior record
100% map type có loading test
100% screen có route hoặc NOT_REQUIRED decision
100% asset path có asset mapping
0 unresolved behavior trước khi tuyên bố parity
0 protocol golden test fail
0 integration test fail


Nếu một phase chưa đạt gate, không chuyển sang trạng thái COMPLETE.

Khuyến nghị triển khai ngay

Bắt đầu bằng Prompt 0 Audit, không bắt đầu bằng việc tạo GameScreen hay port CPlayer. Sau khi có inventory và dependency graph, thực hiện Phase 1 đến Phase 9 để có skeleton offline. Chỉ sau khi skeleton chạy ổn mới tích hợp networking và lần lượt thay implementation giả bằng behavior thật.

Cách làm này giúp bạn vừa có sản phẩm chạy được sớm, vừa có cơ chế kiểm soát để cuối dự án không phát hiện còn hàng chục packet, bullet type hoặc trạng thái gameplay chưa được chuyển.