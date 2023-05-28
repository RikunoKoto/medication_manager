import 'package:medication_manager/features/medication_manager/data/medication_manager_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/logger.dart';
import '../../data/dto/medication_item_dto.dart';
import '../entity/medication_item.dart';

part 'add_medication_usecase.g.dart';

@riverpod
AddMedicationUsecase addMedicationUsecase(
  AddMedicationUsecaseRef ref,
) =>
    AddMedicationUsecase(ref.watch(medicationManagerRepositoryProvider));

class AddMedicationUsecase {
  AddMedicationUsecase(this.repository);

  final MedicationManagerRepository repository;

  Future<MedicationItem> call({
    required String name,
    required int dosageFrequency,
    required int dosage,
    required int todayDosage,
    required DateTime dosingStartAt,
    required DateTime dosingEndAt,
  }) async {
    try {
      final medicationItemDto = MedicationItemDto(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        todayDosage: todayDosage,
        dosingStartAt: dosingStartAt,
        dosingEndAt: dosingEndAt,
      );
      final medicationItem = await repository.add(medicationItemDto);
      return medicationItem;
    } on Exception catch (e) {
      logger.warning(
        'AddTakeTodayDosageUsecase error $e',
      );
      throw Exception('値を追加できませんでした。');
    }
  }
}
