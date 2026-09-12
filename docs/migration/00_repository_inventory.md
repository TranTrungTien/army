# 00 Repository Inventory

## Scope and evidence

- Sources: `MobiArmy2-Client.md` and `MobiArmy2-Server.md` supplied by the user.
- The Markdown structure tree is used as the exhaustive file list.
- `content_available=NO` means the file appears in the tree but its full body was not recoverable as a dedicated fenced block.
- Full machine-readable inventory: `00_repository_inventory.csv`.

## Totals

- Client listed files: **235**; Java files: **172**.
- Server listed files: **101**; Java files: **91**.
- Embedded client bodies recovered: **232**.
- Embedded server bodies recovered: **99**.

## Client classification totals

- `DEAD_OR_PLACEHOLDER`: 6
- `MUST_PORT_BEHAVIOR`: 38
- `PLATFORM_SPECIFIC`: 3
- `REPLACE_WITH_FLAME`: 8
- `REPLACE_WITH_FLUTTER`: 33
- `UNRESOLVED`: 84

## Package coverage

### CLIENT: `CLib`
- Files: 26; Java: 26; high risk: 10.
- Paths:
  - `core/src/CLib/EasingEnum.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/EasingFunction.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/Graphics.java` | `REPLACE_WITH_FLAME` | target: `lib/features/gameplay/game or lib/core/assets` | content: `YES`
  - `core/src/CLib/Image.java` | `REPLACE_WITH_FLAME` | target: `lib/features/gameplay/game or lib/core/assets` | content: `YES`
  - `core/src/CLib/LibSysTem.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/Library_Images.java` | `DEAD_OR_PLACEHOLDER` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/Main.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/ManagerTile.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/MapKey.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/RMS.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/ScrollResult.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/SoundSystem.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/Sound_Key.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/Sprite.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/SysTemFont.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/TField.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/CLib/TemGraphics.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/mFont.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/mGraphics.java` | `REPLACE_WITH_FLAME` | target: `lib/features/gameplay/game or lib/core/assets` | content: `YES`
  - `core/src/CLib/mHashtable.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/mImage.java` | `REPLACE_WITH_FLAME` | target: `lib/features/gameplay/game or lib/core/assets` | content: `YES`
  - `core/src/CLib/mSocket.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/mSound.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/mSystem.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/mVector.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/CLib/myEditText.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`

### CLIENT: `CSHARP_MIGRATION_PLAN.md`
- Files: 1; Java: 0; high risk: 0.
- Paths:
  - `CSHARP_MIGRATION_PLAN.md` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `NO`

### CLIENT: `Debug`
- Files: 1; Java: 1; high risk: 0.
- Paths:
  - `core/src/Debug/Debug.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `Equipment`
- Files: 4; Java: 4; high risk: 0.
- Paths:
  - `core/src/Equipment/Equip.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/{equipment,gameplay}` | content: `YES`
  - `core/src/Equipment/EquipGlass.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/{equipment,gameplay}` | content: `YES`
  - `core/src/Equipment/PlayerEquip.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/{equipment,gameplay}` | content: `YES`
  - `core/src/Equipment/TypeEquip.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/{equipment,gameplay}` | content: `YES`

### CLIENT: `GITHUB_PUSH.md`
- Files: 1; Java: 0; high risk: 0.
- Paths:
  - `GITHUB_PUSH.md` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `InApp`
- Files: 3; Java: 3; high risk: 0.
- Paths:
  - `core/src/InApp/InAppPurchaseSystem.java` | `DEAD_OR_PLACEHOLDER` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/InApp/MainActivity.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/InApp/PurchaseView.java` | `DEAD_OR_PLACEHOLDER` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `InterfaceComponents`
- Files: 2; Java: 2; high risk: 0.
- Paths:
  - `core/src/InterfaceComponents/ChatTextField.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/InterfaceComponents/GamePad.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`

### CLIENT: `README.md`
- Files: 1; Java: 0; high risk: 0.
- Paths:
  - `README.md` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `NO`

### CLIENT: `android`
- Files: 16; Java: 1; high risk: 0.
- Paths:
  - `android/AndroidManifest.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/Info.plist.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/assets/res/agent.txt` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/assets/res/provider.txt` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/project.properties` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/res/values/color.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/res/values/strings.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/res/values/styles.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/res1/drawable-anydpi-v26/ic_launcher.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/res1/drawable-anydpi-v26/ic_launcher_foreground.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/res1/values-v21/styles.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/res1/values/color.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/res1/values/strings.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/res1/values/styles.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/robovm.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `android/src/com/mygdx/game/AndroidLauncher.java` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `com`
- Files: 12; Java: 12; high risk: 4.
- Paths:
  - `core/src/com/teamobi/mobiarmy2/GameMidlet.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/com/teamobi/mobiarmy2/IActionListener.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/com/teamobi/mobiarmy2/InAppPurchaseSystem.java` | `DEAD_OR_PLACEHOLDER` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/com/teamobi/mobiarmy2/IosVersion.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/com/teamobi/mobiarmy2/MainActivity.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/com/teamobi/mobiarmy2/MainClass.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/com/teamobi/mobiarmy2/MainGame.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/com/teamobi/mobiarmy2/MotherCanvas.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/com/teamobi/mobiarmy2/MyGdxGame.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/com/teamobi/mobiarmy2/NativeController.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/com/teamobi/mobiarmy2/TemCanvas.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/com/teamobi/mobiarmy2/TemMidlet.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `coreLG`
- Files: 4; Java: 4; high risk: 3.
- Paths:
  - `core/src/coreLG/CCanvas.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/coreLG/CONFIG.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/coreLG/SynchronizedData.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/coreLG/TerrainMidlet.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `desktop`
