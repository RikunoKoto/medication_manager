import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/logger.dart';
import '../../../domain/entity/medication_item.dart';

//yyyy年MM月dd日に変換した値を保持するprovider
final jpDateFamilyProvider =
    StateProvider.autoDispose.family<String, DateTime>((ref, DateTime time) {
  final dateFormat = DateFormat('yyyy-MM-dd').format(time);
  final parseDate = DateFormat('yyyy-MM-dd').parseStrict(dateFormat);
  final jpDate = DateFormat('yyyy年MM月dd日').format(parseDate);
  return jpDate;
});

//　選択された時間を保持するprovider
final changeTimeProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final class CupertionDatePickerDialog extends ConsumerWidget {
  const CupertionDatePickerDialog({
    required this.dosingAt,
    required this.fixedNotifier,
    super.key,
  });

  final String dosingAt;
  final StateController<String> fixedNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final periodFormat = dosingAt.isEmpty
        ? DateFormat('yyyy-MM-dd').format(DateTime.now())
        : dosingAt;
    final initialTime = DateFormat('yyyy-MM-dd').parse(periodFormat);
    final title = ref.watch(jpDateFamilyProvider(initialTime));
    final selectTime = ref.watch(changeTimeProvider.notifier);
    final colors = Theme.of(context).colorScheme;
    return AlertDialog(
      title: Text(
        title,
        style:
            TextStyle(color: colors.onBackground, fontWeight: FontWeight.bold),
      ),
      backgroundColor: colors.background,
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
              minimumYear: DateTime.now().year,
              maximumYear: 2030,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                logger.fine(value);
                final time = DateFormat('yyyy-MM-dd').format(value);
                selectTime.update((state) => time);
                logger.warning(selectTime);
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
                child: Text(
                  'キャンセル',
                  style: TextStyle(color: colors.onBackground.withOpacity(.5)),
                ),
              ),
              const VerticalDivider(
                color: Colors.red,
                thickness: 2,
              ),
              TextButton(
                onPressed: () {
                  selectTime.state.isEmpty
                      ? fixedNotifier.update((state) => periodFormat)
                      : fixedNotifier.update((state) => selectTime.state);
                  logger.fine(selectTime.state);
                  Navigator.pop(context);
                },
                child: Text(
                  '確認',
                  style: TextStyle(color: colors.onBackground),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
