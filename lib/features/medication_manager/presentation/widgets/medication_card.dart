import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medication_manager/utils/my_flutter_app_icons.dart';

import '../../domain/entity/medication_item.dart';

class MedicationCard extends StatelessWidget {
  const MedicationCard({
    super.key,
    required this.item,
  });

  /// Cardに表示する服薬情報
  final MedicationItem item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        child: Container(
          height: 130,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.tertiary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      MyFlutterApp.pills,
                      color: colors.onTertiary,
                    ),
                  ),
                ),
              ),
              const Gap(10),
              const VerticalDivider(
                indent: 15,
                endIndent: 15,
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '本日の服薬回数   0/${item.dosageFrequency} 回',
                          style: TextStyle(
                            color: colors.onSurface.withOpacity(.5),
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            context.push(
                              '/medication:${item.id}',
                              extra: item,
                            );
                          },
                          icon: Icon(
                            Icons.more_vert,
                            size: 20,
                            color: colors.onSurface,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.isEmptyName ? 'No Name' : item.name,
                        style: TextStyle(
                          color: colors.onSurface,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '服用期間 ${item.stringDosingAt} 迄',
                        style: TextStyle(
                          color: colors.onSurface.withOpacity(.5),
                          fontSize: 13,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
