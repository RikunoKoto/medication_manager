import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/logger.dart';
import '../../data/medication_manager_repository.dart';
import '../entity/medication_item.dart';

part 'change_to_completed_status_usecase.g.dart';

@riverpod
ChangeToCompletedStatusUsecase changeToCompletedStatusUsecase(
  ChangeToCompletedStatusUsecaseRef ref,
) =>
    ChangeToCompletedStatusUsecase(
      ref.watch(medicationManagerRepositoryProvider),
    );

class ChangeToCompletedStatusUsecase {
  ChangeToCompletedStatusUsecase(this.repository);

  final MedicationManagerRepository repository;

  Future<MedicationItem> call({
    required bool toCompleted,
    required MedicationItem item,
  }) async {
    try {
      final medicationItem = item.toCompleted(toCompleted: toCompleted);
      await repository.edit(medicationItem);
      return medicationItem;
    } on Exception catch (e) {
      logger.warning(
        'AddTakeTodayDosageUsecase error $e',
      );
      throw Exception('値を変更できませんでした。');
    }
  }
}
