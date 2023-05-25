import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_manager/common_widgets/common_divider.dart';

import '../../../../utils/logger.dart';
import '../../domain/entity/medication_item.dart';
import 'cupertion_data_picker_dialog.dart';

final periodProvider =
    StateProvider.autoDispose.family<String, MedicationItem?>(
  (ref, item) => item == null ? '' : item.dosingPeriod.toString(),
);

class MedicationInfoForm extends ConsumerWidget {
  const MedicationInfoForm({required this.item, super.key});

  final MedicationItem? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final period = ref.watch(periodProvider(item));
    void dataPicker() {
      logger.fine('dataPicker');
      showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return CupertionDatePickerDialog(item: item);
        },
      );
    }

    return LimitedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              MenuTile(
                title: '回',
                leading: '服用回数',
                onTap: dataPicker,
              ),
              const CommonDivider(leftIndent: 15, rightIndent: 15),
              MenuTile(
                title: '錠',
                leading: '服用量(錠)',
                onTap: dataPicker,
              ),
              const CommonDivider(leftIndent: 15, rightIndent: 15),
              MenuTile(
                title: '$period迄',
                leading: '服用期間',
                onTap: dataPicker,
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
    super.key,
  });

  final String title;
  final String leading;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: ListTile(
        leading: Text(leading),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(title, style: const TextStyle(color: Colors.grey)),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}
