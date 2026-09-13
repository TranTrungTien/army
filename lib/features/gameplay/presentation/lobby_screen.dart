import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/lobby_service.dart';

/// Lobby: danh sach phong tu cmd -28. Thay PlaceholderScreen o route /lobby.
class LobbyScreen extends ConsumerStatefulWidget {
  const LobbyScreen({super.key});

  @override
  ConsumerState<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends ConsumerState<LobbyScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(lobbyServiceProvider.notifier).requestRoomList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rooms = ref.watch(lobbyServiceProvider);
    final auth = ref.watch(authControllerProvider);
    final session = auth.session;

    return Scaffold(
      appBar: AppBar(
        title: Text('MobiArmy — ${auth.server?.name ?? ''}'),
        actions: [
          if (session != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text('xu ${session.xu} · luong ${session.luong}'),
              ),
            ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authControllerProvider.notifier).disconnect(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(lobbyServiceProvider.notifier).requestRoomList(),
        child: rooms.isEmpty
            ? const Center(child: Text('Khong co phong nao — keo de tai lai'))
            : ListView.builder(
                itemCount: rooms.length,
                itemBuilder: (context, i) {
                  final r = rooms[i];
                  if (r.name != null) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                      child: Text(r.name!,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    );
                  }
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: ListTile(
                      dense: true,
                      title: Text(r.displayName),
                      subtitle: Text('Nguoi choi: ${r.playerMax}'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => ref
                          .read(lobbyServiceProvider.notifier)
                          .joinRoom(r.id, r.boardId),
                    ),
                  );
                },
              ),
      ),
    );
  }
}