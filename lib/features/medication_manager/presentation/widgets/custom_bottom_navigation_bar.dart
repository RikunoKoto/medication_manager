import 'package:flutter/material.dart';

import '../../../../utils/my_flutter_app_icons.dart';

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
    return SizedBox(
      height: 75,
      child: Column(
        children: [
          const Divider(
            height: 0,
            thickness: 0.5,
            color: Colors.white,
          ),
          Expanded(
            child: Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.white,
              ),
              child: BottomNavigationBar(
                items: [
                  _buttonItem(
                    iconData: const Icon(MyFlutterApp.pills),
                    label: 'お薬',
                  ),
                  _buttonItem(
                    iconData: const Icon(MyFlutterApp.history),
                    label: '履歴',
                  ),
                ],
                //backgroundColor: Colors.grey.shade900,
                //selectedItemColor: Colors.white,
                //unselectedItemColor: Colors.grey,
                elevation: 0,
                onTap: onTap,
                currentIndex: selectedIndex,
              ),
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
