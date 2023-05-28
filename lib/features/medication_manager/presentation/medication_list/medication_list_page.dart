import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/custom_exception.dart';
import '../../../../utils/logger.dart';
import '../medication_list_async_notifier.dart';
import 'widgets/medication_card.dart';

class MedicationListPage extends ConsumerWidget {
  const MedicationListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    ref.listen(medicationListAsyncNotifierProvider, (previous, next) async {
      if (next is AsyncError) {
        await Flushbar<dynamic>(
          margin: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(10),
          flushbarPosition: FlushbarPosition.TOP,
          messageColor: colors.onErrorContainer,
          backgroundColor: colors.errorContainer,
          message: (next.error! as CustomException).message,
          icon: Icon(
            Icons.report_problem,
            size: 20,
            color: colors.onErrorContainer,
          ),
          duration: const Duration(seconds: 3),
        ).show(context);
      }
    });
    final asyncMedicationItems = ref.watch(medicationListAsyncNotifierProvider);
    final notifier = ref.watch(medicationListAsyncNotifierProvider.notifier);
    return asyncMedicationItems.when(
      data: (medicationList) {
        logger.finest(medicationList);
        return Column(
          children: [
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
                          await notifier.deleteMedicationItem(id: item.id);
                        },
                        child: MedicationCard(
                          item: item,
                          onPillIconPressed: () async {
                            if (item.isTakeDosage) {
                              return;
                            }
                            final todayDosage = item.todayDosage + 1;
                            return notifier.addTodayDosage(
                              todayDosage: todayDosage,
                              item: item,
                            );
                          },
                          onEditIconPressed: () async {
                            await context.push(
                              '/medication:${item.id}',
                              extra: item,
                            );
                          },
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
          ],
        );
      },
      error: (e, st) {
        logger.warning('medicationListAsyncNotifier');

        return const Center(child: Text('エラー'));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
