import 'package:medication_manager/features/medication_manager/domain/usecase/fetch_completed_medication_usecase.dart';
import 'package:medication_manager/features/medication_manager/presentation/medication_list_async_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/logger.dart';
import '../../domain/entity/medication_list.dart';
import '../../domain/usecase/delete_medication_usecase.dart';

part 'history_async_notifier.g.dart';

@riverpod
class HistoryAsyncNotifier extends _$HistoryAsyncNotifier {
  @override
  FutureOr<MedicationList> build() async {
    final medicationList = MedicationList(items: []);
    final medicationItemList =
        await ref.read(fetchCompletedMedicationUsecaseProvider)();
    final result = medicationList.fetch(medicationItemList);
    //ref.invalidate(medicationListAsyncNotifierProvider);
    logger.finest(result);
    return result;
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
