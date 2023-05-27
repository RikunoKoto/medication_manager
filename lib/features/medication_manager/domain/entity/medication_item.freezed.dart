// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MedicationItem {
  int get id => throw _privateConstructorUsedError;

  ///　薬の名前
  String get name => throw _privateConstructorUsedError;

  /// 服用回数
  int get dosageFrequency => throw _privateConstructorUsedError;

  /// 用量（ex.２錠）
  int get dosage => throw _privateConstructorUsedError;

  /// 服用期間
  DateTime get dosingAt => throw _privateConstructorUsedError;

  /// 服用回数overフラグ
  bool get isOverflow => throw _privateConstructorUsedError;

  ///　期間終了フラグ
  bool get isCompleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MedicationItemCopyWith<MedicationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationItemCopyWith<$Res> {
  factory $MedicationItemCopyWith(
          MedicationItem value, $Res Function(MedicationItem) then) =
      _$MedicationItemCopyWithImpl<$Res, MedicationItem>;
  @useResult
  $Res call(
      {int id,
      String name,
      int dosageFrequency,
      int dosage,
      DateTime dosingAt,
      bool isOverflow,
      bool isCompleted});
}

/// @nodoc
class _$MedicationItemCopyWithImpl<$Res, $Val extends MedicationItem>
    implements $MedicationItemCopyWith<$Res> {
  _$MedicationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dosageFrequency = null,
    Object? dosage = null,
    Object? dosingAt = null,
    Object? isOverflow = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dosageFrequency: null == dosageFrequency
          ? _value.dosageFrequency
          : dosageFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as int,
      dosingAt: null == dosingAt
          ? _value.dosingAt
          : dosingAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isOverflow: null == isOverflow
          ? _value.isOverflow
          : isOverflow // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MedicationItemCopyWith<$Res>
    implements $MedicationItemCopyWith<$Res> {
  factory _$$_MedicationItemCopyWith(
          _$_MedicationItem value, $Res Function(_$_MedicationItem) then) =
      __$$_MedicationItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int dosageFrequency,
      int dosage,
      DateTime dosingAt,
      bool isOverflow,
      bool isCompleted});
}

/// @nodoc
class __$$_MedicationItemCopyWithImpl<$Res>
    extends _$MedicationItemCopyWithImpl<$Res, _$_MedicationItem>
    implements _$$_MedicationItemCopyWith<$Res> {
  __$$_MedicationItemCopyWithImpl(
      _$_MedicationItem _value, $Res Function(_$_MedicationItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dosageFrequency = null,
    Object? dosage = null,
    Object? dosingAt = null,
    Object? isOverflow = null,
    Object? isCompleted = null,
  }) {
    return _then(_$_MedicationItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dosageFrequency: null == dosageFrequency
          ? _value.dosageFrequency
          : dosageFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as int,
      dosingAt: null == dosingAt
          ? _value.dosingAt
          : dosingAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isOverflow: null == isOverflow
          ? _value.isOverflow
          : isOverflow // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MedicationItem extends _MedicationItem {
  const _$_MedicationItem(
      {required this.id,
      required this.name,
      required this.dosageFrequency,
      required this.dosage,
      required this.dosingAt,
      this.isOverflow = false,
      this.isCompleted = false})
      : super._();

  @override
  final int id;

  ///　薬の名前
  @override
  final String name;

  /// 服用回数
  @override
  final int dosageFrequency;

  /// 用量（ex.２錠）
  @override
  final int dosage;

  /// 服用期間
  @override
  final DateTime dosingAt;

  /// 服用回数overフラグ
  @override
  @JsonKey()
  final bool isOverflow;

  ///　期間終了フラグ
  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'MedicationItem(id: $id, name: $name, dosageFrequency: $dosageFrequency, dosage: $dosage, dosingAt: $dosingAt, isOverflow: $isOverflow, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicationItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dosageFrequency, dosageFrequency) ||
                other.dosageFrequency == dosageFrequency) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.dosingAt, dosingAt) ||
                other.dosingAt == dosingAt) &&
            (identical(other.isOverflow, isOverflow) ||
                other.isOverflow == isOverflow) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, dosageFrequency,
      dosage, dosingAt, isOverflow, isCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicationItemCopyWith<_$_MedicationItem> get copyWith =>
      __$$_MedicationItemCopyWithImpl<_$_MedicationItem>(this, _$identity);
}

abstract class _MedicationItem extends MedicationItem {
  const factory _MedicationItem(
      {required final int id,
      required final String name,
      required final int dosageFrequency,
      required final int dosage,
      required final DateTime dosingAt,
      final bool isOverflow,
      final bool isCompleted}) = _$_MedicationItem;
  const _MedicationItem._() : super._();

  @override
  int get id;
  @override

  ///　薬の名前
  String get name;
  @override

  /// 服用回数
  int get dosageFrequency;
  @override

  /// 用量（ex.２錠）
  int get dosage;
  @override

  /// 服用期間
  DateTime get dosingAt;
  @override

  /// 服用回数overフラグ
  bool get isOverflow;
  @override

  ///　期間終了フラグ
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$_MedicationItemCopyWith<_$_MedicationItem> get copyWith =>
      throw _privateConstructorUsedError;
}
