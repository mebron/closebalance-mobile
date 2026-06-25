import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/local/app_database.dart';
import '../data/local/editable_closing_store.dart';
import '../data/models/reference_data.dart';
import '../data/remote/auth_api.dart';
import '../data/remote/closing_api_service.dart';
import '../data/remote/closings_api.dart';
import '../data/remote/counter_transactions_api.dart';
import '../data/remote/deductions_api.dart';
import '../data/remote/expenses_api.dart';
import '../data/remote/reference_api.dart';
import '../data/remote/reports_api.dart';
import '../data/remote/sales_api.dart';
import '../data/repos/auth_repository.dart';
import '../data/repos/reference_repository.dart';
import '../data/repos/reports_repository.dart';
import '../data/sync/closing_sync_service.dart';
import '../features/auth/auth_controller.dart';
import 'connectivity/connectivity_service.dart';
import 'network/dio_client.dart';
import 'storage/secure_token_store.dart';
import 'storage/user_cache_service.dart';

final tokenStoreProvider = Provider<TokenStore>((ref) => SecureTokenStore());
final userCacheProvider = Provider<UserCacheService>((ref) => UserCacheService());

final dioProvider = Provider<Dio>((ref) {
  return buildDio(
    ref.read(tokenStoreProvider),
    onUnauthorized: () => ref.read(authControllerProvider.notifier).forceSignOut(),
  );
});

final authApiProvider = Provider<AuthApi>((ref) => AuthApi(ref.read(dioProvider)));

final referenceApiProvider =
    Provider<ReferenceApi>((ref) => ReferenceApi(ref.read(dioProvider)));

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    ref.read(authApiProvider),
    ref.read(tokenStoreProvider),
    ref.read(userCacheProvider),
  ),
);

final referenceRepositoryProvider = Provider<ReferenceRepository>(
  (ref) => ReferenceRepository(ref.read(referenceApiProvider)),
);

final closingsApiProvider = Provider<ClosingsApi>((ref) => ClosingsApi(ref.read(dioProvider)));
final salesApiProvider = Provider<SalesApi>((ref) => SalesApi(ref.read(dioProvider)));
final expensesApiProvider = Provider<ExpensesApi>((ref) => ExpensesApi(ref.read(dioProvider)));
final reportsApiProvider = Provider<ReportsApi>((ref) => ReportsApi(ref.read(dioProvider)));

final closingApiServiceProvider = Provider<ClosingApiService>((ref) => ClosingApiService(
      ref.read(closingsApiProvider),
      ref.read(salesApiProvider),
      ref.read(expensesApiProvider),
    ));

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final editableClosingStoreProvider = Provider<EditableClosingStore>(
    (ref) => DriftEditableClosingStore(ref.read(appDatabaseProvider)));

final deductionsApiProvider =
    Provider<DeductionsApi>((ref) => DeductionsApi(ref.read(dioProvider)));

final counterTransactionsApiProvider =
    Provider<CounterTransactionsApi>((ref) => CounterTransactionsApi(ref.read(dioProvider)));

final closingSyncServiceProvider = Provider<ClosingSyncService>((ref) => ClosingSyncService(
      ref.read(closingsApiProvider),
      ref.read(salesApiProvider),
      ref.read(expensesApiProvider),
      ref.read(deductionsApiProvider),
      ref.read(counterTransactionsApiProvider),
    ));

final connectivityServiceProvider =
    Provider<ConnectivityService>((ref) => ConnectivityPlusService());

final reportsRepositoryProvider =
    Provider<ReportsRepository>((ref) => ReportsRepository(ref.read(reportsApiProvider)));

/// Active branch for data scoping.
/// - Branch-restricted users: locked to their assigned branch.
/// - Admin users: starts on the first available branch, switchable via [SelectedBranchNotifier.select].
final selectedBranchProvider =
    NotifierProvider<SelectedBranchNotifier, int?>(SelectedBranchNotifier.new);

class SelectedBranchNotifier extends Notifier<int?> {
  @override
  int? build() {
    final user = ref.watch(authControllerProvider).value;
    if (user == null) return null;
    if (user.branchId != null) return user.branchId;
    final refData = ref.watch(referenceDataProvider);
    return refData.value?.branches.firstOrNull?.id;
  }

  /// Switch to [branchId]. No-op for branch-restricted users.
  void select(int branchId) {
    final user = ref.read(authControllerProvider).value;
    if (user?.branchId != null) return;
    state = branchId;
  }
}

/// Cached reference data (branches, payment channels, expense categories, etc.).
/// Returns the last locally cached version; null items are treated as empty lists
/// upstream. Refreshed at login via [ReferenceRepository.refresh].
final referenceDataProvider = FutureProvider<ReferenceData>((ref) async {
  // Re-evaluate when the user changes (e.g. login/logout).
  ref.watch(authControllerProvider);
  final repo = ref.read(referenceRepositoryProvider);
  final cached = await repo.cached();
  if (cached != null) {
    return cached;
  }
  return repo.refresh();
});

final onlineStatusProvider = StreamProvider<bool>(
    (ref) => ref.read(connectivityServiceProvider).onlineChanges);
