import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'radar_provider.g.dart';

@riverpod
Stream<List<Map<String, dynamic>>> userApplications(
  Ref ref,
  String userId,
) {
  return FirebaseFirestore.instance
      .collection('user_applications')
      .where('userId', isEqualTo: userId)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
}
