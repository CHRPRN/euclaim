import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'external_providers.g.dart';

@riverpod
FirebaseAuth firebaseAuth(Ref ref) => FirebaseAuth.instance;
@riverpod
GoogleSignIn googleSignIn(Ref ref) => GoogleSignIn();
@riverpod
FirebaseFirestore firebaseFirestore(Ref ref) => FirebaseFirestore.instance;

@riverpod
FirebaseStorage firebaseStorage(Ref ref) => FirebaseStorage.instance;

@riverpod
ImagePicker imagePicker(Ref ref) => ImagePicker();

class FilePickerWrapper {
  Future<FilePickerResult?> pickFiles({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
  }) =>
      FilePicker.platform.pickFiles(type: type, allowedExtensions: allowedExtensions);
}

@riverpod
FilePickerWrapper filePicker(Ref ref) => FilePickerWrapper();

// Wrappers for static classes to allow mocking
class PurchasesWrapper {
  Future<void> configure(PurchasesConfiguration configuration) =>
      Purchases.configure(configuration);
  Future<CustomerInfo> getCustomerInfo() => Purchases.getCustomerInfo();
  Future<Offerings> getOfferings() => Purchases.getOfferings();
  Future<CustomerInfo> purchasePackage(Package package) async {
    // ignore: deprecated_member_use
    final result = await Purchases.purchasePackage(package);
    return result.customerInfo;
  }
}

@riverpod
class RevenueCatPurchases extends _$RevenueCatPurchases {
  @override
  PurchasesWrapper build() => PurchasesWrapper();
}

class ImageCompressor {
  Future<Uint8List?> compressWithFile(String path, {int quality = 70}) =>
      FlutterImageCompress.compressWithFile(path, quality: quality);
}

@riverpod
class AppImageCompressor extends _$AppImageCompressor {
  @override
  ImageCompressor build() => ImageCompressor();
}