- Files: 4; Java: 1; high risk: 0.
- Paths:
  - `desktop/assets/res/agent.txt` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `desktop/assets/res/provider.txt` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `desktop/run.bat` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `desktop/src/com/mygdx/game/DesktopLauncher.java` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `effect`
- Files: 9; Java: 9; high risk: 3.
- Paths:
  - `core/src/effect/Camera.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/effects` | content: `YES`
  - `core/src/effect/Cloud.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/effects` | content: `YES`
  - `core/src/effect/Effect.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/effects` | content: `YES`
  - `core/src/effect/Explosion.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/effects` | content: `YES`
  - `core/src/effect/GiftEffect.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/effects` | content: `YES`
  - `core/src/effect/Smoke.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/effects` | content: `YES`
  - `core/src/effect/SmokeManager.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/effects` | content: `YES`
  - `core/src/effect/Snow.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/effects` | content: `YES`
  - `core/src/effect/Tornado.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/effects` | content: `YES`

### CLIENT: `gradle`
- Files: 1; Java: 0; high risk: 0.
- Paths:
  - `gradle/wrapper/gradle-wrapper.properties` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `gradle.properties`
- Files: 1; Java: 0; high risk: 0.
- Paths:
  - `gradle.properties` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `gradlew.bat`
- Files: 1; Java: 0; high risk: 0.
- Paths:
  - `gradlew.bat` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `ios`
- Files: 7; Java: 1; high risk: 0.
- Paths:
  - `ios/Info.plist.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `ios/data/Media.xcassets/AppIcon.appiconset/Contents.json` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `ios/data/Media.xcassets/Contents.json` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `ios/data/Media.xcassets/Logo.imageset/Contents.json` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `ios/robovm.properties` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `ios/robovm.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `ios/src/com/mygdx/game/IOSLauncher.java` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `item`
- Files: 5; Java: 5; high risk: 3.
- Paths:
  - `core/src/item/BM.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/{domain,game/projectile}` | content: `YES`
  - `core/src/item/Bullet.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/{domain,game/projectile}` | content: `YES`
  - `core/src/item/Item.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/{domain,game/projectile}` | content: `YES`
  - `core/src/item/MyItemIcon.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/{domain,game/projectile}` | content: `YES`
  - `core/src/item/RandomItem.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/{domain,game/projectile}` | content: `YES`

### CLIENT: `javax`
- Files: 4; Java: 4; high risk: 1.
- Paths:
  - `core/src/javax/microedition/lcdui/Graphics.java` | `REPLACE_WITH_FLAME` | target: `lib/features/gameplay/game or lib/core/assets` | content: `YES`
  - `core/src/javax/microedition/lcdui/Image.java` | `REPLACE_WITH_FLAME` | target: `lib/features/gameplay/game or lib/core/assets` | content: `YES`
  - `core/src/javax/microedition/midlet/MIDlet.java` | `REPLACE_WITH_FLAME` | target: `lib/features/gameplay/game or lib/core/assets` | content: `YES`
  - `core/src/javax/microedition/midlet/MIDletStateChangeException.java` | `REPLACE_WITH_FLAME` | target: `lib/features/gameplay/game or lib/core/assets` | content: `YES`

