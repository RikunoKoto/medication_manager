import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medication_manager/common_widgets/base_frame_widget.dart';

import '../../../../utils/logger.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/medication_card.dart';
import 'medication_list_notifier.dart';

final selectedIndexProvider = StateProvider((ref) => 0);

class MedicationListPage extends ConsumerWidget {
  const MedicationListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMedicationItems = ref.watch(medicationListNotifierProvider);
    final notifier = ref.watch(medicationListNotifierProvider.notifier);
    final selectedIndex = ref.watch(selectedIndexProvider);
    return BaseFrameWidget(
      appBar: AppBar(
        title: const Text('お薬一覧'),
      ),
      title: 'Medication Manager',
      body: asyncMedicationItems.when(
        data: (medicationList) {
          return Column(children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async =>
                    ref.invalidate(medicationListNotifierProvider),
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
                        child: MedicationCard(medicationItem: item),
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
          logger.warning('todoListAsyncNotifierにエラー発生');

          return const Center(child: Text('データベースエラー'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/create'),

        // onPressed: () => showModalBottomSheet(
        //   context: context,
        //   builder: (BuildContext bc) {
        //     return Container(
        //       // Define padding for the container.
        //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        //       // Create a Wrap widget to display the sheet contents.
        //       child: Wrap(
        //         spacing: 60, // Add spacing between the child widgets.
        //         children: <Widget>[
        //           // Add a container with height to create some space.
        //           Container(height: 10),
        //           // Add a text widget with a title for the sheet.
        //           const Text(
        //             "Flutter Material 3",
        //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        //           ),
        //           Container(height: 10), // Add some more space.
        //           // Add a text widget with a long description for the sheet.
        //           Text(
        //             'Flutter is an open-source UI software development kit created by Google. It is used to develop cross-platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase.',
        //             style: TextStyle(
        //                 color: Colors.grey[600], // Set the text color.
        //                 fontSize: 18 // Set the text size.
        //                 ),
        //           ),
        //           Container(height: 10), // Add some more space.
        //           // Add a row widget to display buttons for closing and reading more.
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment
        //                 .end, // Align the buttons to the right.
        //             children: <Widget>[
        //               // Add a text button to close the sheet.
        //               TextButton(
        //                 style: TextButton.styleFrom(
        //                   foregroundColor: Colors.transparent,
        //                 ), // Make the button text transparent.
        //                 onPressed: () {
        //                   Navigator.pop(context); // Close the sheet.
        //                 },
        //                 child: Text("CLOSE",
        //                     style: TextStyle(
        //                         color: Theme.of(context)
        //                             .colorScheme
        //                             .primary)), // Add the button text.
        //               ),
        //               // Add an elevated button to read more.
        //               ElevatedButton(
        //                 style: ElevatedButton.styleFrom(
        //                   backgroundColor:
        //                       Theme.of(context).colorScheme.primary,
        //                 ), // Set the button background color.
        //                 onPressed: () {}, // Add the button onPressed function.
        //                 child: Text("Read More",
        //                     style: TextStyle(
        //                         color: Theme.of(context)
        //                             .colorScheme
        //                             .inversePrimary)), // Add the button text.
        //               )
        //             ],
        //           )
        //         ],
        //       ),
        //     );
        //   },
        // ),
        child: const Icon(Icons.edit),
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
