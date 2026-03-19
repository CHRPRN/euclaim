import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:euclaim_mobile/core/providers/external_providers.dart';
import 'package:euclaim_mobile/features/claims/claims_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ignore: subtype_of_sealed_class
class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}
// ignore: subtype_of_sealed_class
class MockCollectionReference<T extends Object?> extends Mock implements CollectionReference<T> {}
// ignore: subtype_of_sealed_class
class MockQuery<T extends Object?> extends Mock implements Query<T> {}
// ignore: subtype_of_sealed_class
class MockQuerySnapshot<T extends Object?> extends Mock implements QuerySnapshot<T> {}
// ignore: subtype_of_sealed_class
class MockQueryDocumentSnapshot<T extends Object?> extends Mock implements QueryDocumentSnapshot<T> {}

void main() {
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollection;
  late MockQuery<Map<String, dynamic>> mockQuery;
  late MockQuerySnapshot<Map<String, dynamic>> mockQuerySnapshot;
  late MockQueryDocumentSnapshot<Map<String, dynamic>> mockDoc;
  late ProviderContainer container;

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockCollection = MockCollectionReference();
    mockQuery = MockQuery();
    mockQuerySnapshot = MockQuerySnapshot();
    mockDoc = MockQueryDocumentSnapshot();

    container = ProviderContainer(
      overrides: [
        firebaseFirestoreProvider.overrideWithValue(mockFirestore),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('claimsCatalog emits active claims', () async {
    final Map<String, dynamic> fakeClaim = {'id': '1', 'name': 'Volo Cancellato', 'status': 'active'};
    
    when(() => mockFirestore.collection('claims_catalog')).thenReturn(mockCollection);
    when(() => mockCollection.where('status', isEqualTo: 'active')).thenReturn(mockQuery);
    when(() => mockQuery.snapshots()).thenAnswer((_) => Stream.value(mockQuerySnapshot));
    when(() => mockQuerySnapshot.docs).thenReturn([mockDoc]);
    when(() => mockDoc.data()).thenReturn(fakeClaim);

    final stream = container.read(claimsCatalogProvider.future);
    final result = await stream;
    
    expect(result, [fakeClaim]);
  });
}
