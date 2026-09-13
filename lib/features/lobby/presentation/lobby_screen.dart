import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiarmy_flutter/app/router/app_route.dart';
import 'package:mobiarmy_flutter/features/lobby/application/lobby_controller.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/lobby_state.dart';

class LobbyScreen extends ConsumerWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lobby = ref.watch(lobbyControllerProvider);

    ref.listen(lobbyControllerProvider, (previous, next) {
      if (next.status == LobbyStatus.inRoom) {
        context.go(AppRoute.room.path);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Phòng chờ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(lobbyControllerProvider.notifier).loadAreas(),
          ),
        ],
      ),
      body: lobby.status == LobbyStatus.loading
          ? const Center(child: CircularProgressIndicator())
          : lobby.status == LobbyStatus.boardsLoaded
              ? _BoardList(
                  areaId: lobby.currentAreaId!,
                  boards: lobby.boards,
                )
              : _AreaList(areas: lobby.areas),
    );
  }
}

class _AreaList extends ConsumerWidget {
  const _AreaList({required this.areas});
  final List<dynamic> areas; // Should be AreaInfo but using dynamic for now

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: areas.length,
      itemBuilder: (context, index) {
        final area = areas[index];
        return ListTile(
          title: Text('Khu vực ${area.id}'),
          subtitle: Text('${area.numPlayers}/${area.maxPlayers} người chơi'),
          onTap: () => ref.read(lobbyControllerProvider.notifier).loadBoards(area.id),
        );
      },
    );
  }
}

class _BoardList extends ConsumerWidget {
  const _BoardList({required this.areaId, required this.boards});
  final int areaId;
  final List<dynamic> boards; // Should be BoardInfo

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Khu vực $areaId'),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.5,
            ),
            itemCount: boards.length,
            itemBuilder: (context, index) {
              final board = boards[index];
              return Card(
                color: board.isStarted ? Colors.grey : null,
                child: InkWell(
                  onTap: board.isStarted
                    ? null
                    : () => ref.read(lobbyControllerProvider.notifier).joinBoard(areaId, board.id),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Bàn ${board.id}'),
                        Text('${board.numPlayers}/${board.maxPlayers}'),
                        if (board.hasPassword) const Icon(Icons.lock, size: 12),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
