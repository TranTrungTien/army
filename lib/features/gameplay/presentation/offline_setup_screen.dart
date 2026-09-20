import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiarmy_flutter/app/router/app_route.dart';

class OfflineSetupScreen extends StatefulWidget {
  const OfflineSetupScreen({super.key});

  @override
  State<OfflineSetupScreen> createState() => _OfflineSetupScreenState();
}

class _OfflineSetupScreenState extends State<OfflineSetupScreen> {
  int _heroIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chơi offline')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Chọn nhân vật', style: TextStyle(fontSize: 22)),
                const SizedBox(height: 16),
                SegmentedButton<int>(
                  segments: const [
                    ButtonSegment(value: 0, label: Text('Gunner')),
                    ButtonSegment(value: 1, label: Text('Miss 6')),
                  ],
                  selected: {_heroIndex},
                  onSelectionChanged: (selection) =>
                      setState(() => _heroIndex = selection.first),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Bắt đầu sandbox'),
                  onPressed: () => context.go(
                    AppRoute.gameplaySandbox.path,
                    extra: {'heroIndex': _heroIndex},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
