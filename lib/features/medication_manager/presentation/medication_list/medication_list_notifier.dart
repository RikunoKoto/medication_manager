import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entity/medication_item.dart';
import '../../domain/entity/medication_list.dart';
import '../../domain/usecase/add_medication_usecase.dart';
import '../../domain/usecase/delete_medication_usecase.dart';
import '../../domain/usecase/edit_medication_usecase.dart';
import '../../domain/usecase/fetch_medication_usecase.dart';

part 'medication_list_notifier.g.dart';

@riverpod
class MedicationListNotifier extends _$MedicationListNotifier {
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
    required DateTime dosingPeriod,
  }) async {
    state = await AsyncValue.guard(() async {
      final todoItem = await ref.read(addMedicationUsecaseProvider)(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        dosingPeriod: dosingPeriod,
      );

      return state.value!.add(todoItem);
    });
  }

  Future<void> editMedicationItem({
    required String name,
    required int dosageFrequency,
    required int dosage,
    required DateTime dosingPeriod,
    required MedicationItem item,
  }) async {
    state = await AsyncValue.guard(() async {
      final todoItem = await ref.read(editMedicationUsecaseProvider)(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        dosingPeriod: dosingPeriod,
        item: item,
      );

      return state.value!.edit(todoItem);
    });
  }

  Future<void> removeMedicationItem({
    required int id,
  }) async {
    state = await AsyncValue.guard(() async {
      await ref.read(deleteMedicationUsecaseProvider)(id: id);

      return state.value!.edit(todoItem);
    });
  }
}
