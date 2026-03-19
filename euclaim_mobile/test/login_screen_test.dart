import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:euclaim_mobile/features/auth/login_screen.dart';
import 'package:euclaim_mobile/features/auth/auth_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthController extends Mock implements AuthController {}

void main() {
  testWidgets('LoginScreen mostra il bottone di accesso', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: LoginScreen())),
    );

    expect(find.text('Accedi con Google'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
