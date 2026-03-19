import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:euclaim_mobile/features/paywall/paywall_provider.dart';

class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paywallAsync = ref.watch(paywallControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sblocca Pratica')),
      body: paywallAsync.when(
        data: (isPro) => Center(
          child: ElevatedButton(
            onPressed: () =>
                ref.read(paywallControllerProvider.notifier).purchaseCredit(),
            child: const Text('Acquista Credito'),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Errore: $err')),
      ),
    );
  }
}
