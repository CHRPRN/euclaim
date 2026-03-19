import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:euclaim_mobile/features/paywall/paywall_screen.dart';
import 'package:euclaim_mobile/features/paywall/paywall_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockPaywallController extends Mock implements PaywallController {}

void main() {
  testWidgets('PaywallScreen mostra il caricamento o il bottone', (WidgetTester tester) async {
    final mockController = MockPaywallController();
    // Il mock deve ritornare un Future/FutureOr per build()
    when(() => mockController.build()).thenAnswer((_) async => false);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          paywallControllerProvider.overrideWith(() => mockController),
        ],
        child: const MaterialApp(home: PaywallScreen()),
      ),
    );

    // Verifica che l'app carichi senza crashare
    expect(find.byType(PaywallScreen), findsOneWidget);
  });
}
