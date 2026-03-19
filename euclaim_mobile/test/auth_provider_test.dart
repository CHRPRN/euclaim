import 'package:euclaim_mobile/features/auth/auth_provider.dart';
import 'package:euclaim_mobile/core/providers/external_providers.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AuthController can be initialized', () {
    final mockAuth = MockFirebaseAuth();
    final mockGoogle = MockGoogleSignIn();

    final container = ProviderContainer(
      overrides: [
        firebaseAuthProvider.overrideWithValue(mockAuth),
        googleSignInProvider.overrideWithValue(mockGoogle),
      ],
    );

    addTearDown(container.dispose);

    final controller = container.read(authControllerProvider.notifier);
    expect(controller, isNotNull);
  });
}
