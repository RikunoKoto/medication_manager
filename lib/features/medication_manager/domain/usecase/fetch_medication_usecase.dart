import 'package:medication_manager/features/medication_manager/data/medication_manager_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/logger.dart';
import '../entity/medication_item.dart';

part 'fetch_medication_usecase.g.dart';

@riverpod
FetchMedicationUsecase fetchMedicationUsecase(
  FetchMedicationUsecaseRef ref,
) =>
    FetchMedicationUsecase(ref.watch(medicationManagerRepositoryProvider));

class FetchMedicationUsecase {
  FetchMedicationUsecase(this.repository);

  final MedicationManagerRepository repository;

  Future<List<MedicationItem>> call() async {
    try {
      final medicationItems = await repository.fetchMedication();
      
      return medicationItems;
    } catch (e) {
      logger.warning('DeleteTodosUsecaseでのエラー');
      throw Exception('メモをローカルから削除できませんでした。');
    }
  }
}
