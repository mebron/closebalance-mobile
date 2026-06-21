// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editable_closing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EditableSale _$EditableSaleFromJson(Map<String, dynamic> json) =>
    _EditableSale(
      clientId: json['clientId'] as String,
      serverId: (json['server_id'] as num?)?.toInt(),
      paymentChannelId: (json['payment_channel_id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      dirty: json['dirty'] as bool? ?? false,
      deleted: json['deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$EditableSaleToJson(_EditableSale instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'server_id': instance.serverId,
      'payment_channel_id': instance.paymentChannelId,
      'amount': instance.amount,
      'dirty': instance.dirty,
      'deleted': instance.deleted,
    };

_EditableExpense _$EditableExpenseFromJson(Map<String, dynamic> json) =>
    _EditableExpense(
      clientId: json['clientId'] as String,
      serverId: (json['server_id'] as num?)?.toInt(),
      expenseCategoryId: (json['expense_category_id'] as num).toInt(),
      description: json['description'] as String?,
      amount: (json['amount'] as num).toDouble(),
      paymentChannelId: (json['payment_channel_id'] as num?)?.toInt(),
      dirty: json['dirty'] as bool? ?? false,
      deleted: json['deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$EditableExpenseToJson(_EditableExpense instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'server_id': instance.serverId,
      'expense_category_id': instance.expenseCategoryId,
      'description': instance.description,
      'amount': instance.amount,
      'payment_channel_id': instance.paymentChannelId,
      'dirty': instance.dirty,
      'deleted': instance.deleted,
    };

_EditableDeduction _$EditableDeductionFromJson(Map<String, dynamic> json) =>
    _EditableDeduction(
      clientId: json['clientId'] as String,
      serverId: (json['server_id'] as num?)?.toInt(),
      type: json['type'] as String,
      description: json['description'] as String?,
      amount: (json['amount'] as num).toDouble(),
      paymentChannelId: (json['payment_channel_id'] as num?)?.toInt(),
      dirty: json['dirty'] as bool? ?? false,
      deleted: json['deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$EditableDeductionToJson(_EditableDeduction instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'server_id': instance.serverId,
      'type': instance.type,
      'description': instance.description,
      'amount': instance.amount,
      'payment_channel_id': instance.paymentChannelId,
      'dirty': instance.dirty,
      'deleted': instance.deleted,
    };

_EditablePayment _$EditablePaymentFromJson(Map<String, dynamic> json) =>
    _EditablePayment(
      amount: (json['amount'] as num).toDouble(),
      paymentMethod: json['payment_method'] as String? ?? 'cash',
    );

Map<String, dynamic> _$EditablePaymentToJson(_EditablePayment instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'payment_method': instance.paymentMethod,
    };

_EditableCounterTxn _$EditableCounterTxnFromJson(Map<String, dynamic> json) =>
    _EditableCounterTxn(
      clientId: json['clientId'] as String,
      serverId: (json['server_id'] as num?)?.toInt(),
      counterId: (json['counter_id'] as num).toInt(),
      saleAmount: (json['sale_amount'] as num).toDouble(),
      payments:
          (json['payments'] as List<dynamic>?)
              ?.map((e) => EditablePayment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <EditablePayment>[],
      remarks: json['remarks'] as String?,
      dirty: json['dirty'] as bool? ?? false,
      deleted: json['deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$EditableCounterTxnToJson(_EditableCounterTxn instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'server_id': instance.serverId,
      'counter_id': instance.counterId,
      'sale_amount': instance.saleAmount,
      'payments': instance.payments.map((e) => e.toJson()).toList(),
      'remarks': instance.remarks,
      'dirty': instance.dirty,
      'deleted': instance.deleted,
    };

_EditableClosing _$EditableClosingFromJson(
  Map<String, dynamic> json,
) => _EditableClosing(
  serverId: (json['server_id'] as num?)?.toInt(),
  branchId: (json['branch_id'] as num).toInt(),
  date: json['date'] as String,
  status: _statusFromJson(json['status'] as String),
  notes: json['notes'] as String?,
  totalSales: (json['total_sales'] as num?)?.toDouble() ?? 0.0,
  sales:
      (json['sales'] as List<dynamic>?)
          ?.map((e) => EditableSale.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <EditableSale>[],
  expenses:
      (json['expenses'] as List<dynamic>?)
          ?.map((e) => EditableExpense.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <EditableExpense>[],
  deductions:
      (json['deductions'] as List<dynamic>?)
          ?.map((e) => EditableDeduction.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <EditableDeduction>[],
  counterTransactions:
      (json['counter_transactions'] as List<dynamic>?)
          ?.map((e) => EditableCounterTxn.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <EditableCounterTxn>[],
  headerDirty: json['header_dirty'] as bool? ?? false,
);

Map<String, dynamic> _$EditableClosingToJson(_EditableClosing instance) =>
    <String, dynamic>{
      'server_id': instance.serverId,
      'branch_id': instance.branchId,
      'date': instance.date,
      'status': _statusToJson(instance.status),
      'notes': instance.notes,
      'total_sales': instance.totalSales,
      'sales': instance.sales.map((e) => e.toJson()).toList(),
      'expenses': instance.expenses.map((e) => e.toJson()).toList(),
      'deductions': instance.deductions.map((e) => e.toJson()).toList(),
      'counter_transactions': instance.counterTransactions
          .map((e) => e.toJson())
          .toList(),
      'header_dirty': instance.headerDirty,
    };
