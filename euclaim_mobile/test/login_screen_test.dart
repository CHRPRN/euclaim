import 'package:euclaim_mobile/features/auth/login_screen.dart';
import 'package:euclaim_mobile/core/providers/external_providers.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoginScreen mostra il bottone di accesso', (WidgetTester tester) async {
    final mockAuth = MockFirebaseAuth();
    final mockGoogle = MockGoogleSignIn();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          firebaseAuthProvider.overrideWithValue(mockAuth),
          googleSignInProvider.overrideWithValue(mockGoogle),
        ],
        child: const MaterialApp(home: LoginScreen()),
      ),
    );

    expect(find.text('Accedi con Google'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
