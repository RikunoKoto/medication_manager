import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    final medicationItemList = await ref.read(fetchMedicationUsecaseProvider)();
    
    final result = medicationList.fetch(medicationItemList);
    return result;
  }

  Future<void> addTodoItem({
    required String name,
    required int dosageFrequency,
    required int dosage,
    required DateTime dosingAt,
  }) async {
    state = await AsyncValue.guard(() async {
      final medicationItem = await ref.read(addMedicationUsecaseProvider)(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        dosingAt: dosingAt,
      );

      return state.value!.add(medicationItem);
    });
  }

  Future<void> editMedicationItem({
    required String name,
    required int dosageFrequency,
    required int dosage,
    required DateTime dosingAt,
    required MedicationItem item,
  }) async {
    state = await AsyncValue.guard(() async {
      final medicationItem = await ref.read(editMedicationUsecaseProvider)(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        dosingAt: dosingAt,
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
