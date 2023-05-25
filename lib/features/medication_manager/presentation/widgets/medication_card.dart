import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entity/medication_item.dart';

class MedicationCard extends StatelessWidget {
  const MedicationCard({
    super.key,
    required this.medicationItem,
  });

  /// Cardに表示する服薬情報
  final MedicationItem medicationItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        '/medication/${medicationItem.id}',
        extra: medicationItem,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              medicationItem.isEmptyName ? 'No Name' : medicationItem.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              overflow: TextOverflow.clip,
            ),
            const Gap(5),
          ],
        ),
      ),
    );
  }
}
