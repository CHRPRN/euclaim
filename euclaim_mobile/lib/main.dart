import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:euclaim_mobile/core/router.dart';

import 'package:euclaim_mobile/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: EUClaimApp()));
}

class EUClaimApp extends ConsumerWidget {
  const EUClaimApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'EUClaim',
      theme: ThemeData(
        primaryColor: const Color(0xFF0A2540),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
