import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:medication_manager/common_widgets/base_frame_widget.dart';
import 'package:medication_manager/features/medication_manager/presentation/widgets/custom_form.dart';
import 'package:medication_manager/features/medication_manager/presentation/widgets/medication_info_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entity/medication_item.dart';

part 'create_page.g.dart';

@riverpod
TextEditingController _nameTextEditingController(
  _NameTextEditingControllerRef ref,
  String name,
) {
  final controller = TextEditingController(text: name);

  return controller;
}

@riverpod
TextEditingController _dosageFrequencyTextEditingController(
  _DosageFrequencyTextEditingControllerRef ref,
  String dosageFrequency,
) {
  final controller = TextEditingController(text: dosageFrequency);
  ref.onDispose(controller.dispose);

  return controller;
}

@riverpod
TextEditingController _dosageTextEditingController(
  _DosageTextEditingControllerRef ref,
  String dosage,
) {
  final controller = TextEditingController(text: dosage);
  ref.onDispose(controller.dispose);

  return controller;
}

@riverpod
TextEditingController _dosingPeriodTextEditingController(
  _DosingPeriodTextEditingControllerRef ref,
  String dosingPeriod,
) {
  final controller = TextEditingController(text: dosingPeriod);
  ref.onDispose(controller.dispose);

  return controller;
}

class CreatePage extends ConsumerWidget {
  const CreatePage({this.item, super.key});

  /// 編集操作の場合の服薬情報
  final MedicationItem? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameTextEditingController =
        ref.watch(_nameTextEditingControllerProvider(item?.name ?? ''));
    return BaseFrameWidget(
      appBar: AppBar(title: const Icon(Icons.edit)),
      title: 'Create Page',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text('お薬の名前'),
            ),
            const Gap(10),
            CommonForm(
              controller: nameTextEditingController,
            ),
            const Gap(10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text('お薬情報'),
            ),
            const Gap(10),
            const MedicationInfoList(),
          ],
        ),
      ),
    );
  }
}
