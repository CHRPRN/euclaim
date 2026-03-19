import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../core/providers/external_providers.dart';

part 'upload_provider.g.dart';

@riverpod
class UploadController extends _$UploadController {
  @override
  FutureOr<String?> build() => null;

  Future<void> uploadDocument(
    String claimId,
    String docId, {
    String type = 'image',
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      Uint8List? dataToUpload;
      String extension = 'jpg';

      if (type == 'pdf') {
        final filePicker = ref.read(filePickerProvider);
        final result = await filePicker.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
        );
        if (result == null || result.files.single.bytes == null) {
          // In web results.files.single.path might be null, but bytes are there
          // In mobile results.files.single.path is there, but bytes might be null initially
          if (result?.files.single.path != null) {
            dataToUpload = await File(result!.files.single.path!).readAsBytes();
          } else {
            return null;
          }
        } else {
          dataToUpload = result.files.single.bytes;
        }
        extension = 'pdf';
      } else {
        final imagePicker = ref.read(imagePickerProvider);
        final XFile? image = await imagePicker.pickImage(
          source: ImageSource.camera,
        );
        if (image == null) return null;

        final compressor = ref.read(appImageCompressorProvider);
        dataToUpload = await compressor.compressWithFile(
          image.path,
          quality: 70,
        );
      }

      if (dataToUpload == null) return null;

      final firebaseStorage = ref.read(firebaseStorageProvider);
      final refStorage = firebaseStorage.ref().child(
        'applications/$claimId/$docId/${const Uuid().v4()}.$extension',
      );
      await refStorage.putData(dataToUpload);

      return await refStorage.getDownloadURL();
    });
  }
}
