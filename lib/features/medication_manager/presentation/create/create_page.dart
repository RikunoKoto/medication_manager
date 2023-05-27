import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medication_manager/common_widgets/base_frame_widget.dart';
import 'package:medication_manager/features/medication_manager/presentation/create/widgets/custom_button.dart';
import 'package:medication_manager/features/medication_manager/presentation/create/widgets/custom_form.dart';
import 'package:medication_manager/features/medication_manager/presentation/create/widgets/medication_info_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/logger.dart';
import '../../domain/entity/medication_item.dart';
import '../medication_list_async_notifier.dart';

part 'create_page.g.dart';

//　お薬の名前を保持するprovider
@riverpod
Raw<TextEditingController> _nameTextEditingController(
  _NameTextEditingControllerRef ref,
  String name,
) {
  final controller = TextEditingController(text: name);

  return controller;
}

class CreatePage extends ConsumerWidget {
  const CreatePage({this.item, super.key});

  /// 編集操作の場合の服薬情報
  final MedicationItem? item;

  Future<void> onTap({
    required WidgetRef ref,
    required String name,
    required int dosageFrequency,
    required int dosage,
    required int todayDosage,
    required String dosingStartAt,
    required String dosingEndAt,
  }) async {
    final asyncNotifier =
        ref.read(medicationListAsyncNotifierProvider.notifier);
    final parseDosingEndPeriod = DateFormat('yyyy-MM-dd').parse(dosingEndAt);
    if (item == null) {
      await asyncNotifier.addTodoItem(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        todayDosage: todayDosage,
        dosingStartAt: dosingStartAt,
        dosingEndAt: parseDosingEndPeriod,
      );
    } else {
      if (name == item!.name &&
          dosageFrequency == item!.dosageFrequency &&
          dosage == item!.dosage &&
          parseDosingEndPeriod == item!.dosingEndAt &&
          todayDosage == item!.todayDosage &&
          paraseDosingStartPeriod == item!.dosingStartAt) {
        return;
      }
      await asyncNotifier.editMedicationItem(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        todayDosage: todayDosage,
        dosingStartAt: parseDosingStartPeriod,
        dosingEndAt: parseDosingEndPeriod,
        item: item!,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final nameTextEditingController =
        ref.watch(_nameTextEditingControllerProvider(item?.name ?? ''));

    return BaseFrameWidget(
      appBar: AppBar(
        centerTitle: true,
        title: const Icon(Icons.edit),
      ),
      title: 'Create Page',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'お薬の名前',
                style: TextStyle(color: colors.onBackground),
              ),
            ),
            const Gap(10),
            CustomForm(
              controller: nameTextEditingController,
              item: item,
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'お薬情報',
                style: TextStyle(color: colors.onBackground),
              ),
            ),
            const Gap(10),
            MedicationInfoForm(item: item),
          ],
        ),
      ),
      bottomBar: CustomButton(
        onTap: () async {
          final name = nameTextEditingController.text;
          final dosageFrequency =
              ref.watch(dosageFrequencyCountFamilyProvider(item));
          final dosage = ref.watch(dosageCountFamilyProvider(item));
          final dosingEndAt = ref.watch(fixedTimeProvider(item));
          final todayDosage = ref.watch(todayDosageCountFamilyProvider(item));
          if (name.isEmpty ||
              dosageFrequency == 0 ||
              dosage == 0 ||
              dosingEndAt.isEmpty ||
              dosingStartAt.isEmpty) {
            return;
          }
          await onTap(
            ref: ref,
            name: name,
            dosageFrequency: dosageFrequency,
            dosage: dosage,
            todayDosage: todayDosage,
            dosingStartAt: dosingStartAt,
            dosingEndAt: dosingEndAt,
          );
          //　エラーが生じた場合画面遷移をさせないよう早期リターン
          if (ref.read(medicationListAsyncNotifierProvider) is AsyncError) {
            return;
          }
          if (context.mounted) {
            context.pop();
          }
        },
        child: Text(
          '保存',
          style: TextStyle(color: colors.onPrimary),
        ),
      ),
    );
  }
}
