import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:euclaim_mobile/features/auth/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              ref.read(authControllerProvider.notifier).signInWithGoogle(),
          child: const Text('Accedi con Google'),
        ),
      ),
    );
  }
}
