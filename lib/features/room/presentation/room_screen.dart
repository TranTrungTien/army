import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiarmy_flutter/app/router/app_route.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/room/application/room_controller.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_player.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_session_state.dart';
import 'package:mobiarmy_flutter/shared/widgets/game_viewport.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_panel.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_button.dart';
import 'package:mobiarmy_flutter/shared/widgets/bitmap_text.dart';
import 'package:mobiarmy_flutter/core/assets/bmfont.dart';

class RoomScreen extends ConsumerWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomState = ref.watch(roomControllerProvider);
    final controller = ref.read(roomControllerProvider.notifier);
    final myId = ref.watch(authControllerProvider).session?.id;

    if (roomState == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 10),
              LegacyButton(
                label: 'Quay lại',
                width: 100,
                height: 30,
                onPressed: () => context.go(AppRoute.lobby.path),
              ),
            ],
          ),
        ),
      );
    }

    final isMaster = roomState.masterId == myId;

    return Scaffold(
      body: GameViewport(
        child: Stack(
          children: [
            // Background
            Container(color: const Color(0xFF5CB3FF)),

            Center(
              child: LegacyPanel(
                width: 460,
                height: 280,
                title: 'Bàn: ${roomState.boardId} - Map: ${roomState.mapId} - Cược: ${roomState.bet}',
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(4),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3.8,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 6,
                        ),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          final player = roomState.playerList.firstWhere(
                            (p) => p.slotIndex == index,
                            orElse: () => const RoomPlayer(
                              id: -1, name: '', level: 0, clan: 0, glassId: 0, equips: [],
                            ),
                          );
                          return _PlayerSlot(
                            player: player,
                            isMaster: roomState.masterId == player.id,
                            isMe: player.id == myId,
                            amIMaster: isMaster,
                            onKick: () => controller.kickPlayer(player.id),
                          );
                        },
                      ),
                    ),
                    _buildRoomControls(context, controller, roomState, myId),
                  ],
                ),
              ),
            ),

            // Soft Keys (Bottom Bar)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 35,
                color: Colors.black84,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LegacyButton(
                      label: 'Thoát',
                      width: 70,
                      height: 25,
                      onPressed: () async {
                        await controller.leaveRoom();
                        if (context.mounted) {
                          context.go(AppRoute.lobby.path);
                        }
                      },
                    ),
                    BitmapText(
                      'Chế độ: ${roomState.gameMode == 0 ? "Đối kháng" : "Đấu đội"}',
                      anchor: GraphicsAnchor.hCenter | GraphicsAnchor.vCenter,
                    ),
                    const SizedBox(width: 70),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomControls(
    BuildContext context,
    RoomController controller,
    RoomSessionState roomState,
    int? myId,
  ) {
    final isMaster = roomState.masterId == myId;
    final me = roomState.players[myId];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        alignment: WrapAlignment.center,
        children: [
          LegacyButton(
            label: 'Đổi đội',
            width: 75,
            height: 24,
            onPressed: controller.changeTeam,
          ),
          LegacyButton(
            label: 'Đổi súng',
            width: 75,
            height: 24,
            onPressed: () => _showGlassSelection(context, controller, me?.glassId ?? 0),
          ),
          if (isMaster) ...[
            LegacyButton(
              label: 'Đổi Map',
              width: 75,
              height: 24,
              onPressed: () => _showMapSelection(context, controller, roomState.mapId),
            ),
            LegacyButton(
              label: 'Đổi Tiền',
              width: 75,
              height: 24,
              onPressed: () => _showBetSelection(context, controller, roomState.bet),
            ),
            LegacyButton(
              label: 'Bắt đầu',
              width: 90,
              height: 24,
              onPressed: controller.startGame,
              isSelected: true,
            ),
          ] else
            LegacyButton(
              label: me?.isReady == true ? 'Sẵn sàng' : 'Chưa SS',
              width: 90,
              height: 24,
              onPressed: controller.toggleReady,
              isSelected: me?.isReady == true,
            ),
        ],
      ),
    );
  }

  void _showGlassSelection(BuildContext context, RoomController controller, int current) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Chọn Nhân Vật / Súng', style: TextStyle(fontSize: 14)),
        content: Wrap(
          spacing: 10,
          children: List.generate(4, (index) {
            return ChoiceChip(
              label: Text('Gun $index'),
              selected: current == index,
              onSelected: (_) {
                controller.selectGlass(index);
                Navigator.of(ctx).pop();
              },
            );
          }),
        ),
      ),
    );
  }

  void _showMapSelection(BuildContext context, RoomController controller, int current) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Chọn Bản Đồ', style: TextStyle(fontSize: 14)),
        content: Wrap(
          spacing: 10,
          children: List.generate(5, (index) {
            return ChoiceChip(
              label: Text('Map $index'),
              selected: current == index,
              onSelected: (_) {
                controller.selectMap(index);
                Navigator.of(ctx).pop();
              },
            );
          }),
        ),
      ),
    );
  }

  void _showBetSelection(BuildContext context, RoomController controller, int current) {
    final bets = [100, 500, 1000, 5000, 10000];
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Chọn Mức Cược', style: TextStyle(fontSize: 14)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: bets.map((b) {
            return ListTile(
              title: Text('$b xu'),
              trailing: current == b ? const Icon(Icons.check, color: Colors.green) : null,
              onTap: () {
                controller.changeBet(b);
                Navigator.of(ctx).pop();
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _PlayerSlot extends StatelessWidget {
  const _PlayerSlot({
    required this.player,
    required this.isMaster,
    required this.isMe,
    required this.amIMaster,
    required this.onKick,
  });

  final RoomPlayer player;
  final bool isMaster;
  final bool isMe;
  final bool amIMaster;
  final VoidCallback onKick;

  @override
  Widget build(BuildContext context) {
    if (player.id == -1) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.black26,
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Center(
          child: BitmapText('Trống', scale: 0.6),
        ),
      );
    }

    final teamColor = player.team == 0
        ? const Color(0xFF3379FF).withOpacity(0.25)
        : const Color(0xFFFF3333).withOpacity(0.25);

    return InkWell(
      onTap: (amIMaster && !isMe) ? onKick : null,
      child: Container(
        decoration: BoxDecoration(
          color: teamColor,
          border: Border.all(color: isMe ? Colors.yellow : const Color(0xFF303030), width: isMe ? 1.5 : 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: Text(
                    player.level.toString(),
                    style: const TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BitmapText(
                      player.name,
                      scale: 0.7,
                      colorIndex: isMe ? 3 : -1, // YELLOW for me
                    ),
                    Row(
                      children: [
                        if (isMaster)
                          const Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: BitmapText('H', scale: 0.5, colorIndex: 5),
                          ),
                        BitmapText('G:${player.gun}', scale: 0.5, colorIndex: 0),
                      ],
                    ),
                  ],
                ),
              ),
              if (!isMaster && player.isReady)
                const Icon(Icons.check_circle, color: Colors.green, size: 14),
              if (amIMaster && !isMe)
                const Icon(Icons.gavel, color: Colors.redAccent, size: 12),
            ],
          ),
        ),
      ),
    );
  }
}