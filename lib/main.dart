import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:medication_manager/features/medication_manager/data/medication_manager_repository.dart';
import 'package:medication_manager/utils/shared_preference_key.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // Isarを初期化
  late final Isar medicineIsar;
  late final SharedPreferences sharedPreferences;
  await Future.wait(
    [
      Future(() async {
        sharedPreferences = await SharedPreferences.getInstance();
        medicineIsar =
            await Isar.open([MedicationItemDtoSchema], directory: path);
      }),
    ],
  );

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        medicationIsarProvider.overrideWithValue(medicineIsar),
      ],
      child: const App(),
    ),
  );
}