### CLIENT: `lib`
- Files: 5; Java: 5; high risk: 0.
- Paths:
  - `core/src/lib/Context.java` | `DEAD_OR_PLACEHOLDER` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/lib/MyStream.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/lib/TCanvas.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/lib/mGraphics.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/lib/mSocket.java` | `DEAD_OR_PLACEHOLDER` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `map`
- Files: 6; Java: 6; high risk: 3.
- Paths:
  - `core/src/map/Background.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/map` | content: `YES`
  - `core/src/map/CMap.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/map` | content: `YES`
  - `core/src/map/HoleInfo.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/map` | content: `YES`
  - `core/src/map/MM.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/map` | content: `YES`
  - `core/src/map/MapFile.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/map` | content: `YES`
  - `core/src/map/MapImage.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/game/map` | content: `YES`

### CLIENT: `model`
- Files: 43; Java: 43; high risk: 12.
- Paths:
  - `core/src/model/AvMain.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/AvatarInfo.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/BoardInfo.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/CRes.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/CTime.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/ChatPopup.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/Clan.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/ClanItem.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/Dialog.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/FilePack.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/Fomula.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/Font.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/FrameImage.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/GetString.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/Gift.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/IAction.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/IAction2.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/IActionListener.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/IconManager.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/ImageIcon.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/InfoPopup.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/InputDlg.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/InviteInfo.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/KeyConstant.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/Language.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/LevelDetail.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/LuckyGift.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/MaterialIconMn.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/Menu.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/Mission.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/MoneyInfo.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/MsgDlg.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/MsgInfo.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/MsgPopup.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/PauseMenu.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/PlayerInfo.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/Popup.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/Position.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/RoomInfo.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/SMS.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/TField.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/model/TimeBomb.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/model/UserData.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `network`
- Files: 11; Java: 11; high risk: 10.
- Paths:
  - `core/src/network/Cmd_Client2Server.java` | `MUST_PORT_BEHAVIOR` | target: `lib/core/network` | content: `YES`
  - `core/src/network/Cmd_Server2Client.java` | `MUST_PORT_BEHAVIOR` | target: `lib/core/network` | content: `YES`
  - `core/src/network/Command.java` | `MUST_PORT_BEHAVIOR` | target: `lib/core/network` | content: `YES`
  - `core/src/network/GameLogicHandler.java` | `MUST_PORT_BEHAVIOR` | target: `lib/core/network` | content: `YES`
  - `core/src/network/GameService.java` | `MUST_PORT_BEHAVIOR` | target: `lib/core/network` | content: `YES`
  - `core/src/network/IGameLogicHandler.java` | `MUST_PORT_BEHAVIOR` | target: `lib/core/network` | content: `YES`
  - `core/src/network/IMessageHandler.java` | `MUST_PORT_BEHAVIOR` | target: `lib/core/network` | content: `YES`
  - `core/src/network/ISession.java` | `MUST_PORT_BEHAVIOR` | target: `lib/core/network` | content: `YES`
  - `core/src/network/Message.java` | `MUST_PORT_BEHAVIOR` | target: `lib/core/network` | content: `YES`
  - `core/src/network/MessageHandler.java` | `MUST_PORT_BEHAVIOR` | target: `lib/core/network` | content: `YES`
  - `core/src/network/Session_ME.java` | `MUST_PORT_BEHAVIOR` | target: `lib/core/network` | content: `YES`

### CLIENT: `player`
- Files: 3; Java: 3; high risk: 2.
- Paths:
  - `core/src/player/Boss.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/{domain,game/player}` | content: `YES`
  - `core/src/player/CPlayer.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/{domain,game/player}` | content: `YES`
  - `core/src/player/PM.java` | `MUST_PORT_BEHAVIOR` | target: `lib/features/gameplay/{domain,game/player}` | content: `YES`

### CLIENT: `run.bat`
- Files: 1; Java: 0; high risk: 0.
- Paths:
  - `run.bat` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `screen`
- Files: 27; Java: 27; high risk: 25.
- Paths:
  - `core/src/screen/ArchivementScr.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/BoardListScr.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/CScreen.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/ChangePlayerCSr.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/ClanScreen.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/ConfigScr.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/EquipScreen.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/FomulaScreen.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/GameScr.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/Inventory.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/LevelScreen.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/ListScr.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/LoginScr.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/LuckyGame.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/LuckyGifrScreen.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/MenuScr.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/MissionScreen.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/MoneyScr.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/MoneyScrIOS.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/MsgScreen.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/PrepareScr.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/QuangCao.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/RoomListScr.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/RoomListScr2.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/ServerListScreen.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/SplashScr.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`
  - `core/src/screen/TabScreen.java` | `REPLACE_WITH_FLUTTER` | target: `lib/features/*/presentation or lib/shared/widgets` | content: `YES`

### CLIENT: `shop`
- Files: 4; Java: 4; high risk: 4.
- Paths:
  - `core/src/shop/ShopBietDoi.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/shop/ShopEquipment.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/shop/ShopItem.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `core/src/shop/ShopLinhTinh.java` | `UNRESOLVED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### CLIENT: `unity`
