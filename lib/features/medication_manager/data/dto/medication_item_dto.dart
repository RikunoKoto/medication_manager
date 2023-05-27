import 'package:isar/isar.dart';

import '../../domain/entity/medication_item.dart';

part 'medication_item_dto.g.dart';

@collection
class MedicationItemDto {
  MedicationItemDto({
    this.id,
    required this.name,
    required this.dosageFrequency,
    required this.dosage,
    required this.todayDosage,
    required this.dosingStartAt,
    required this.dosingEndAt,
    this.isCompleted = false,
  });

  factory MedicationItemDto.fromDomain(MedicationItem item) =>
      MedicationItemDto(
        id: item.id,
        name: item.name,
        dosageFrequency: item.dosageFrequency,
        dosage: item.dosage,
        todayDosage: item.todayDosage,
        dosingStartAt: item.dosingStartAt,
        dosingEndAt: item.dosingEndAt,
        isCompleted: item.isCompleted,
      );

  Id? id;

  final String name;

  final int dosageFrequency;

  final int dosage;

  final int todayDosage;

  final DateTime dosingStartAt;

  @Index()
  final DateTime dosingEndAt;

  //　完了状態で検索する為
  @Index()
  final bool isCompleted;

  MedicationItem toDomain() => MedicationItem(
        id: id!,
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        todayDosage: todayDosage,
        dosingStartAt: dosingStartAt,
        dosingEndAt: dosingEndAt,
        isCompleted: isCompleted,
      );
}
