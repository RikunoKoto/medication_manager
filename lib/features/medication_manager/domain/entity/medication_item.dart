import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'medication_item.freezed.dart';

@freezed
class MedicationItem with _$MedicationItem {
  const factory MedicationItem({
    required int id,

    ///　薬の名前
    required String name,

    /// 服用回数
    required int dosageFrequency,

    /// 用量（ex.２錠）
    required int dosage,

    /// 服用期間
    required DateTime dosingAt,

    /// 服用回数overフラグ
    @Default(false) bool isOverflow,

    ///　期間終了フラグ
    @Default(false) bool isCompleted,
  }) = _MedicationItem;
  const MedicationItem._();

  MedicationItem update({
    required String name,
    required int dosageFrequency,
    required int dosage,
    required DateTime dosingAt,
  }) =>
      copyWith(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        dosingAt: dosingAt,
      );

  MedicationItem toOverflow({required bool toOverflow}) =>
      copyWith(isOverflow: toOverflow);

  MedicationItem toCompleted({required bool toCompleted}) =>
      copyWith(isCompleted: toCompleted);

  bool get isEmptyName => name.isEmpty;

  String get stringDosingAt =>
      DateFormat('yyyy-MM-dd').format(dosingAt).substring(0, 10);
}
