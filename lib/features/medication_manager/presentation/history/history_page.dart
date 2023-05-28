import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/logger.dart';
import '../medication_list/widgets/medication_card.dart';
import '../medication_list_async_notifier.dart';
import 'history_async_notifier.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMedicationItems = ref.watch(historyAsyncNotifierProvider);
    final notifier = ref.watch(historyAsyncNotifierProvider.notifier);

    return asyncMedicationItems.when(
      data: (medicationList) {
        logger.finest(medicationList);
        return Column(children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async =>
                  ref.invalidate(medicationListAsyncNotifierProvider),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  itemCount: medicationList.length,
                  itemBuilder: (context, index) {
                    final item = medicationList.items[index];

                    return Dismissible(
                      key: Key(item.id.toString()),
                      direction: DismissDirection.startToEnd,
                      onDismissed: (direction) async {
                        await notifier.removeMedicationItem(id: index);
                      },
                      child: MedicationCard(
                        item: item,
                        onPillIconPressed: () async {},
                        onEditIconPressed: () async {},
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          if (asyncMedicationItems.isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(child: CircularProgressIndicator()),
            ),
        ]);
      },
      error: (e, st) {
        logger.warning('historyAsyncNotifier');

        return const Center(child: Text('エラー'));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
