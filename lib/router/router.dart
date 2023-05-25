import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/medication_manager/presentation/create/create_page.dart';
import '../features/medication_manager/presentation/history/history_page.dart';
import '../features/medication_manager/presentation/medication_list/medication_list_page.dart';

part 'router.g.dart';

@riverpod
GlobalKey<NavigatorState> navigatorKey(NavigatorKeyRef ref) =>
    GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return _router;
});

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const MedicationListPage(),
    ),
    GoRoute(
      path: '/create',
      builder: (BuildContext context, GoRouterState state) =>
          const CreatePage(),
    ),
    GoRoute(
      path: '/medication:id',
      builder: (BuildContext context, GoRouterState state) =>
          const CreatePage(),
    ),
    GoRoute(
      path: '/history',
      builder: (BuildContext context, GoRouterState state) =>
          const HistoryPage(),
    ),
  ],
);
