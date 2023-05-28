import 'package:medication_manager/features/medication_manager/data/medication_manager_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/logger.dart';

part 'delete_medication_usecase.g.dart';

@riverpod
DeleteMedicationUsecase deleteMedicationUsecase(
  DeleteMedicationUsecaseRef ref,
) =>
    DeleteMedicationUsecase(ref.watch(medicationManagerRepositoryProvider));

class DeleteMedicationUsecase {
  DeleteMedicationUsecase(this.repository);

  final MedicationManagerRepository repository;

  Future<void> call({required int id}) async {
    try {
      logger.fine(id);
      await repository.delete(id);

      return;
    } on Exception catch (e) {
      logger.warning(
        'AddTakeTodayDosageUsecase error $e',
      );
      throw Exception('値を削除できませんでした。');
    }
  }
}
