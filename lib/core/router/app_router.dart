import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/auth_controller.dart';
import '../../features/auth/login_screen.dart';
import '../../features/shell/home_shell.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/dashboard/more_screen.dart';
import '../../features/closings/closings_list_screen.dart';
import '../../features/reports/reports_screen.dart';
import '../../features/closing_form/daily_closing_form_screen.dart';
import '../../features/closing_form/closing_form_controller.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);
      if (auth.isLoading || auth.hasError) {
        return null; // wait; splash shown by builder
      }
      final signedIn = auth.value != null;
      final atLogin = state.matchedLocation == '/login';

      if (!signedIn) {
        return atLogin ? null : '/login';
      }
      if (atLogin) {
        return '/';
      }
      return null;
    },
    refreshListenable: _AuthRefresh(ref),
    routes: [
      GoRoute(path: '/login', builder: (_, _) => const LoginScreen()),
      GoRoute(
        path: '/closing',
        builder: (_, _) => const DailyClosingFormScreen(arg: ClosingFormArg.today()),
      ),
      GoRoute(
        path: '/closing/:id',
        builder: (_, state) {
          final id = int.parse(state.pathParameters['id']!);
          final extra = state.extra as ({int branchId, String date});
          return DailyClosingFormScreen(
            arg: ClosingFormArg.existing(serverId: id, branchId: extra.branchId, date: extra.date),
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, _, navigationShell) => HomeShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: '/', builder: (_, _) => const DashboardScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/closings', builder: (_, _) => const ClosingsListScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/reports', builder: (_, _) => const ReportsScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/more', builder: (_, _) => const MoreScreen()),
          ]),
        ],
      ),
    ],
  );
});

/// Notifies go_router to re-run `redirect` whenever auth state changes.
class _AuthRefresh extends ChangeNotifier {
  _AuthRefresh(Ref ref) {
    ref.listen(authControllerProvider, (_, _) => notifyListeners());
  }
}
