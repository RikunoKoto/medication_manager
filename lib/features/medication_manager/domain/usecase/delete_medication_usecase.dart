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
      await repository.delete(id);

      return;
    } catch (e) {
      logger.warning('DeleteTodosUsecaseでのエラー');
      throw Exception('メモをローカルから削除できませんでした。');
    }
  }
}
