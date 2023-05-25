import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_manager/common_widgets/common_divider.dart';

import '../../../../utils/logger.dart';

class MedicationInfoList extends ConsumerWidget {
  const MedicationInfoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LimitedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: const Column(
            children: [
              MenuTile(title: '服用回数', trailing: 'test'),
              CommonDivider(leftIndent: 15, rightIndent: 15),
              MenuTile(title: '服用量(錠)', trailing: 'test'),
              CommonDivider(leftIndent: 15, rightIndent: 15),
              MenuTile(title: '服用期間', trailing: 'test'),
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
    required this.trailing,
    super.key,
  });

  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: ListTile(
        title: Text(title),
        trailing: Text(
          trailing,
          style: const TextStyle(color: Colors.grey),
        ),
        onTap: () {
          logger.fine('tapped $title');
        },
      ),
    );
  }
}
