import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomCountButton extends StatelessWidget {
  const CustomCountButton({
    required this.count,
    required this.onIncrementTap,
    required this.onDecrementTap,
    super.key,
  });

  final String count;
  final void Function() onDecrementTap;
  final void Function() onIncrementTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: onIncrementTap,
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
            onTap: onDecrementTap,
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
