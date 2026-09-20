import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiarmy_flutter/app/router/app_route.dart';
import 'package:mobiarmy_flutter/core/assets/bmfont.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/authentication/data/server_catalog.dart';
import 'package:mobiarmy_flutter/shared/widgets/bitmap_text.dart';
import 'package:mobiarmy_flutter/shared/widgets/game_viewport.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_button.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_panel.dart';

class ServerSelectionScreen extends ConsumerStatefulWidget {
  const ServerSelectionScreen({super.key});

  @override
  ConsumerState<ServerSelectionScreen> createState() => _ServerSelectionScreenState();
}

class _ServerSelectionScreenState extends ConsumerState<ServerSelectionScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF77D3FF),
      body: GameViewport(
        child: Stack(
          children: [
            Center(
              child: LegacyPanel(
                width: 300,
                height: 200,
                title: 'Chọn máy chủ',
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: ServerCatalog.servers.length,
                  itemBuilder: (context, index) {
                    final server = ServerCatalog.servers[index];
                    final isSelected = _selectedIndex == index;

                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => setState(() => _selectedIndex = index),
                      child: Container(
                        height: 25,
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        color: isSelected ? const Color(0xFFFFA509) : Colors.transparent,
                        alignment: Alignment.center,
                        child: BitmapText(
                          server.name,
                          colorIndex: isSelected ? 2 : -1, // Black if selected
                          anchor: GraphicsAnchor.hCenter | GraphicsAnchor.top,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Bottom Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                color: const Color(0xFFC5D6EE),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LegacyButton(
                      label: 'Cập nhật',
                      onPressed: () {},
                    ),
                    LegacyButton(
                      label: 'Offline',
                      onPressed: () => context.push(AppRoute.offlineSetup.path),
                    ),
                    LegacyButton(
                      label: 'Chọn',
                      onPressed: () {
                        final server = ServerCatalog.servers[_selectedIndex];
                        ref.read(authControllerProvider.notifier).connect(server);
                      },
                    ),
                    LegacyButton(
                      label: 'Thoát',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            if (auth.isBusy)
              const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