- Files: 32; Java: 0; high risk: 11.
- Paths:
  - `unity/army2-unity-client/Assets/Army2/Scripts/CLib/LibSysTem.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/CLib/MGraphics.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/CLib/MImage.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/CLib/MSystem.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/CLib/MapKey.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/CLib/RMS.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/CoreLG/CCanvas.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/GameMidlet.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Input/UnityInputRouter.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/MainGame.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Model/CRes.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Model/IAction.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/MotherCanvas.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Network/BigEndianReader.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Network/BigEndianWriter.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Network/Command.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Network/GameLogicHandler.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Network/GameService.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Network/IMessageHandler.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Network/ISession.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Network/Message.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Network/MessageHandler.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Network/SessionME.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Screen/CScreen.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Screen/ServerListScreen.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/Army2/Scripts/Screen/SplashScr.cs` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/StreamingAssets/res/agent.txt` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/Assets/StreamingAssets/res/provider.txt` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/PORT_STATUS.md` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `NO`
  - `unity/army2-unity-client/Packages/manifest.json` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/ProjectSettings/ProjectVersion.txt` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `unity/army2-unity-client/README.md` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### SERVER: `Cache.java`
- Files: 1; Java: 1; high risk: 1.
- Paths:
  - `src/mobiarmy/Cache.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`

### SERVER: `MobiArmy.java`
- Files: 1; Java: 1; high risk: 0.
- Paths:
  - `src/mobiarmy/MobiArmy.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`

### SERVER: `README.md`
- Files: 1; Java: 0; high risk: 0.
- Paths:
  - `README.md` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `NO`

### SERVER: `Test.java`
- Files: 1; Java: 1; high risk: 0.
- Paths:
  - `src/mobiarmy/Test.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`

### SERVER: `Util.java`
- Files: 1; Java: 1; high risk: 0.
- Paths:
  - `src/mobiarmy/Util.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`

### SERVER: `army.sql`
- Files: 1; Java: 0; high risk: 0.
- Paths:
  - `army.sql` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### SERVER: `build.xml`
- Files: 1; Java: 0; high risk: 0.
- Paths:
  - `build.xml` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### SERVER: `io`
- Files: 3; Java: 3; high risk: 2.
- Paths:
  - `src/mobiarmy/io/IMessageHandler.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/io/Message.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/io/Write.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`

### SERVER: `lib`
- Files: 1; Java: 0; high risk: 0.
- Paths:
  - `lib/nblibraries.properties` | `NOT_REQUIRED` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### SERVER: `nbproject`
- Files: 6; Java: 0; high risk: 0.
- Paths:
  - `nbproject/build-impl.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `nbproject/genfiles.properties` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `nbproject/private/private.properties` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `nbproject/private/private.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `nbproject/project.properties` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`
  - `nbproject/project.xml` | `PLATFORM_SPECIFIC` | target: `lib/core or explicit NOT_REQUIRED decision` | content: `YES`

### SERVER: `server`
- Files: 26; Java: 26; high risk: 9.
- Paths:
  - `src/mobiarmy/server/Bot.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/Caption.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/Confirm.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/ControlHandler.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/DBManager.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/Equip.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/Exp.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/GameData.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/Glass.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/Item.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/LinhTinh.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/Map.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/MapBoss.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/MessageHandler.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/Mission.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/Pack.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/Select.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/Server.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/ServerManager.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `NO`
  - `src/mobiarmy/server/Session.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/SessionHandler.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/SessionManager.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/ShopEquipment.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/ShopLinhTinh.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/Text.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/server/User.java` | `SERVER_REFERENCE` | target: `Reference only; no direct Dart port` | content: `YES`

### SERVER: `war`
- Files: 58; Java: 58; high risk: 2.
- Paths:
  - `src/mobiarmy/war/Boss/BigBoom.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/Boss.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/GiftBox.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/GiftBox2.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/Robot.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/RobotSpider.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/SmallBoom.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/Trex.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/Ufo.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/AddBoomBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ApacheBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/BicycleBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/BigBoomBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/BigLaserBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/BigRocketBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/BomBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/Bullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/BulletTrajectory.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ChickyBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/FlyPortBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemB52Bullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemBlindBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemBomBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemEarthHole2Bullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemEarthHoleBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemFreezeBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemLandBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemLaserBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemMeteorBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemMouseBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemNoCollisionMap.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemPoisonBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemRainBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemRocketBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemSilkBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemSilkBullet2.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemSuicideBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemTeleportBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemTeleportBullet2.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemTimeBombBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemTornadoBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemUfo.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/ItemUfoBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/MirrorBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/RocketExpBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/SmallBoomBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/TarzanBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Boss/bullet/UfoLaserBullet.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Gun.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/MapData.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/PathSimulator.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Player.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Poison.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Room.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/RoomInfo.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/RoomWait.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/TimeBomb.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`
  - `src/mobiarmy/war/Tornado.java` | `SERVER_AUTHORITATIVE` | target: `Reference only; no direct Dart port` | content: `YES`