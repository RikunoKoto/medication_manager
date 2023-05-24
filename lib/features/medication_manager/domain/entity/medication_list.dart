import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/medication_item.dart';

part 'medication_list.freezed.dart';

@freezed
class MedicationList with _$MedicationList {
  factory MedicationList({
    /// メモのリスト
    @Default([]) List<MedicationItem> items,
  }) = _MedicationList;
  const MedicationList._();

  MedicationList fetch(List<MedicationItem> medicationItemList) {
    return copyWith(
      items: [...items, ...medicationItemList],
    );
  }

  MedicationList add(MedicationItem item) => copyWith(items: [item, ...items]);

  MedicationList edit(MedicationItem todoItem) {
    final index = items.map((item) => item.id).toList().indexOf(todoItem.id);

    final editedItem = List.of(items)
      ..removeAt(index)
      ..insert(0, todoItem);

    return copyWith(items: editedItem);
  }

  MedicationList remove(MedicationItem todoItem) {
    final index = items.map((item) => item.id).toList().indexOf(todoItem.id);
    final removedItem = List.of(items)..removeAt(index);

    return copyWith(items: removedItem);
  }
}
