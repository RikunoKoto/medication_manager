import 'package:flutter/material.dart';

class CommonSettingMenuTile extends StatelessWidget {
  const CommonSettingMenuTile({
    required this.title,
    required this.leading,
    this.onTap,
    this.isTrailing = true,
    super.key,
  });

  final Widget title;
  final Widget leading;
  final bool isTrailing;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
      ),
      child: ListTile(
        leading: leading,
        title: Align(
          alignment: Alignment.centerRight,
          child: title,
        ),
        trailing: isTrailing
            ? Icon(
                Icons.chevron_right,
                color: colors.onSurfaceVariant,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
