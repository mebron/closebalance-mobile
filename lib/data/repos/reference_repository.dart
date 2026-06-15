import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/branch.dart';
import '../models/counter.dart';
import '../models/expense_category.dart';
import '../models/payment_channel.dart';
import '../models/reference_data.dart';
import '../remote/reference_api.dart';

class ReferenceRepository {
  ReferenceRepository(this._api);
  final ReferenceApi _api;

  static const _cacheKey = 'cb_reference_data';

  /// Fetch from API, persist to shared_preferences, return.
  Future<ReferenceData> refresh() async {
    final results = await Future.wait([
      _api.branches(),
      _api.paymentChannels(),
      _api.expenseCategories(),
      _api.currencySymbol(),
      _api.counters(),
    ]);

    final data = ReferenceData(
      branches: results[0] as List<Branch>,
      paymentChannels: results[1] as List<PaymentChannel>,
      expenseCategories: results[2] as List<ExpenseCategory>,
      currencySymbol: results[3] as String,
      counters: results[4] as List<Counter>,
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_cacheKey, jsonEncode(data.toJson()));
    return data;
  }

  /// Last cached reference data, or null if never fetched.
  Future<ReferenceData?> cached() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_cacheKey);
    if (raw == null) {
      return null;
    }
    return ReferenceData.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }
}
