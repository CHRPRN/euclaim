import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:euclaim_mobile/core/providers/external_providers.dart';
import 'package:euclaim_mobile/features/claims/claims_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('claimsCatalog can be initialized', () async {
    final fakeFirestore = FakeFirebaseFirestore();

    final container = ProviderContainer(
      overrides: [
        firebaseFirestoreProvider.overrideWithValue(fakeFirestore),
      ],
    );

    addTearDown(container.dispose);

    // Verifichiamo che possiamo leggere il valore (anche se vuoto inizialmente)
    final value = container.read(claimsCatalogProvider);
    expect(value, isNotNull);
  });
}
