import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/account_credentials.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/authentication_state.dart';
import 'package:mobiarmy_flutter/shared/widgets/bitmap_text.dart';
import 'package:mobiarmy_flutter/shared/widgets/game_viewport.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_button.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_panel.dart';
import 'package:mobiarmy_flutter/shared/widgets/menu_background.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> with SingleTickerProviderStateMixin {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _remember = true;
  bool _showIntro = true;
  late final AnimationController _introController;

  @override
  void initState() {
    super.initState();
    _introController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward().then((_) => setState(() => _showIntro = false));

    Future<void>.microtask(() async {
      final saved = await ref
          .read(authControllerProvider.notifier)
          .loadRememberedCredentials();
      if (saved != null && mounted) {
        _username.text = saved.username;
        _password.text = saved.password;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _introController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    FocusScope.of(context).unfocus();
    await ref.read(authControllerProvider.notifier).login(
          AccountCredentials(
            username: _username.text.trim(),
            password: _password.text,
          ),
          remember: _remember,
        );
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    final isBusy = auth.status == AuthStatus.authenticating;

    return Scaffold(
      body: GameViewport(
        child: Stack(
          children: [
            const MenuBackground(),

            if (_showIntro)
              _buildIntro()
            else
              _buildLoginForm(auth, isBusy),

            // Soft Keys (Bottom Bar)
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
                      label: 'Menu',
                      onPressed: () => ref.read(authControllerProvider.notifier).disconnect(),
                    ),
                    if (isBusy)
                      const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    else
                      LegacyButton(
                        label: 'Đăng nhập',
                        onPressed: _login,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntro() {
    return AnimatedBuilder(
      animation: _introController,
      builder: (context, child) {
        return Center(
          child: Opacity(
            opacity: 1.0 - _introController.value,
            child: const BitmapText('Mobi Army 2', scale: 2.0),
          ),
        );
      },
    );
  }

  Widget _buildLoginForm(AuthenticationState auth, bool isBusy) {
    return Center(
      child: SingleChildScrollView(
        child: LegacyPanel(
          width: 250,
          height: 180,
          title: 'Đăng nhập',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _LegacyTextField(
                controller: _username,
                label: 'Tài khoản:',
                enabled: !isBusy,
              ),
              const SizedBox(height: 10),
              _LegacyTextField(
                controller: _password,
                label: 'Mật khẩu:',
                obscureText: true,
                enabled: !isBusy,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => setState(() => _remember = !_remember),
                child: Row(
                  children: [
                    Icon(
                      _remember ? Icons.check_box : Icons.check_box_outline_blank,
                      size: 16,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 4),
                    const BitmapText('Nhớ tài khoản', scale: 0.8, colorIndex: 2),
                  ],
                ),
              ),
              if (auth.status == AuthStatus.failed)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: BitmapText(
                    auth.message ?? 'Lỗi đăng nhập',
                    colorIndex: 8, // RED
                    scale: 0.7,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LegacyTextField extends StatelessWidget {
  const _LegacyTextField({
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: BitmapText(label, scale: 0.8, colorIndex: 2),
        ),
        Expanded(
          child: Container(
            height: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFF303030)),
            ),
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              enabled: enabled,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'monospace',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
