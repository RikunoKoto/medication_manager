import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonForm extends ConsumerWidget {
  const CommonForm({
    required this.controller,
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: controller,
            key: formKey,
            decoration: InputDecoration(
              hoverColor: Colors.grey,
              border: InputBorder.none,
              labelText: labelText,
              labelStyle: const TextStyle(color: Colors.white12),
            ),
          ),
        ),
      ),
    );
  }
}
