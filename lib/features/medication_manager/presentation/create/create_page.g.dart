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

String _$dosingStartAtFamilyHash() =>
    r'3789b5954bd35bae173fb8af7b28be7e2e6216ca';
typedef DosingStartAtFamilyRef = AutoDisposeProviderRef<String>;

/// See also [dosingStartAtFamily].
@ProviderFor(dosingStartAtFamily)
const dosingStartAtFamilyProvider = DosingStartAtFamilyFamily();

/// See also [dosingStartAtFamily].
class DosingStartAtFamilyFamily extends Family<String> {
  /// See also [dosingStartAtFamily].
  const DosingStartAtFamilyFamily();

  /// See also [dosingStartAtFamily].
  DosingStartAtFamilyProvider call(
    MedicationItem? item,
  ) {
    return DosingStartAtFamilyProvider(
      item,
    );
  }

  @override
  DosingStartAtFamilyProvider getProviderOverride(
    covariant DosingStartAtFamilyProvider provider,
  ) {
    return call(
      provider.item,
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
  String? get name => r'dosingStartAtFamilyProvider';
}

/// See also [dosingStartAtFamily].
class DosingStartAtFamilyProvider extends AutoDisposeProvider<String> {
  /// See also [dosingStartAtFamily].
  DosingStartAtFamilyProvider(
    this.item,
  ) : super.internal(
          (ref) => dosingStartAtFamily(
            ref,
            item,
          ),
          from: dosingStartAtFamilyProvider,
          name: r'dosingStartAtFamilyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dosingStartAtFamilyHash,
          dependencies: DosingStartAtFamilyFamily._dependencies,
          allTransitiveDependencies:
              DosingStartAtFamilyFamily._allTransitiveDependencies,
        );

  final MedicationItem? item;

  @override
  bool operator ==(Object other) {
    return other is DosingStartAtFamilyProvider && other.item == item;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, item.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
