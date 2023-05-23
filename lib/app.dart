import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_manager/router/router.dart';

import 'app_lifecycle_state_provider.dart';
import 'utils/logger.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AppLifecycleState>(
      appLifecycleStateProvider,
      // `next` に変更された `AppLifecycleState` が入ってきます。
      (previous, next) => logger.fine('Previous: $previous, Next: $next'),
    );
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],
    );
  }
}
