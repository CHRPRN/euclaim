import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:euclaim_mobile/features/claims/dynamic_claim_form.dart';
import 'package:euclaim_mobile/features/upload/upload_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockUploadController extends Mock implements UploadController {}

void main() {
  testWidgets('DynamicClaimForm mostra i documenti richiesti', (
    WidgetTester tester,
  ) async {
    final requiredDocs = [
      {'id': 'doc1', 'label': 'Documento Identità'},
      {'id': 'doc2', 'label': 'Contratto'},
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          uploadControllerProvider.overrideWith(() => MockUploadController()),
        ],
        child: MaterialApp(
          home: DynamicClaimForm(
            claimId: 'test_claim',
            requiredDocs: requiredDocs,
          ),
        ),
      ),
    );

    expect(find.text('Documento Identità'), findsOneWidget);
    expect(find.text('Contratto'), findsOneWidget);
    expect(find.byIcon(Icons.camera_alt), findsNWidgets(2));
  });
}
