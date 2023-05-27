// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'medication_info_form.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$periodFamilyHash() => r'5843cb7b9684304088d43bf038c8ba8d6fee0519';

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

typedef PeriodFamilyRef = AutoDisposeProviderRef<String>;

/// See also [periodFamily].
@ProviderFor(periodFamily)
const periodFamilyProvider = PeriodFamilyFamily();

/// See also [periodFamily].
class PeriodFamilyFamily extends Family<String> {
  /// See also [periodFamily].
  const PeriodFamilyFamily();

  /// See also [periodFamily].
  PeriodFamilyProvider call(
    MedicationItem? item,
  ) {
    return PeriodFamilyProvider(
      item,
    );
  }

  @override
  PeriodFamilyProvider getProviderOverride(
    covariant PeriodFamilyProvider provider,
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
  String? get name => r'periodFamilyProvider';
}

/// See also [periodFamily].
class PeriodFamilyProvider extends AutoDisposeProvider<String> {
  /// See also [periodFamily].
  PeriodFamilyProvider(
    this.item,
  ) : super.internal(
          (ref) => periodFamily(
            ref,
            item,
          ),
          from: periodFamilyProvider,
          name: r'periodFamilyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$periodFamilyHash,
          dependencies: PeriodFamilyFamily._dependencies,
          allTransitiveDependencies:
              PeriodFamilyFamily._allTransitiveDependencies,
        );

  final MedicationItem? item;

  @override
  bool operator ==(Object other) {
    return other is PeriodFamilyProvider && other.item == item;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, item.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
