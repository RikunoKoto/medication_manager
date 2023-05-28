import 'package:isar/isar.dart';
import 'package:medication_manager/features/medication_manager/data/medication_manager_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<List<MedicationItem>> call({
    required SharedPreferences prefs,
    required Isar isar,
  }) async {
    try {
      final medicationItemList = await repository.fetchMedication();
      // 前回の起動日付を取得
      final lastOpenedDate = prefs.getString('lastOpenedDate') ?? '';
      logger
        ..fine(
          '-------message--------',
        )
        ..finest(lastOpenedDate);

      // 現在の日付を取得
      final currentDate = DateTime.now();
      final currentDateString = currentDate.toString().split(' ')[0];
      // 現在の起動日付を保存
      await prefs.setString('lastOpenedDate', currentDateString);

      // 日付が変わった場合の処理を実行
      if (currentDateString != lastOpenedDate) {
        final newMedicationItemList = medicationItemList
            .map(
              (medicationItem) =>
                  medicationItem.takeTodayDosage(takeTodayDosage: 0),
            )
            .toList();
        return newMedicationItemList;
      }

      return medicationItemList;
    } catch (e) {
      logger.warning('DeleteTodosUsecaseでのエラー');
      throw Exception('メモをローカルから削除できませんでした。');
    }
  }
}
