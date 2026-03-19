import 'dart:typed_data';
import 'package:euclaim_mobile/core/providers/external_providers.dart';
import 'package:euclaim_mobile/features/upload/upload_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MockImagePicker extends Mock implements ImagePicker {}
class MockImageCompressor extends Mock implements ImageCompressor {}
class MockFirebaseStorage extends Mock implements FirebaseStorage {}
class MockReference extends Mock implements Reference {}
class MockUploadTask extends Mock implements UploadTask {}
class MockTaskSnapshot extends Mock implements TaskSnapshot {}
class MockXFile extends Mock implements XFile {}

void main() {
  late MockImagePicker mockImagePicker;
  late MockImageCompressor mockImageCompressor;
  late MockFirebaseStorage mockFirebaseStorage;
  late MockReference mockReference;
  late MockUploadTask mockUploadTask;
  late MockTaskSnapshot mockTaskSnapshot;
  late MockXFile mockXFile;
  late ProviderContainer container;

  setUp(() {
    mockImagePicker = MockImagePicker();
    mockImageCompressor = MockImageCompressor();
    mockFirebaseStorage = MockFirebaseStorage();
    mockReference = MockReference();
    mockUploadTask = MockUploadTask();
    mockTaskSnapshot = MockTaskSnapshot();
    mockXFile = MockXFile();

    container = ProviderContainer(
      overrides: [
        imagePickerProvider.overrideWithValue(mockImagePicker),
        appImageCompressorProvider.overrideWithValue(mockImageCompressor),
        firebaseStorageProvider.overrideWithValue(mockFirebaseStorage),
      ],
    );

    registerFallbackValue(Uint8List(0));
  });

  tearDown(() {
    container.dispose();
  });

  group('UploadController', () {
    test('uploadDocument successful flow', () async {
      const claimId = 'claim123';
      const docId = 'doc456';
      const downloadUrl = 'https://fake-url.com/image.jpg';

      when(() => mockImagePicker.pickImage(source: ImageSource.camera))
          .thenAnswer((_) async => mockXFile);
      when(() => mockXFile.path).thenReturn('fake/path.jpg');
      
      when(() => mockImageCompressor.compressWithFile(any(), quality: any(named: 'quality')))
          .thenAnswer((_) async => Uint8List.fromList([1, 2, 3]));

      when(() => mockFirebaseStorage.ref()).thenReturn(mockReference);
      when(() => mockReference.child(any())).thenReturn(mockReference);
      when(() => mockReference.putData(any())).thenAnswer((_) => mockUploadTask);
      when(() => mockUploadTask.then(any())).thenAnswer((_) async => mockTaskSnapshot);
      when(() => mockReference.getDownloadURL()).thenAnswer((_) async => downloadUrl);

      await container.read(uploadControllerProvider.notifier).uploadDocument(claimId, docId);

      expect(container.read(uploadControllerProvider).value, downloadUrl);
      verify(() => mockImagePicker.pickImage(source: ImageSource.camera)).called(1);
      verify(() => mockReference.putData(any())).called(1);
    });

    test('uploadDocument returns null if user cancels picking', () async {
      when(() => mockImagePicker.pickImage(source: ImageSource.camera))
          .thenAnswer((_) async => null);

      await container.read(uploadControllerProvider.notifier).uploadDocument('id', 'doc');

      expect(container.read(uploadControllerProvider).value, null);
      verifyNever(() => mockImageCompressor.compressWithFile(any(), quality: any(named: 'quality')));
    });
  });
}
