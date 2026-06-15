import 'dart:convert';

enum MutationKind {
  sale,
  expense;

  static MutationKind fromString(String v) =>
      v == 'expense' ? MutationKind.expense : MutationKind.sale;

  String get value => name;
}

/// A queued offline write. [payload] holds the request fields for the API replay.
class PendingMutation {
  const PendingMutation({
    required this.id,
    required this.kind,
    required this.branchId,
    required this.date,
    required this.payload,
  });

  final int id;
  final MutationKind kind;
  final int branchId;
  final String date;
  final Map<String, dynamic> payload;

  String payloadJson() => jsonEncode(payload);

  factory PendingMutation.fromParts({
    required int id,
    required String kind,
    required int branchId,
    required String date,
    required String payloadJson,
  }) =>
      PendingMutation(
        id: id,
        kind: MutationKind.fromString(kind),
        branchId: branchId,
        date: date,
        payload: jsonDecode(payloadJson) as Map<String, dynamic>,
      );

  int get paymentChannelId => payload['payment_channel_id'] as int;
  num get saleAmount => payload['amount'] as num;

  int get expenseCategoryId => payload['expense_category_id'] as int;
  num get expenseAmount => payload['amount'] as num;
  String get description => payload['description'] as String;
  String get paymentMethod => payload['payment_method'] as String;
  String? get remarks => payload['remarks'] as String?;
}
