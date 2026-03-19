// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claims_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(claimsCatalog)
final claimsCatalogProvider = ClaimsCatalogProvider._();

final class ClaimsCatalogProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Map<String, dynamic>>>,
          List<Map<String, dynamic>>,
          Stream<List<Map<String, dynamic>>>
        >
    with
        $FutureModifier<List<Map<String, dynamic>>>,
        $StreamProvider<List<Map<String, dynamic>>> {
  ClaimsCatalogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'claimsCatalogProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$claimsCatalogHash();

  @$internal
  @override
  $StreamProviderElement<List<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Map<String, dynamic>>> create(Ref ref) {
    return claimsCatalog(ref);
  }
}

String _$claimsCatalogHash() => r'b892cd639c9fbe61d60d3c6a2094653a33cb5179';
