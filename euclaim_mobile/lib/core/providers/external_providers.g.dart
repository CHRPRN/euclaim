// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(firebaseAuth)
final firebaseAuthProvider = FirebaseAuthProvider._();

final class FirebaseAuthProvider
    extends $FunctionalProvider<FirebaseAuth, FirebaseAuth, FirebaseAuth>
    with $Provider<FirebaseAuth> {
  FirebaseAuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseAuthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseAuthHash();

  @$internal
  @override
  $ProviderElement<FirebaseAuth> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FirebaseAuth create(Ref ref) {
    return firebaseAuth(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseAuth value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseAuth>(value),
    );
  }
}

String _$firebaseAuthHash() => r'8f84097cccd00af817397c1715c5f537399ba780';

@ProviderFor(googleSignIn)
final googleSignInProvider = GoogleSignInProvider._();

final class GoogleSignInProvider
    extends $FunctionalProvider<GoogleSignIn, GoogleSignIn, GoogleSignIn>
    with $Provider<GoogleSignIn> {
  GoogleSignInProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleSignInProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleSignInHash();

  @$internal
  @override
  $ProviderElement<GoogleSignIn> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoogleSignIn create(Ref ref) {
    return googleSignIn(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoogleSignIn value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoogleSignIn>(value),
    );
  }
}

String _$googleSignInHash() => r'0b3da4c5bf629e3f7401a2a78c79cccd40689ce1';

@ProviderFor(firebaseFirestore)
final firebaseFirestoreProvider = FirebaseFirestoreProvider._();

final class FirebaseFirestoreProvider
    extends
        $FunctionalProvider<
          FirebaseFirestore,
          FirebaseFirestore,
          FirebaseFirestore
        >
    with $Provider<FirebaseFirestore> {
  FirebaseFirestoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseFirestoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseFirestoreHash();

  @$internal
  @override
  $ProviderElement<FirebaseFirestore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirebaseFirestore create(Ref ref) {
    return firebaseFirestore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseFirestore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseFirestore>(value),
    );
  }
}

String _$firebaseFirestoreHash() => r'eca974fdc891fcd3f9586742678f47582b20adec';

@ProviderFor(firebaseStorage)
final firebaseStorageProvider = FirebaseStorageProvider._();

final class FirebaseStorageProvider
    extends
        $FunctionalProvider<FirebaseStorage, FirebaseStorage, FirebaseStorage>
    with $Provider<FirebaseStorage> {
  FirebaseStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseStorageHash();

  @$internal
  @override
  $ProviderElement<FirebaseStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FirebaseStorage create(Ref ref) {
    return firebaseStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseStorage>(value),
    );
  }
}

String _$firebaseStorageHash() => r'47903c48019f7dfa1ba82fa0a905885442d69f6b';

@ProviderFor(imagePicker)
final imagePickerProvider = ImagePickerProvider._();

final class ImagePickerProvider
    extends $FunctionalProvider<ImagePicker, ImagePicker, ImagePicker>
    with $Provider<ImagePicker> {
  ImagePickerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imagePickerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imagePickerHash();

  @$internal
  @override
  $ProviderElement<ImagePicker> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ImagePicker create(Ref ref) {
    return imagePicker(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImagePicker value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImagePicker>(value),
    );
  }
}

String _$imagePickerHash() => r'7740c09b2d6b395ce466f1b72b93b31db7bfd740';

@ProviderFor(filePicker)
final filePickerProvider = FilePickerProvider._();

final class FilePickerProvider
    extends
        $FunctionalProvider<
          FilePickerWrapper,
          FilePickerWrapper,
          FilePickerWrapper
        >
    with $Provider<FilePickerWrapper> {
  FilePickerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filePickerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filePickerHash();

  @$internal
  @override
  $ProviderElement<FilePickerWrapper> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FilePickerWrapper create(Ref ref) {
    return filePicker(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FilePickerWrapper value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FilePickerWrapper>(value),
    );
  }
}

String _$filePickerHash() => r'92e4920dd45c4daf3fd344962c568b10e05be889';

@ProviderFor(RevenueCatPurchases)
final revenueCatPurchasesProvider = RevenueCatPurchasesProvider._();

final class RevenueCatPurchasesProvider
    extends $NotifierProvider<RevenueCatPurchases, PurchasesWrapper> {
  RevenueCatPurchasesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'revenueCatPurchasesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$revenueCatPurchasesHash();

  @$internal
  @override
  RevenueCatPurchases create() => RevenueCatPurchases();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PurchasesWrapper value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PurchasesWrapper>(value),
    );
  }
}

String _$revenueCatPurchasesHash() =>
    r'285475e5c8d67f9905f3307d67d0bcff8432aa82';

abstract class _$RevenueCatPurchases extends $Notifier<PurchasesWrapper> {
  PurchasesWrapper build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PurchasesWrapper, PurchasesWrapper>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PurchasesWrapper, PurchasesWrapper>,
              PurchasesWrapper,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AppImageCompressor)
final appImageCompressorProvider = AppImageCompressorProvider._();

final class AppImageCompressorProvider
    extends $NotifierProvider<AppImageCompressor, ImageCompressor> {
  AppImageCompressorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appImageCompressorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appImageCompressorHash();

  @$internal
  @override
  AppImageCompressor create() => AppImageCompressor();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageCompressor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageCompressor>(value),
    );
  }
}

String _$appImageCompressorHash() =>
    r'c35b068fe5ffa7801ded31cbc60e01378dd73261';

abstract class _$AppImageCompressor extends $Notifier<ImageCompressor> {
  ImageCompressor build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ImageCompressor, ImageCompressor>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ImageCompressor, ImageCompressor>,
              ImageCompressor,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
