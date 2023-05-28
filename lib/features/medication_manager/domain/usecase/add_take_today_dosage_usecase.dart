import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/logger.dart';
import '../../data/medication_manager_repository.dart';
import '../entity/medication_item.dart';

part 'add_take_today_dosage_usecase.g.dart';

@riverpod
AddTakeTodayDosageUsecase addTakeTodayDosageUsecase(
  AddTakeTodayDosageUsecaseRef ref,
) =>
    AddTakeTodayDosageUsecase(
      ref.watch(medicationManagerRepositoryProvider),
    );

class AddTakeTodayDosageUsecase {
  AddTakeTodayDosageUsecase(this.repository);

  final MedicationManagerRepository repository;

  Future<MedicationItem> call({
    required int todayDosage,
    required MedicationItem item,
  }) async {
    try {
      logger.fine(todayDosage);
      final medicationItem = item.takeTodayDosage(takeTodayDosage: todayDosage);
      await repository.edit(medicationItem);
      return medicationItem;
    } catch (e) {
      logger.warning('DeleteTodosUsecaseでのエラー');
      throw Exception('メモをローカルから削除できませんでした。');
    }
  }
}
