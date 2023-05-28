import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medication_manager/common_widgets/common_divider.dart';
import 'package:medication_manager/features/medication_manager/presentation/create/widgets/custom_count_button.dart';

import '../../../../../common_widgets/common_setting_menu_tile.dart';
import '../../../../../utils/logger.dart';
import '../../../domain/entity/medication_item.dart';
import '../create_page.dart';

class MedicationInfoForm extends ConsumerWidget {
  const MedicationInfoForm({required this.item, super.key});

  final MedicationItem? item;

  Future<void> dateRangePciker({
    required BuildContext context,
    required String dosingAt,
    required StateController<String> fixedStartNotifier,
    required StateController<String> fixedEndNotifier,
  }) async {
    /// HACK: datetimeを＋９時間する突貫工事
    final dosingAtFormat = dosingAt.isEmpty
        ? DateFormat('yyyy-MM-dd').format(
            DateTime.now().toUtc().add(const Duration(hours: 9)),
          )
        : dosingAt;
    logger.fine(dosingAtFormat);
    final initialTime = DateFormat('yyyy-MM-dd', 'ja_JP').parse(dosingAtFormat);
    final initialDateRange = DateTimeRange(
      start: initialTime,
      end: initialTime.add(const Duration(hours: 24 * 3)),
    );

    final dateRange = await showDateRangePicker(
      context: context,
      currentDate: DateTime.now().toUtc().add(const Duration(hours: 9)),
      initialDateRange: initialDateRange,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 30),
    );

    if (dateRange != null) {
      fixedStartNotifier
          .update((state) => DateFormat('yyyy-MM-dd').format(dateRange.start));
      fixedEndNotifier
          .update((state) => DateFormat('yyyy-MM-dd').format(dateRange.end));
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dosingStartAt = ref.watch(dosingStartAtFamilyProvider(item));
    final fixedStartTime = ref.watch(fixedStartTimeProvider(item));
    final fixedStartNotifier = ref.watch(fixedStartTimeProvider(item).notifier);
    final fixedEndTime = ref.watch(fixedEndTimeProvider(item));
    final fixedEndNotifier = ref.watch(fixedEndTimeProvider(item).notifier);
    final dosageFrequencyCount =
        ref.watch(dosageFrequencyCountFamilyProvider(item));
    final dosageFrequencyCountNotifier =
        ref.watch(dosageFrequencyCountFamilyProvider(item).notifier);
    final dosageCount = ref.watch(dosageCountFamilyProvider(item));
    final dosageCountNotifier =
        ref.watch(dosageCountFamilyProvider(item).notifier);
    final todayDosageCount = ref.watch(todayDosageCountFamilyProvider(item));
    final todayDosageCountNotifier =
        ref.watch(todayDosageCountFamilyProvider(item).notifier);
    final colors = Theme.of(context).colorScheme;
    return LimitedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              CommonSettingMenuTile(
                title: CustomCountButton(
                  count: dosageFrequencyCount > 0
                      ? '$dosageFrequencyCount回'
                      : '設定なし',
                  onIncrementTap: () =>
                      dosageFrequencyCountNotifier.update((state) {
                    if (state < 10) {
                      state++;
                    }
                    return state;
                  }),
                  onDecrementTap: () =>
                      dosageFrequencyCountNotifier.update((state) {
                    if (state < todayDosageCount) {
                      return todayDosageCount;
                    }
                    if (state > 0) {
                      state--;
                    }
                    return state;
                  }),
                ),
                leading: Text(
                  '服用回数',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isTrailing: false,
              ),
              const CommonDivider(leftIndent: 15, rightIndent: 15),
              CommonSettingMenuTile(
                title: CustomCountButton(
                  count: dosageCount > 0 ? '$dosageCount錠' : '設定なし',
                  onIncrementTap: () => dosageCountNotifier.update((state) {
                    if (state < 10) {
                      state++;
                    }
                    return state;
                  }),
                  onDecrementTap: () => dosageCountNotifier.update((state) {
                    if (state > 0) {
                      state--;
                    }
                    return state;
                  }),
                ),
                leading: Text(
                  '服用量(錠)',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isTrailing: false,
              ),
              const CommonDivider(leftIndent: 15, rightIndent: 15),
              CommonSettingMenuTile(
                title: CustomCountButton(
                  count: '$todayDosageCount/$dosageFrequencyCount (回)',
                  onIncrementTap: () =>
                      todayDosageCountNotifier.update((state) {
                    if (dosageFrequencyCount == 0) {
                      return 0;
                    }
                    if (state < dosageFrequencyCount) {
                      state++;
                    }
                    return state;
                  }),
                  onDecrementTap: () =>
                      todayDosageCountNotifier.update((state) {
                    if (state > 0) {
                      state--;
                    }
                    return state;
                  }),
                ),
                leading: Text(
                  '今日の服用回数',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isTrailing: false,
              ),
              const CommonDivider(leftIndent: 15, rightIndent: 15),
              CommonSettingMenuTile(
                title: Text(
                  '$fixedStartTime ～',
                  style: TextStyle(color: colors.onSurface.withOpacity(.5)),
                ),
                leading: Text(
                  '服用期間',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () async {
                  if (dosingStartAt.isNotEmpty) {
                    fixedEndNotifier.update((state) => dosingStartAt);
                  }

                  await dateRangePciker(
                    context: context,
                    dosingAt: dosingStartAt,
                    fixedStartNotifier: fixedStartNotifier,
                    fixedEndNotifier: fixedEndNotifier,
                  );
                },
              ),
              const CommonDivider(leftIndent: 15, rightIndent: 15),
              CommonSettingMenuTile(
                title: Text(
                  '$fixedEndTime 迄',
                  style: TextStyle(color: colors.onSurface.withOpacity(.5)),
                ),
                leading: Text(
                  '服用期間',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isTrailing: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
