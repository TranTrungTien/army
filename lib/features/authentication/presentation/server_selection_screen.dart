import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiarmy_flutter/app/router/app_route.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/authentication/data/server_catalog.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/authentication_state.dart';

class ServerSelectionScreen extends ConsumerWidget {
  const ServerSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);

    // Router redirect pushes us to /login automatically once connected.
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Chọn server',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Máy ảo Android dùng 10.0.2.2 · thiết bị thật dùng IP LAN của máy chạy server',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    for (final server in ServerCatalog.servers)
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.dns),
                          title: Text(server.name),
                          subtitle: Text(server.endpoint),
                          trailing: FilledButton(
                            onPressed: auth.isBusy
                                ? null
                                : () => ref
                                      .read(authControllerProvider.notifier)
                                      .connect(server),
                            child: const Text('Kết nối'),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (auth.isBusy)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      SizedBox(width: 12),
                      Text('Đang kết nối / handshake…'),
                    ],
                  ),
                ),
              if (auth.status == AuthStatus.failed && auth.message != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.redAccent),
                  ),
                  child: Text(
                    auth.message!,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                icon: const Icon(Icons.sports_esports),
                label: const Text('Chơi offline (sandbox)'),
                onPressed: () => context.go(AppRoute.gameplaySandbox.path),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
