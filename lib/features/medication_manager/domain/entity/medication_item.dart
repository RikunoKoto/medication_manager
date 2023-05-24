import 'package:freezed_annotation/freezed_annotation.dart';

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
    required DateTime dosingPeriod,

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
    required DateTime dosingPeriod,
  }) =>
      copyWith(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        dosingPeriod: dosingPeriod,
      );

  bool get isEmptyName => name.isEmpty;
}
