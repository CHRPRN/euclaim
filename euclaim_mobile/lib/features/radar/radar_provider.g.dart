// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radar_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userApplications)
final userApplicationsProvider = UserApplicationsFamily._();

final class UserApplicationsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Map<String, dynamic>>>,
          List<Map<String, dynamic>>,
          Stream<List<Map<String, dynamic>>>
        >
    with
        $FutureModifier<List<Map<String, dynamic>>>,
        $StreamProvider<List<Map<String, dynamic>>> {
  UserApplicationsProvider._({
    required UserApplicationsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userApplicationsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userApplicationsHash();

  @override
  String toString() {
    return r'userApplicationsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Map<String, dynamic>>> create(Ref ref) {
    final argument = this.argument as String;
    return userApplications(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserApplicationsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userApplicationsHash() => r'308643ade108791f692630e0eedbe0fc7000d10b';

final class UserApplicationsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Map<String, dynamic>>>, String> {
  UserApplicationsFamily._()
    : super(
        retry: null,
        name: r'userApplicationsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserApplicationsProvider call(String userId) =>
      UserApplicationsProvider._(argument: userId, from: this);

  @override
  String toString() => r'userApplicationsProvider';
}
