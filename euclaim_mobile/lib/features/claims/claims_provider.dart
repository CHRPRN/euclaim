import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/external_providers.dart';

part 'claims_provider.g.dart';

@riverpod
Stream<List<Map<String, dynamic>>> claimsCatalog(Ref ref) {
  return ref.watch(firebaseFirestoreProvider)
      .collection('claims_catalog')
      .where('status', isEqualTo: 'active')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
}
