import 'package:medication_manager/features/medication_manager/data/medication_manager_repository.dart';
import 'package:medication_manager/features/medication_manager/domain/usecase/add_take_today_dosage_usecase.dart';
import 'package:medication_manager/utils/shared_preference_key.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/logger.dart';
import '../domain/entity/medication_item.dart';
import '../domain/entity/medication_list.dart';
import '../domain/usecase/add_medication_usecase.dart';
import '../domain/usecase/delete_medication_usecase.dart';
import '../domain/usecase/edit_medication_usecase.dart';
import '../domain/usecase/fetch_medication_usecase.dart';

part 'medication_list_async_notifier.g.dart';

@riverpod
class MedicationListAsyncNotifier extends _$MedicationListAsyncNotifier {
  @override
  FutureOr<MedicationList> build() async {
    final medicationList = MedicationList(items: []);
    final prefs = ref.watch(sharedPreferencesProvider);
    final isar = ref.watch(medicationIsarProvider);
    final medicationItemList = await ref.read(fetchMedicationUsecaseProvider)(
      prefs: prefs,
      isar: isar,
    );
    final result = medicationList.fetch(medicationItemList);

    return result;
  }

  Future<void> addTodoItem({
    required String name,
    required int dosageFrequency,
    required int dosage,
    required int todayDosage,
    required DateTime dosingStartAt,
    required DateTime dosingEndAt,
  }) async {
    state = await AsyncValue.guard(() async {
      final medicationItem = await ref.read(addMedicationUsecaseProvider)(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        todayDosage: todayDosage,
        dosingStartAt: dosingStartAt,
        dosingEndAt: dosingEndAt,
      );

      return state.value!.add(medicationItem);
    });
  }

  Future<void> addTodayDosage({
    required int todayDosage,
    required MedicationItem item,
  }) async {
    state = await AsyncValue.guard(() async {
      final medicationItem = await ref.read(addTakeTodayDosageUsecaseProvider)(
        todayDosage: todayDosage,
        item: item,
      );

      return state.value!.edit(medicationItem);
    });
  }

  Future<void> editMedicationItem({
    required String name,
    required int dosageFrequency,
    required int dosage,
    required int todayDosage,
    required DateTime dosingStartAt,
    required DateTime dosingEndAt,
    required MedicationItem item,
  }) async {
    state = await AsyncValue.guard(() async {
      final medicationItem = await ref.read(editMedicationUsecaseProvider)(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        todayDosage: todayDosage,
        dosingStartAt: dosingStartAt,
        dosingEndAt: dosingEndAt,
        item: item,
      );

      return state.value!.edit(medicationItem);
    });
  }

  Future<void> removeMedicationItem({
    required int id,
  }) async {
    state = await AsyncValue.guard(() async {
      await ref.read(deleteMedicationUsecaseProvider)(id: id);

      return state.value!.remove(id);
    });
  }
}
