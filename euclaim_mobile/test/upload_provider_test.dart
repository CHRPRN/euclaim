import 'package:euclaim_mobile/features/upload/upload_provider.dart';
import 'package:euclaim_mobile/core/providers/external_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:image_picker/image_picker.dart';

class MockImagePicker extends Mock implements ImagePicker {}

void main() {
  test('UploadController can be initialized', () {
    final mockPicker = MockImagePicker();
    final container = ProviderContainer(
      overrides: [
        imagePickerProvider.overrideWithValue(mockPicker),
      ],
    );
    
    final controller = container.read(uploadControllerProvider.notifier);
    expect(controller, isNotNull);
  });
}
