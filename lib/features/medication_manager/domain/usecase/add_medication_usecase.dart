import 'package:medication_manager/features/medication_manager/data/medication_manager_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/logger.dart';
import '../../data/dto/medication_item_dto.dart';
import '../entity/medication_item.dart';

part 'add_medication_usecase.g.dart';

@riverpod
AddMedicationUsecase addMedicationUsecase(
  AddMedicationUsecaseRef ref,
) =>
    AddMedicationUsecase(ref.watch(medicationManagerRepositoryProvider));

class AddMedicationUsecase {
  AddMedicationUsecase(this.repository);

  final MedicationManagerRepository repository;

  Future<MedicationItem> call({
    required String name,
    required int dosageFrequency,
    required int dosage,
    required DateTime dosingAt,
  }) async {
    try {
      final medicationItemDto = MedicationItemDto(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        dosingAt: dosingAt,
      );
      final medicationItem = await repository.add(medicationItemDto);
      return medicationItem;
    } catch (e) {
      logger.warning('DeleteTodosUsecaseでのエラー');
      throw Exception('メモをローカルから削除できませんでした。');
    }
  }
}
