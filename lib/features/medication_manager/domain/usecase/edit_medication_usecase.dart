import 'package:medication_manager/features/medication_manager/data/medication_manager_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/logger.dart';
import '../entity/medication_item.dart';

part 'edit_medication_usecase.g.dart';

@riverpod
EditMedicationUsecase editMedicationUsecase(
  EditMedicationUsecaseRef ref,
) =>
    EditMedicationUsecase(ref.watch(medicationManagerRepositoryProvider));

class EditMedicationUsecase {
  EditMedicationUsecase(this.repository);

  final MedicationManagerRepository repository;

  Future<MedicationItem> call({
    required String name,
    required int dosageFrequency,
    required int dosage,
    required DateTime dosingPeriod,
    required MedicationItem item,
  }) async {
    try {
      final updatedMedicationItem = item.update(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        dosingPeriod: dosingPeriod,
      );
      await repository.edit(updatedMedicationItem);

      return updatedMedicationItem;
    } catch (e) {
      logger.warning('DeleteTodosUsecaseでのエラー');
      throw Exception('メモをローカルから削除できませんでした。');
    }
  }
}
