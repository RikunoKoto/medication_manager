import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:medication_manager/features/medication_manager/data/medication_manager_repository.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'features/medication_manager/data/dto/medication_item_dto.dart';
import 'utils/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var path = '';
  if (!kIsWeb) {
    final dir = await getApplicationSupportDirectory();
    path = dir.path;
  }
  logger.fine(path);
  // Isarを初期化
  final medicineIsar =
      await Isar.open([MedicationItemDtoSchema], directory: path);
  runApp(
    ProviderScope(
      overrides: [medicationIsarProvider.overrideWithValue(medicineIsar)],
      child: const App(),
    ),
  );
}
