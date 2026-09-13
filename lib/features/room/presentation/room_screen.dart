import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/room/application/room_controller.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_player.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_session_state.dart';

class RoomScreen extends ConsumerWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomState = ref.watch(roomControllerProvider);
    final controller = ref.read(roomControllerProvider.notifier);
    final myId = ref.watch(authControllerProvider).session?.id;

    if (roomState == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Phòng: ${roomState.bet}'),
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: controller.leaveRoom,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 8, // Fixed 8 slots
              itemBuilder: (context, index) {
                final player = roomState.playerList.firstWhere(
                  (p) => p.slotIndex == index,
                  orElse: () => RoomPlayer(
                    id: -1, name: '', level: 0, clan: 0, glassId: 0, equips: [],
                  ),
                );
                return _PlayerSlot(
                  player: player,
                  isMaster: roomState.masterId == player.id,
                  isMe: player.id == myId,
                );
              },
            ),
          ),
          _buildControls(context, controller, roomState, myId),
        ],
      ),
    );
  }

  Widget _buildControls(
    BuildContext context,
    RoomController controller,
    RoomSessionState roomState,
    int? myId,
  ) {
    final isMaster = roomState.masterId == myId;
    final me = roomState.players[myId];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: controller.changeTeam,
            icon: const Icon(Icons.swap_horiz),
            label: const Text('Đổi đội'),
          ),
          if (isMaster)
            ElevatedButton.icon(
              onPressed: controller.startGame,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Bắt đầu'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            )
          else
            ElevatedButton.icon(
              onPressed: controller.toggleReady,
              icon: Icon(me?.isReady == true ? Icons.check_circle : Icons.radio_button_unchecked),
              label: Text(me?.isReady == true ? 'Sẵn sàng' : 'Chưa SS'),
              style: ElevatedButton.styleFrom(
                backgroundColor: me?.isReady == true ? Colors.orange : null,
              ),
            ),
        ],
      ),
    );
  }
}

class _PlayerSlot extends StatelessWidget {
  const _PlayerSlot({
    required this.player,
    required this.isMaster,
    required this.isMe,
  });

  final RoomPlayer player;
  final bool isMaster;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    if (player.id == -1) {
      return Card(
        color: Colors.black12,
        child: const Center(child: Text('Trống', style: TextStyle(color: Colors.grey))),
      );
    }

    final teamColor = player.team == 0 ? Colors.blue.withOpacity(0.2) : Colors.red.withOpacity(0.2);

    return Card(
      color: teamColor,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(child: Text(player.level.toString())),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        player.name,
                        style: TextStyle(
                          fontWeight: isMe ? FontWeight.bold : FontWeight.normal,
                          color: isMe ? Colors.blue : null,
                        ),
                      ),
                      if (isMaster)
                        const Text('Chủ phòng', style: TextStyle(fontSize: 10, color: Colors.orange)),
                    ],
                  ),
                ),
                if (!isMaster && player.isReady)
                  const Icon(Icons.check, color: Colors.green),
              ],
            ),
          ),
          if (isMe)
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
              ),
            ),
        ],
      ),
    );
  }
}
