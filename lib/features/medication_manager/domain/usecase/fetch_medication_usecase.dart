import 'package:medication_manager/features/medication_manager/data/medication_manager_repository.dart';
import 'package:medication_manager/utils/shared_preference_key.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/logger.dart';
import '../entity/medication_item.dart';

part 'fetch_medication_usecase.g.dart';

@riverpod
FetchMedicationUsecase fetchMedicationUsecase(
  FetchMedicationUsecaseRef ref,
) =>
    FetchMedicationUsecase(
      ref.watch(medicationManagerRepositoryProvider),
      ref.watch(sharedPreferencesRepositoryProvider),
    );

class FetchMedicationUsecase {
  FetchMedicationUsecase(this.repository, this.prefsRepository);

  final MedicationManagerRepository repository;
  final SharedPreferencesRepository prefsRepository;

  Future<List<MedicationItem>> call() async {
    try {
      final medicationItemList = await repository.fetchMedication();

      final lastOpenedDate = await prefsRepository.getDateDay();

      final currentDate = DateTime.now();
      final currentDateString = currentDate.toString().split(' ')[0];

      // 日付が変わった場合の処理を実行
      if (currentDateString != lastOpenedDate) {
        await prefsRepository.setDateDay(currentDate: currentDateString);

        final newMedicationItemList = medicationItemList.map((medicationItem) {
          final editMedicationItem =
              medicationItem.takeTodayDosage(takeTodayDosage: 0);
          repository.edit(editMedicationItem);
          return editMedicationItem;
        }).toList();
        return newMedicationItemList;
      }

      return medicationItemList;
    } on Exception catch (e) {
      logger.warning(
        'FetchMedicationUsecase Error $e',
      );
      throw Exception('値を取得できませんでした。');
    }
  }
}
