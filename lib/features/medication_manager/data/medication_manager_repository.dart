import 'package:isar/isar.dart';
import 'package:medication_manager/features/medication_manager/data/dto/medication_item_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/logger.dart';
import '../domain/entity/medication_item.dart';

part 'medication_manager_repository.g.dart';

@riverpod
Isar medicationIsar(MedicationIsarRef ref) => throw UnimplementedError();

@riverpod
MedicationManagerRepository medicationManagerRepository(
  MedicationManagerRepositoryRef ref,
) =>
    MedicationManagerRepositoryImpl(isar: ref.watch(medicationIsarProvider));

interface class MedicationManagerRepository {
  Future<List<MedicationItem>> fetchMedication() => throw UnimplementedError();
  Future<List<MedicationItem>> fetchCompletedMedication() =>
      throw UnimplementedError();
  Future<MedicationItem> add(MedicationItemDto dto) =>
      throw UnimplementedError();
  Future<void> edit(MedicationItem item) => throw UnimplementedError();
  Future<void> delete(int id) => throw UnimplementedError();
}

class MedicationManagerRepositoryImpl implements MedicationManagerRepository {
  MedicationManagerRepositoryImpl({required this.isar});

  final Isar isar;

  @override
  Future<List<MedicationItem>> fetchMedication() async {
    final medicationItemDtoCollection = isar.medicationItemDtos;
    final medicationItemDtos = await medicationItemDtoCollection
        .where()
        // .dosingEndAtGreaterThan(
        //   DateTime.now().add(
        //     const Duration(days: -1),
        //   ),
        // )
        .filter()
        .isCompletedEqualTo(false)
        .findAll();
    return medicationItemDtos.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<List<MedicationItem>> fetchCompletedMedication() async {
    final medicationItemDtoCollection = isar.medicationItemDtos;
    final medicationItemDtos = await medicationItemDtoCollection
        // .where()
        // .dosingEndAtLessThan(DateTime.now())
        .filter()
        .isCompletedEqualTo(false)
        .findAll();
    return medicationItemDtos.map((dto) => dto.toDomain()).toList();
  }

  @override
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

  @override
  Future<void> edit(MedicationItem item) async {
    final medicationItemDtoCollection = isar.medicationItemDtos;

    await isar.writeTxn(
      () => medicationItemDtoCollection.put(MedicationItemDto.fromDomain(item)),
    );

    return;
  }

  @override
  Future<void> delete(int id) async {
    final medicationItemDtoCollection = isar.medicationItemDtos;
    await isar.writeTxn(
      () => medicationItemDtoCollection.delete(id),
    );
  }
}
