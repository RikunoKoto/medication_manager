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
    required this.dosingAt,
    this.isOverflow = false,
    this.isCompleted = false,
  });

  factory MedicationItemDto.fromDomain(MedicationItem item) =>
      MedicationItemDto(
        id: item.id,
        name: item.name,
        dosageFrequency: item.dosageFrequency,
        dosage: item.dosage,
        dosingAt: item.dosingAt,
        isOverflow: item.isOverflow,
        isCompleted: item.isCompleted,
      );

  Id? id;

  final String name;

  final int dosageFrequency;

  final int dosage;

  @Index()
  final DateTime dosingAt;

  final bool isOverflow;

  //　完了状態で検索する為
  @Index()
  final bool isCompleted;

  MedicationItem toDomain() => MedicationItem(
        id: id!,
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        dosingAt: dosingAt,
        isOverflow: isOverflow,
        isCompleted: isCompleted,
      );
}
