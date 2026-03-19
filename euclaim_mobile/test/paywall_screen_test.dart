import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:euclaim_mobile/features/paywall/paywall_screen.dart';
import 'package:euclaim_mobile/features/paywall/paywall_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockPaywallController extends Mock implements PaywallController {}

void main() {
  testWidgets('PaywallScreen mostra il bottone di acquisto', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: PaywallScreen())),
    );

    // Attendiamo che il loading finisca
    await tester.pumpAndSettle();

    expect(find.text('Acquista Credito'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
