import 'package:flutter/material.dart';

class IconWithForbiddenSign extends StatelessWidget {
  const IconWithForbiddenSign({
    required this.icon,
    required this.iconSize,
    required this.forbiddenSize,
    super.key,
  });

  final IconData icon;
  final double iconSize;
  final double forbiddenSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
        Icon(
          Icons.do_not_disturb_alt,
          size: forbiddenSize,
          color: Colors.red,
        ),
      ],
    );
  }
}
