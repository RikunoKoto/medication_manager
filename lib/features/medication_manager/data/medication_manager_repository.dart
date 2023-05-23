import 'package:isar/isar.dart';
import 'package:medication_manager/features/medication_manager/data/dto/medication_item_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/medication_item.dart';

part 'medication_manager_repository.g.dart';

@riverpod
Isar medicationIsar(MedicationIsarRef ref) => throw UnimplementedError();

@riverpod
MedicationManagerRepository medicationManagerRepository(
  MedicationManagerRepositoryRef ref,
) =>
    MedicationManagerRepository(isar: ref.watch(medicationIsarProvider));

class MedicationManagerRepository {
  MedicationManagerRepository({required this.isar});

  final Isar isar;

  Future<List<MedicationItem>> fetchMedication() async {
    final medicationItemDtoCollection = isar.medicationItemDtos;
    final medicationItemDtos = await medicationItemDtoCollection
        .filter()
        .isCompletedEqualTo(false)
        .findAll();
    return medicationItemDtos.map((dto) => dto.toDomain()).toList();
  }

  Future<List<MedicationItem>> fetchCompletedMedication() async {
    final medicationItemDtoCollection = isar.medicationItemDtos;
    final medicationItemDtos = await medicationItemDtoCollection
        .filter()
        .isCompletedEqualTo(true)
        .findAll();
    return medicationItemDtos.map((dto) => dto.toDomain()).toList();
  }

  Future<MedicationItem> add(MedicationItemDto dto) async {
    final medicationItemDtoCollection = isar.medicationItemDtos;

    final medicationItem = await isar.writeTxn(() async {
      final id = await medicationItemDtoCollection.put(dto);
      final medicationItem =
          (await medicationItemDtoCollection.get(id))!.toDomain();

      return medicationItem;
    });

    return medicationItem;
  }

  Future<void> edit(MedicationItemDto dto) async {
    final medicationItemDtoCollection = isar.medicationItemDtos;

    final medicationItem = await isar.writeTxn(() async {
      final id = await medicationItemDtoCollection.put(dto);
      final medicationItem =
          (await medicationItemDtoCollection.get(id))!.toDomain();

      return medicationItem;
    });
  }
}
