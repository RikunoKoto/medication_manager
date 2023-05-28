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

    /// 今日の服用数
    @Default(0) int todayDosage,

    /// 服用開始
    required DateTime dosingStartAt,

    /// 服用終了
    required DateTime dosingEndAt,

    ///　期間終了フラグ
    @Default(false) bool isCompleted,
  }) = _MedicationItem;
  const MedicationItem._();

  MedicationItem update({
    required String name,
    required int dosageFrequency,
    required int dosage,
    required int todayDosage,
    required DateTime dosingStartAt,
    required DateTime dosingEndAt,
  }) =>
      copyWith(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        todayDosage: todayDosage,
        dosingStartAt: dosingStartAt,
        dosingEndAt: dosingEndAt,
      );

  MedicationItem toCompleted({required bool toCompleted}) =>
      copyWith(isCompleted: toCompleted);

  MedicationItem takeTodayDosage({required int takeTodayDosage}) =>
      copyWith(todayDosage: takeTodayDosage);

  bool get isEmptyName => name.isEmpty;

  bool get isTakeDosage => todayDosage == dosageFrequency;

  String get stringDosingStartAt =>
      DateFormat('yyyy-MM-dd').format(dosingEndAt).substring(0, 10);

  String get stringDosingEndAt =>
      DateFormat('yyyy-MM-dd').format(dosingStartAt).substring(0, 10);
}
