import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_manager/common_widgets/common_divider.dart';
import 'package:medication_manager/features/medication_manager/presentation/create/widgets/custom_count_button.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entity/medication_item.dart';
import 'cupertion_data_picker_dialog.dart';

part 'medication_info_form.g.dart';

// 期間を保持しているか確認して返すprovider
@riverpod
String periodFamily(PeriodFamilyRef ref, MedicationItem? item) {
  if (item == null) {
    return '';
  }
  final periodTime = item.stringDosingAt;
  return periodTime;
}

// 服用回数を保持するprovider
final dosageFrequencyCountFamilyProvider =
    StateProvider.autoDispose.family<int, MedicationItem?>((ref, item) {
  if (item == null) {
    return 0;
  }
  final dosageFrequency = item.dosageFrequency;
  return dosageFrequency;
});

typedef CountParams = ({int dosageFrequency, int dosage});

// 服用量を保持するprovider
final dosageCountFamilyProvider =
    StateProvider.autoDispose.family<int, MedicationItem?>((ref, item) {
  if (item == null) {
    return 0;
  }
  final dosage = item.dosage;
  return dosage;
});

// 確認ボタンが押下された後の時間を保持するprovider
final fixedTimeProvider =
    StateProvider.autoDispose.family<String, MedicationItem?>(
  (ref, item) {
    if (item == null) {
      return '';
    }
    final dosingAt = item.stringDosingAt;
    return dosingAt;
  },
);

class MedicationInfoForm extends ConsumerWidget {
  const MedicationInfoForm({required this.item, super.key});

  final MedicationItem? item;

  void dataPicker(
    BuildContext context,
    String dosingAt,
    StateController<String> fixedNotifier,
  ) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return CupertionDatePickerDialog(
          dosingAt: dosingAt,
          fixedNotifier: fixedNotifier,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dosingAt = ref.watch(periodFamilyProvider(item));
    final fixedTime = ref.watch(fixedTimeProvider(item));
    final dosageFrequencyCount =
        ref.watch(dosageFrequencyCountFamilyProvider(item));
    final dosageFrequencyCountNotifier =
        ref.watch(dosageFrequencyCountFamilyProvider(item).notifier);
    final dosageCount = ref.watch(dosageCountFamilyProvider(item));
    final dosageCountNotifier =
        ref.watch(dosageCountFamilyProvider(item).notifier);
    final fixedNotifier = ref.watch(fixedTimeProvider(item).notifier);
    final colors = Theme.of(context).colorScheme;
    return LimitedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              MenuTile(
                title: CustomCountButton(
                  count: dosageFrequencyCount > 0
                      ? '$dosageFrequencyCount回'
                      : '設定なし',
                  countNotifier: dosageFrequencyCountNotifier,
                ),
                leading: Text(
                  '服用回数',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {},
                isTrailing: false,
              ),
              const CommonDivider(leftIndent: 15, rightIndent: 15),
              MenuTile(
                title: CustomCountButton(
                  count: dosageCount > 0 ? '$dosageCount錠' : '設定なし',
                  countNotifier: dosageCountNotifier,
                ),
                leading: Text(
                  '服用量(錠)',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {},
                isTrailing: false,
              ),
              const CommonDivider(leftIndent: 15, rightIndent: 15),
              MenuTile(
                title: Text(
                  '$fixedTime迄',
                  style: TextStyle(color: colors.onSurface.withOpacity(.5)),
                ),
                leading: Text(
                  '服用期間',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  if (dosingAt.isNotEmpty) {
                    fixedNotifier.update((state) => dosingAt);
                  }
                  dataPicker(context, dosingAt, fixedNotifier);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  const MenuTile({
    required this.title,
    required this.leading,
    required this.onTap,
    this.isTrailing = true,
    super.key,
  });

  final Widget title;
  final Widget leading;
  final bool isTrailing;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
      ),
      child: ListTile(
        leading: leading,
        title: Align(
          alignment: Alignment.centerRight,
          child: title,
        ),
        trailing: isTrailing
            ? Icon(
                Icons.chevron_right,
                color: colors.onSurfaceVariant,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
