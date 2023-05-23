import 'package:isar/isar.dart';

import '../../domain/medication_item.dart';

part 'medication_item_dto.g.dart';

/// Isar専用のDTO(Data Transfer Object)
///
/// Isarはfreezedをサポートしていないため、DTOに変換しています。
///
/// DTOはドメインへ変換も含めたデータ受け渡し専用のクラスと定義しています。
@collection
class MedicationItemDto {
  MedicationItemDto({
    this.id,
    required this.name,
    required this.dosageFrequency,
    required this.dosage,
    required this.dosingPeriod,
    this.isCompleted = false,
  });

  factory MedicationItemDto.fromDomain(MedicationItem item) =>
      MedicationItemDto(
        id: item.id,
        name: item.name,
        dosageFrequency: item.dosageFrequency,
        dosage: item.dosage,
        dosingPeriod: item.dosingPeriod,
        isCompleted: item.isCompleted,
      );

  Id? id;

  final String name;

  final int dosageFrequency;

  final int dosage;

  final DateTime dosingPeriod;

  final bool isCompleted;

  MedicationItem toDomain() => MedicationItem(
        id: id!,
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        dosingPeriod: dosingPeriod,
        isCompleted: isCompleted,
      );
}
