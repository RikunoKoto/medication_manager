import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medication_manager/common_widgets/base_frame_widget.dart';
import 'package:medication_manager/utils/providers/theme_provider.dart';

import '../history/history_page.dart';
import '../medication_list/medication_list_page.dart';
import '../../../../common_widgets/custom_bottom_navigation_bar.dart';

final selectedIndexProvider = StateProvider((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final themeMode = ref.watch(themeModeProvider);
    final themeNotifier = ref.watch(themeModeProvider.notifier);
    return BaseFrameWidget(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('お薬一覧'),
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () {
              themeMode == ThemeMode.light
                  ? themeNotifier.update((state) => ThemeMode.dark)
                  : themeNotifier.update((state) => ThemeMode.light);
            },
          ),
        ],
      ),
      title: 'Home',
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          MedicationListPage(),
          HistoryPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/create'),
        child: Icon(
          Icons.edit,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      bottomBar: CustomBottomNavigationBar(
        onTap: (index) {
          ref.read(selectedIndexProvider.notifier).update((state) => index);
        },
        selectedIndex: selectedIndex,
      ),
    );
  }
}
