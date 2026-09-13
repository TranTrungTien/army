import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/room_service.dart';

/// Port PrepareScr (phase to thieu): danh sach nguoi choi, ready, doi map,
/// nut Start (chu phong). Thay PlaceholderScreen o route /room.
class RoomScreen extends ConsumerWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final room = ref.watch(roomServiceProvider);
    final auth = ref.watch(authControllerProvider);
    final myId = auth.session?.id ?? -1;
    final isOwner = room.ownerId == myId && myId != -1;
    final mapName = room.mapId == 100
        ? 'Ngau nhien'
        : (room.mapId < DataCache.mapNames.length
            ? DataCache.mapNames[room.mapId]
            : 'Map ${room.mapId}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Phong cho — $mapName'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            await ref.read(roomServiceProvider.notifier).leaveRoom();
            if (context.mounted) context.go('/lobby');
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Tien cuoc: ${room.money}'),
                if (isOwner)
                  OutlinedButton.icon(
                    icon: const Icon(Icons.map),
                    label: const Text('Doi map'),
                    onPressed: () => _pickMap(context, ref),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: room.players.length,
              itemBuilder: (context, i) {
                final p = room.players[i];
                final owner = p.idDb == room.ownerId;
                return ListTile(
                  leading: Icon(
                    p.isReady ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: p.isReady ? Colors.green : Colors.grey,
                  ),
                  title: Text(p.name + (owner ? '  (Chu phong)' : '')),
                  subtitle: Text('Level ${p.level2}'),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed: () {
                        final me = room.players.where((p) => p.idDb == myId);
                        final ready = me.isEmpty ? true : !me.first.isReady;
                        ref.read(roomServiceProvider.notifier).setReady(ready);
                      },
                      child: Text(
                        (room.players.any((p) => p.idDb == myId && p.isReady))
                            ? 'Huy ready'
                            : 'Ready',
                      ),
                    ),
                  ),
                  if (isOwner) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: () =>
                            ref.read(roomServiceProvider.notifier).startGame(),
                        child: const Text('BAT DAU'),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _pickMap(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => ListView(
        children: [
          for (var i = 0; i < DataCache.mapNames.length; i++)
            ListTile(
              title: Text(DataCache.mapNames[i]),
              onTap: () {
                ref.read(roomServiceProvider.notifier).requestChangeMap(i);
                Navigator.pop(ctx);
              },
            ),
        ],
      ),
    );
  }
}