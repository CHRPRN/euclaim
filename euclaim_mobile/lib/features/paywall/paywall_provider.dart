import 'dart:io';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/external_providers.dart';

part 'paywall_provider.g.dart';

@riverpod
class PaywallController extends _$PaywallController {
  @override
  FutureOr<bool> build() async {
    final purchases = ref.read(revenueCatPurchasesProvider);
    
    // Configurazione chiavi per piattaforma
    String apiKey = 'goog_vzKegQsuJPvmMnfePlIhwdrcBkD';
    if (Platform.isIOS) {
      apiKey = 'TODO_IOS_PUBLIC_KEY';
    }

    await purchases.configure(
      PurchasesConfiguration(apiKey),
    );
    
    // Per i consumabili, lo stato "pro" potrebbe dipendere da un contatore nel DB
    // ma verifichiamo comunque se ci sono entitlement attivi (es: se l'utente ha acquistato ma non consumato)
    final customerInfo = await purchases.getCustomerInfo();
    return customerInfo.entitlements.active.isNotEmpty;
  }

  Future<void> purchaseSingleClaim() => _purchasePackage('single_claim');
  Future<void> purchaseBundle3() => _purchasePackage('bundle_3_claims');

  Future<void> _purchasePackage(String packageId) async {
    final purchases = ref.read(revenueCatPurchasesProvider);
    final offerings = await purchases.getOfferings();
    if (offerings.current != null) {
      final package = offerings.current!.getPackage(packageId);
      if (package != null) {
        await purchases.purchasePackage(package);
        ref.invalidateSelf();
      }
    }
  }
}
