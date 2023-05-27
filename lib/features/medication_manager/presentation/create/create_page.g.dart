// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'create_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nameTextEditingControllerHash() =>
    r'6d7c56afb6647506324730188272ccbe842e57c5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef _NameTextEditingControllerRef
    = AutoDisposeProviderRef<TextEditingController>;

/// See also [_nameTextEditingController].
@ProviderFor(_nameTextEditingController)
const _nameTextEditingControllerProvider = _NameTextEditingControllerFamily();

/// See also [_nameTextEditingController].
class _NameTextEditingControllerFamily extends Family<TextEditingController> {
  /// See also [_nameTextEditingController].
  const _NameTextEditingControllerFamily();

  /// See also [_nameTextEditingController].
  _NameTextEditingControllerProvider call(
    String name,
  ) {
    return _NameTextEditingControllerProvider(
      name,
    );
  }

  @override
  _NameTextEditingControllerProvider getProviderOverride(
    covariant _NameTextEditingControllerProvider provider,
  ) {
    return call(
      provider.name,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'_nameTextEditingControllerProvider';
}

/// See also [_nameTextEditingController].
class _NameTextEditingControllerProvider
    extends AutoDisposeProvider<TextEditingController> {
  /// See also [_nameTextEditingController].
  _NameTextEditingControllerProvider(
    this.name,
  ) : super.internal(
          (ref) => _nameTextEditingController(
            ref,
            name,
          ),
          from: _nameTextEditingControllerProvider,
          name: r'_nameTextEditingControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$nameTextEditingControllerHash,
          dependencies: _NameTextEditingControllerFamily._dependencies,
          allTransitiveDependencies:
              _NameTextEditingControllerFamily._allTransitiveDependencies,
        );

  final String name;

  @override
  bool operator ==(Object other) {
    return other is _NameTextEditingControllerProvider && other.name == name;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
