import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiarmy_flutter/app/router/app_route.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/lobby/application/lobby_controller.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/lobby_state.dart';
import 'package:mobiarmy_flutter/shared/widgets/bitmap_text.dart';
import 'package:mobiarmy_flutter/shared/widgets/game_viewport.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_button.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_dialog.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_panel.dart';

class LobbyScreen extends ConsumerWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lobby = ref.watch(lobbyControllerProvider);
    final notifier = ref.read(lobbyControllerProvider.notifier);

    ref.listen(lobbyControllerProvider, (previous, next) {
      if (next.status == LobbyStatus.joined) {
        context.go(AppRoute.room.path);
      }
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final exit = await LegacyDialog.showExitDialog(context);
        if (exit == true) {
          await ref.read(authControllerProvider.notifier).disconnect();
        }
      },
      child: Scaffold(
        body: GameViewport(
          child: Stack(
            children: [
            // Background
            Container(color: const Color(0xFF77D3FF)),

            Center(
              child: LegacyPanel(
                width: 400,
                height: 250,
                title: lobby.status == LobbyStatus.boardsLoaded
                    ? 'Khu vực ${lobby.selectedAreaId}'
                    : 'Chọn khu vực',
                child: lobby.isBusy
                    ? const Center(child: CircularProgressIndicator())
                    : lobby.status == LobbyStatus.boardsLoaded
                        ? _BoardList(
                            areaId: lobby.selectedAreaId!,
                            boards: lobby.boards,
                          )
                        : _AreaList(areas: lobby.areas),
              ),
            ),

            // Soft Keys
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 35,
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LegacyButton(
                      label: lobby.status == LobbyStatus.boardsLoaded ? 'Quay lại' : 'Thoát',
                      width: 80,
                      height: 25,
                      onPressed: () {
                        if (lobby.status == LobbyStatus.boardsLoaded) {
                          notifier.loadAreas();
                        } else {
                          context.go('/');
                        }
                      },
                    ),
                    Row(
                      children: [
                        LegacyButton(
                          label: 'Thêm',
                          width: 80,
                          height: 25,
                          onPressed: () => _showMoreMenu(context),
                        ),
                        const SizedBox(width: 5),
                        LegacyButton(
                          label: 'Chơi ngay',
                          width: 80,
                          height: 25,
                          onPressed: () => notifier.quickJoin(0), // Mode 0 = default quick play
                        ),
                        const SizedBox(width: 5),
                        LegacyButton(
                          label: 'Cập nhật',
                          width: 80,
                          height: 25,
                          onPressed: () {
                            if (lobby.status == LobbyStatus.boardsLoaded && lobby.selectedAreaId != null) {
                              notifier.loadBoards(lobby.selectedAreaId!);
                            } else {
                              notifier.loadAreas();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

  void _showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _MenuIcon(icon: Icons.inventory, label: 'Hành trang', route: AppRoute.inventory),
            _MenuIcon(icon: Icons.shopping_cart, label: 'Cửa hàng', route: AppRoute.shop),
            _MenuIcon(icon: Icons.people, label: 'Bạn bè', route: AppRoute.friends),
            _MenuIcon(icon: Icons.shield, label: 'Biệt đội', route: AppRoute.clan),
            _MenuIcon(icon: Icons.assignment, label: 'Nhiệm vụ', route: AppRoute.missions),
            _MenuIcon(icon: Icons.casino, label: 'Quay số', route: AppRoute.luckyGame),
            _MenuIcon(icon: Icons.leaderboard, label: 'Hạng', route: AppRoute.ranking),
            _MenuIcon(icon: Icons.build, label: 'Chế tạo', route: AppRoute.formulas),
            _MenuIcon(icon: Icons.account_circle, label: 'Cá nhân', route: AppRoute.profile),
          ],
        ),
      ),
    );
  }
}

class _MenuIcon extends StatelessWidget {
  const _MenuIcon({required this.icon, required this.label, required this.route});
  final IconData icon;
  final String label;
  final AppRoute route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        context.push(route.path);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _AreaList extends ConsumerWidget {
  const _AreaList({required this.areas});
  final List<dynamic> areas;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (areas.isEmpty) {
      return const Center(child: BitmapText('Không có khu vực nào', scale: 0.8));
    }
    return ListView.builder(
      itemCount: areas.length,
      itemBuilder: (context, index) {
        final area = areas[index];
        return ListTile(
          dense: true,
          title: BitmapText('Khu vực ${area.id}', scale: 0.9),
          subtitle: BitmapText('Trạng thái: ${area.status} - Loại: ${area.type}', scale: 0.7),
          trailing: const Icon(Icons.chevron_right, color: Colors.black54),
          onTap: () => ref.read(lobbyControllerProvider.notifier).loadBoards(area.id),
        );
      },
    );
  }
}

class _BoardList extends ConsumerWidget {
  const _BoardList({required this.areaId, required this.boards});
  final int areaId;
  final List<dynamic> boards;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (boards.isEmpty) {
      return const Center(child: BitmapText('Không có bàn nào trống', scale: 0.8));
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: boards.length,
      itemBuilder: (context, index) {
        final board = boards[index];
        final isFull = board.numPlayers >= board.maxPlayers;

        return GestureDetector(
          onTap: board.isStarted || isFull
              ? null
              : () {
                  if (board.hasPassword) {
                    _promptPassword(context, ref, board.id);
                  } else {
                    ref.read(lobbyControllerProvider.notifier).joinBoard(areaId, board.id);
                  }
                },
          child: Container(
            decoration: BoxDecoration(
              color: board.isStarted
                  ? Colors.grey
                  : isFull
                      ? Colors.redAccent.withValues(alpha: 0.2)
                      : const Color(0xFF3379FF).withValues(alpha: 0.3),
              border: Border.all(color: const Color(0xFF303030)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BitmapText('Bàn ${board.id}', scale: 0.8),
                BitmapText('${board.numPlayers}/${board.maxPlayers}', scale: 0.6),
                if (board.hasPassword)
                  const Icon(Icons.lock, size: 12, color: Colors.amber),
              ],
            ),
          ),
        );
      },
    );
  }

  void _promptPassword(BuildContext context, WidgetRef ref, int boardId) {
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Mật khẩu bàn $boardId'),
        content: TextField(
          controller: textController,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Nhập mật khẩu'),
          obscureText: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              ref.read(lobbyControllerProvider.notifier).joinBoard(areaId, boardId, textController.text);
              Navigator.of(ctx).pop();
            },
            child: const Text('Vào phòng'),
          ),
        ],
      ),
    );
  }
}