import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:euclaim_mobile/features/auth/auth_provider.dart';
import 'package:euclaim_mobile/features/claims/claims_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final claimsAsync = ref.watch(claimsCatalogProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EUClaim'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () =>
                ref.read(authControllerProvider.notifier).signOut(),
          ),
        ],
      ),
      body: claimsAsync.when(
        data: (claims) => ListView.builder(
          itemCount: claims.length,
          itemBuilder: (context, index) {
            final claim = claims[index];
            return ListTile(
              title: Text(claim['title'] ?? 'Senza titolo'),
              subtitle: Text(claim['description'] ?? ''),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Errore: $err')),
      ),
    );
  }
}
