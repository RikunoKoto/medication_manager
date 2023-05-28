import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preference_key.g.dart';

const dateKey = 'lastOpenedDate';

@riverpod
SharedPreferences sharedPreferences(SharedPreferencesRef ref) =>
    throw UnimplementedError();

@riverpod
SharedPreferencesRepository sharedPreferencesRepository(
  SharedPreferencesRepositoryRef ref,
) =>
    SharedPreferencesRepositoryImpl(
      prefs: ref.watch(sharedPreferencesProvider),
    );

interface class SharedPreferencesRepository {
  Future<String> getDateDay() => throw UnimplementedError();
  Future<void> setDateDay({required String currentDate}) =>
      throw UnimplementedError();
}

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  SharedPreferencesRepositoryImpl({required this.prefs});

  final SharedPreferences prefs;

  @override
  Future<String> getDateDay() async {
    final lastOpendDate = prefs.getString(dateKey) ?? '';
    return lastOpendDate;
  }

  @override
  Future<void> setDateDay({required String currentDate}) async {
    await prefs.setString('lastOpenedDate', currentDate);
    return;
  }
}
