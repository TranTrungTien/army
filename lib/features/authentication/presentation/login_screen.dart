import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/account_credentials.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/authentication_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _remember = true;

  @override
  void initState() {
    super.initState();
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
    super.dispose();
  }

  Future<void> _login() async {
    FocusScope.of(context).unfocus();
    await ref
        .read(authControllerProvider.notifier)
        .login(
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
    final canLogin =
        auth.status == AuthStatus.connected && _username.text.isNotEmpty;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Dang nhap',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 4),
                  Text(
                    'Server: ${auth.server?.endpoint ?? '-'} · client ${AccountCredentials.kClientVersion}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _username,
                    decoration: const InputDecoration(labelText: 'Tai khoan'),
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Mat khau'),
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => canLogin ? _login() : null,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _remember,
                        onChanged: (v) => setState(() => _remember = v ?? true),
                      ),
                      const Text('Nho tai khoan'),
                    ],
                  ),
                  if (auth.status == AuthStatus.failed &&
                      auth.message != null) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.redAccent),
                      ),
                      child: Text(auth.message!,
                          style: const TextStyle(color: Colors.redAccent)),
                    ),
                    const SizedBox(height: 8),
                  ],
                  FilledButton(
                    onPressed: canLogin ? _login : null,
                    child: auth.status == AuthStatus.authenticating
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Dang nhap'),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: auth.isBusy
                        ? null
                        : () => ref
                              .read(authControllerProvider.notifier)
                              .disconnect(),
                    child: const Text('Quay lai chon server'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}