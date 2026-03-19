import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:euclaim_mobile/features/auth/auth_provider.dart';
import 'package:euclaim_mobile/features/auth/login_screen.dart';
import 'package:euclaim_mobile/features/home/home_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = authState.value != null;
      if (!isLoggedIn && state.uri.path != '/login') return '/login';
      if (isLoggedIn && state.uri.path == '/login') return '/';
      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    ],
  );
});
