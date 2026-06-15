import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/auth_controller.dart';
import '../../features/auth/login_screen.dart';
import '../../features/shell/home_shell.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/dashboard/more_screen.dart';
import '../../features/closings/closings_list_screen.dart';
import '../../features/closings/closing_detail_screen.dart';
import '../../features/reports/reports_screen.dart';
import '../../features/sales/quick_sale_screen.dart';
import '../../features/expenses/quick_expense_screen.dart';

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
      GoRoute(path: '/sale', builder: (_, _) => const QuickSaleScreen()),
      GoRoute(path: '/expense', builder: (_, _) => const QuickExpenseScreen()),
      GoRoute(
        path: '/closings/:id',
        builder: (_, state) =>
            ClosingDetailScreen(closingId: int.parse(state.pathParameters['id']!)),
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
