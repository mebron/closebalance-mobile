import 'package:connectivity_plus/connectivity_plus.dart';

/// Reports whether the device currently has a network connection.
abstract interface class ConnectivityService {
  Future<bool> isOnline();

  /// Emits whenever connectivity changes; value is `true` when online.
  Stream<bool> get onlineChanges;
}

class ConnectivityPlusService implements ConnectivityService {
  ConnectivityPlusService([Connectivity? connectivity])
      : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;

  bool _isOnline(List<ConnectivityResult> results) =>
      results.any((r) => r != ConnectivityResult.none);

  @override
  Future<bool> isOnline() async => _isOnline(await _connectivity.checkConnectivity());

  @override
  Stream<bool> get onlineChanges =>
      _connectivity.onConnectivityChanged.map(_isOnline);
}
