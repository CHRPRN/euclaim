import 'package:euclaim_mobile/features/auth/auth_provider.dart';
import 'package:euclaim_mobile/core/providers/external_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class FakeAuthCredential extends Fake implements AuthCredential {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {
  @override
  String? get accessToken => 'fake-access-token';
  @override
  String? get idToken => 'fake-id-token';
}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {
  GoogleSignInAccount? mockAccount;
  @override
  Future<GoogleSignInAccount?> signIn() async => mockAccount;
  @override
  Future<GoogleSignInAccount?> signOut() async => null;
}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockGoogleSignIn mockGoogleSignIn;
  late MockGoogleSignInAccount mockGoogleSignInAccount;
  late MockUserCredential mockUserCredential;
  late ProviderContainer container;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockGoogleSignIn = MockGoogleSignIn();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    mockUserCredential = MockUserCredential();

    container = ProviderContainer(
      overrides: [
        firebaseAuthProvider.overrideWithValue(mockFirebaseAuth),
        googleSignInProvider.overrideWithValue(mockGoogleSignIn),
      ],
    );

    registerFallbackValue(FakeAuthCredential());
  });

  tearDown(() {
    container.dispose();
  });

  group('AuthController', () {
    test(
      'signOut calls FirebaseAuth.signOut and GoogleSignIn.signOut',
      () async {
        when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async {});
        when(() => mockGoogleSignIn.signOut()).thenAnswer((_) async => null);

        await container.read(authControllerProvider.notifier).signOut();

        verify(() => mockFirebaseAuth.signOut()).called(1);
        verify(() => mockGoogleSignIn.signOut()).called(1);
      },
    );

    test(
      'signInWithGoogle success calls FirebaseAuth.signInWithCredential',
      () async {
        mockGoogleSignIn.mockAccount = mockGoogleSignInAccount;
        final mockAuth = MockGoogleSignInAuthentication();

        when(
          () => mockGoogleSignInAccount.authentication,
        ).thenAnswer((_) async => mockAuth);
        when(
          () => mockFirebaseAuth.signInWithCredential(any()),
        ).thenAnswer((_) async => mockUserCredential);

        await container
            .read(authControllerProvider.notifier)
            .signInWithGoogle();

        verify(() => mockFirebaseAuth.signInWithCredential(any())).called(1);
      },
    );

    test('signInWithGoogle returns early if user cancels', () async {
      mockGoogleSignIn.mockAccount = null;

      await container.read(authControllerProvider.notifier).signInWithGoogle();

      verifyNever(() => mockFirebaseAuth.signInWithCredential(any()));
    });
  });
}
