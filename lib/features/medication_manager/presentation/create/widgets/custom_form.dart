import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entity/medication_item.dart';

class CustomForm extends ConsumerWidget {
  const CustomForm({
    required this.controller,
    required this.item,
    this.formKey,
    this.labelText,
    super.key,
  });

  //formのインプットボックスに表示されるラベル
  final String? labelText;

  //formのコントローラー
  final TextEditingController controller;

  //複数のformを並べる際にどのformか識別するために使用するKey
  final GlobalKey? formKey;

  // itemの中身によって分岐する為
  final MedicationItem? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.surfaceVariant,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            readOnly: item?.isCompleted == true,
            controller: controller,
            key: formKey,
            keyboardType: TextInputType.text,
            maxLength: 13,
            decoration: InputDecoration(
              //counterText: '',
              counterStyle:
                  TextStyle(color: colors.onSurfaceVariant.withOpacity(.5)),
              //hoverColor: Colors.grey,
              border: InputBorder.none,
              labelText: labelText,
              labelStyle:
                  TextStyle(color: colors.onSurfaceVariant.withOpacity(.5)),
            ),
          ),
        ),
      ),
    );
  }
}
