import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medication_manager/features/medication_manager/presentation/widgets/medication_info_form.dart';

import '../../../../utils/logger.dart';
import '../../domain/entity/medication_item.dart';

final dosingPeriodStateProvider =
    StateProvider.autoDispose.family<String, DateTime>(
  (ref, DateTime date) => DateFormat('yyyy-MM-dd HH:mm:ss').format(date),
);

final jpbirthdayStateProvider =
    StateProvider.autoDispose.family<String, DateTime>((ref, DateTime time) {
  final birthday = ref.watch(dosingPeriodStateProvider(time));
  final formatBirthday =
      DateFormat('yyyy-MM-dd HH:mm:ss').parseStrict(birthday);
  final toStringBirthday = DateFormat('yyyy年MM月dd日').format(formatBirthday);
  return toStringBirthday;
});

final fixedTimeProvider = StateProvider.autoDispose<String>((ref) => '');

class CupertionDatePickerDialog extends ConsumerWidget {
  const CupertionDatePickerDialog({required this.item, super.key});

  final MedicationItem? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dosingPeriod = item == null
        ? DateFormat('yyyy-MM-dd').format(DateTime.now())
        : item!.dosingPeriod;
    final initialTime = DateFormat('yyyy-MM-dd')
        .parseStrict(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    final title = ref.watch(jpbirthdayStateProvider(initialTime));
    final selectTime = ref.watch(fixedTimeProvider.notifier);
    final period = ref.watch(periodProvider(item).notifier);

    return AlertDialog(
      title: Text(title, style: const TextStyle(color: Colors.blue)),
      backgroundColor: Colors.white,
      scrollable: true,
      content: Column(
        children: [
          SizedBox(
            height: 250,
            width: 250,
            child: CupertinoDatePicker(
              initialDateTime: initialTime,
              use24hFormat: true,
              maximumDate: DateTime(2030, 12, 30),
              minimumYear: DateTime.now().year - 1,
              maximumYear: 2030,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                logger.fine(value);
                final time = DateFormat('yyyy-MM-dd HH:mm:ss')
                    .format(value)
                    .substring(0, 10);
                selectTime.update((state) => time);
                logger.warning(ref.read(fixedTimeProvider));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  //period.update((state) => '');
                  Navigator.pop(context);
                },
                child: const Text(
                  'キャンセル',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const VerticalDivider(
                color: Colors.red,
                thickness: 2,
              ),
              TextButton(
                onPressed: () {
                  period.update((state) => selectTime.state);
                  logger.fine(selectTime.state);
                  Navigator.pop(context);
                },
                child: const Text(
                  '確認',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
