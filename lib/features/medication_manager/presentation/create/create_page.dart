import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medication_manager/common_widgets/base_frame_widget.dart';
import 'package:medication_manager/features/medication_manager/domain/usecase/fetch_medication_usecase.dart';
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

// 服用開始期間を保持しているprovider
@riverpod
String dosingStartAtFamily(DosingStartAtFamilyRef ref, MedicationItem? item) {
  if (item == null) {
    return '';
  }
  final stringDosingStartAt = item.stringDosingStartAt;
  return stringDosingStartAt;
}

// 服用開始期間の確定した値を保持するprovider
final fixedStartTimeProvider =
    StateProvider.autoDispose.family<String, MedicationItem?>(
  (ref, item) {
    if (item == null) {
      return '';
    }
    final dosingStartAt = item.stringDosingStartAt;
    return dosingStartAt;
  },
);

// 服用終了期間の確定した値を保持するprovider
final fixedEndTimeProvider =
    StateProvider.autoDispose.family<String, MedicationItem?>(
  (ref, item) {
    if (item == null) {
      return '';
    }
    final dosingEndAt = item.stringDosingEndAt;
    return dosingEndAt;
  },
);

// 服用回数を保持するprovider
final dosageFrequencyCountFamilyProvider =
    StateProvider.autoDispose.family<int, MedicationItem?>((ref, item) {
  if (item == null) {
    return 0;
  }
  final dosageFrequency = item.dosageFrequency;
  return dosageFrequency;
});

// 服用量を保持するprovider
final dosageCountFamilyProvider =
    StateProvider.autoDispose.family<int, MedicationItem?>((ref, item) {
  if (item == null) {
    return 0;
  }
  final dosage = item.dosage;
  return dosage;
});

//今日の服用回数を保持するprovider
final todayDosageCountFamilyProvider =
    StateProvider.autoDispose.family<int, MedicationItem?>((ref, item) {
  if (item == null) {
    return 0;
  }
  if (item.todayDosage > item.dosageFrequency) {
    return item.dosageFrequency;
  }
  final dosage = item.todayDosage;
  return dosage;
});

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
    final parseDosingEnd = DateFormat('yyyy-MM-dd').parse(dosingEndAt);
    final parseDosingStart = DateFormat('yyyy-MM-dd').parse(dosingEndAt);

    if (item == null) {
      await asyncNotifier.addTodoItem(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        todayDosage: todayDosage,
        dosingStartAt: parseDosingStart,
        dosingEndAt: parseDosingEnd,
      );
    } else {
      if (name == item!.name &&
          dosageFrequency == item!.dosageFrequency &&
          dosage == item!.dosage &&
          todayDosage == item!.todayDosage &&
          parseDosingStart == item!.dosingStartAt &&
          parseDosingEnd == item!.dosingEndAt) {
        return;
      }
      await asyncNotifier.editMedicationItem(
        name: name,
        dosageFrequency: dosageFrequency,
        dosage: dosage,
        todayDosage: todayDosage,
        dosingStartAt: parseDosingStart,
        dosingEndAt: parseDosingEnd,
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
          final navigator = Navigator.of(context);
          final name = nameTextEditingController.text;
          final dosageFrequency =
              ref.watch(dosageFrequencyCountFamilyProvider(item));
          final dosage = ref.watch(dosageCountFamilyProvider(item));
          final todayDosage = ref.watch(todayDosageCountFamilyProvider(item));
          final dosingStartAt = ref.watch(fixedStartTimeProvider(item));
          final dosingEndAt = ref.watch(fixedEndTimeProvider(item));
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

          final parseDosingEnd = DateFormat('yyyy-MM-dd').parse(dosingEndAt);
          final differenceToday =
              parseDosingEnd.difference(DateTime.now()).inHours;
          if (differenceToday < 0) {
            ref.invalidate(medicationListAsyncNotifierProvider);
          }

          navigator.pop();
        },
        child: Text(
          '保存',
          style: TextStyle(color: colors.onPrimary),
        ),
      ),
    );
  }
}
