import 'package:flutter/material.dart';

import '../utils/my_flutter_app_icons.dart';

/// ボトムナビゲーションバーWidget
class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  /// itemタップイベント
  final void Function(int) onTap;

  /// 選択されたitemのindex
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 75,
      child: Column(
        children: [
          Expanded(
            child: BottomNavigationBar(
              items: [
                _buttonItem(
                  iconData: Icon(MyFlutterApp.pills, color: colors.tertiary),
                  label: 'お薬',
                ),
                _buttonItem(
                  iconData: Icon(MyFlutterApp.history, color: colors.tertiary),
                  label: '履歴',
                ),
              ],
              backgroundColor: colors.background.withOpacity(.2),
              elevation: 0,
              onTap: onTap,
              currentIndex: selectedIndex,
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buttonItem({
    required Widget iconData,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: iconData,
      ),
      label: label,
      tooltip: '',
    );
  }
}
