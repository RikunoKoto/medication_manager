// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MedicationList {
  /// メモのリスト
  List<MedicationItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MedicationListCopyWith<MedicationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationListCopyWith<$Res> {
  factory $MedicationListCopyWith(
          MedicationList value, $Res Function(MedicationList) then) =
      _$MedicationListCopyWithImpl<$Res, MedicationList>;
  @useResult
  $Res call({List<MedicationItem> items});
}

/// @nodoc
class _$MedicationListCopyWithImpl<$Res, $Val extends MedicationList>
    implements $MedicationListCopyWith<$Res> {
  _$MedicationListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MedicationItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MedicationListCopyWith<$Res>
    implements $MedicationListCopyWith<$Res> {
  factory _$$_MedicationListCopyWith(
          _$_MedicationList value, $Res Function(_$_MedicationList) then) =
      __$$_MedicationListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MedicationItem> items});
}

/// @nodoc
class __$$_MedicationListCopyWithImpl<$Res>
    extends _$MedicationListCopyWithImpl<$Res, _$_MedicationList>
    implements _$$_MedicationListCopyWith<$Res> {
  __$$_MedicationListCopyWithImpl(
      _$_MedicationList _value, $Res Function(_$_MedicationList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_MedicationList(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MedicationItem>,
    ));
  }
}

/// @nodoc

class _$_MedicationList extends _MedicationList {
  _$_MedicationList({final List<MedicationItem> items = const []})
      : _items = items,
        super._();

  /// メモのリスト
  final List<MedicationItem> _items;

  /// メモのリスト
  @override
  @JsonKey()
  List<MedicationItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'MedicationList(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicationList &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicationListCopyWith<_$_MedicationList> get copyWith =>
      __$$_MedicationListCopyWithImpl<_$_MedicationList>(this, _$identity);
}

abstract class _MedicationList extends MedicationList {
  factory _MedicationList({final List<MedicationItem> items}) =
      _$_MedicationList;
  _MedicationList._() : super._();

  @override

  /// メモのリスト
  List<MedicationItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_MedicationListCopyWith<_$_MedicationList> get copyWith =>
      throw _privateConstructorUsedError;
}
