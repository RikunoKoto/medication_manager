import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CustomCountButton extends StatelessWidget {
  const CustomCountButton({
    required this.count,
    required this.countNotifier,
    super.key,
  });

  final String count;
  final StateController<int> countNotifier;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () => countNotifier.update((state) {
              if (state < 10) {
                state++;
              }
              return state;
            }),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: colors.inverseSurface,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(Icons.add, color: colors.onInverseSurface),
            ),
          ),
          const Gap(5),
          SizedBox(
            width: 70,
            child: Center(
              child: Text(
                count,
                style: TextStyle(color: colors.onSurface.withOpacity(.5)),
              ),
            ),
          ),
          const Gap(5),
          GestureDetector(
            onTap: () => countNotifier.update((state) {
              if (state > 0) {
                state--;
              }
              return state;
            }),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: colors.inverseSurface,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                Icons.remove,
                color: colors.onInverseSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
