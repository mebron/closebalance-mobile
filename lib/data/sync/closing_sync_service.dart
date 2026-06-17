import '../../core/error/app_exception.dart';
import '../models/editable/editable_closing.dart';
import '../remote/closings_api.dart';
import '../remote/counter_transactions_api.dart';
import '../remote/deductions_api.dart';
import '../remote/expenses_api.dart';
import '../remote/sales_api.dart';
import 'editable_closing_mapper.dart';

/// Reconciles a locally-edited [EditableClosing] to the server, then returns the
/// authoritative copy (clean, with server ids). Throws on network/validation
/// errors (the caller keeps the local doc dirty and surfaces the message).
class ClosingSyncService {
  ClosingSyncService(this._closings, this._sales, this._expenses, this._deductions, this._counters);

  final ClosingsApi _closings;
  final SalesApi _sales;
  final ExpensesApi _expenses;
  final DeductionsApi _deductions;
  final CounterTransactionsApi _counters;

  Future<EditableClosing> sync(EditableClosing c) async {
    var serverId = c.serverId;

    if (serverId == null) {
      try {
        final created = await _closings.store(
            branchId: c.branchId, date: c.date, totalSales: c.totalSales, notes: c.notes);
        serverId = created.id;
      } on AppException catch (e) {
        if (e.kind != AppExceptionKind.validation) {
          rethrow;
        }
        // Duplicate branch+date: adopt the existing closing.
        final page = await _closings.index(dateFrom: c.date, dateTo: c.date, branchId: c.branchId);
        if (page.items.isEmpty) {
          rethrow;
        }
        serverId = page.items.first.id;
        if (c.headerDirty) {
          await _closings.update(serverId, totalSales: c.totalSales, notes: c.notes);
        }
      }
    } else if (c.headerDirty) {
      await _closings.update(serverId, totalSales: c.totalSales, notes: c.notes);
    }

    for (final s in c.sales) {
      if (s.deleted) {
        if (s.serverId != null) {
          await _sales.delete(closingId: serverId, saleId: s.serverId!);
        }
      } else if (s.serverId == null) {
        await _sales.create(closingId: serverId, paymentChannelId: s.paymentChannelId, amount: s.amount);
      } else if (s.dirty) {
        await _sales.update(
            closingId: serverId, saleId: s.serverId!, paymentChannelId: s.paymentChannelId, amount: s.amount);
      }
    }
    for (final e in c.expenses) {
      if (e.deleted) {
        if (e.serverId != null) {
          await _expenses.delete(closingId: serverId, expenseId: e.serverId!);
        }
      } else if (e.serverId == null) {
        await _expenses.create(
            closingId: serverId,
            expenseCategoryId: e.expenseCategoryId,
            description: e.description,
            amount: e.amount,
            paymentMethod: e.paymentMethod);
      } else if (e.dirty) {
        await _expenses.update(
            closingId: serverId,
            expenseId: e.serverId!,
            expenseCategoryId: e.expenseCategoryId,
            description: e.description,
            amount: e.amount,
            paymentMethod: e.paymentMethod);
      }
    }
    for (final d in c.deductions) {
      if (d.deleted) {
        if (d.serverId != null) {
          await _deductions.delete(closingId: serverId, deductionId: d.serverId!);
        }
      } else if (d.serverId == null) {
        await _deductions.create(
            closingId: serverId,
            type: d.type,
            description: d.description ?? '',
            amount: d.amount,
            paymentMethod: d.paymentMethod);
      } else if (d.dirty) {
        await _deductions.update(
            closingId: serverId,
            deductionId: d.serverId!,
            type: d.type,
            description: d.description ?? '',
            amount: d.amount,
            paymentMethod: d.paymentMethod);
      }
    }
    for (final t in c.counterTransactions) {
      if (t.deleted) {
        if (t.serverId != null) {
          await _counters.delete(closingId: serverId, transactionId: t.serverId!);
        }
      } else if (t.serverId == null) {
        await _counters.create(
            closingId: serverId,
            counterId: t.counterId,
            date: c.date,
            saleAmount: t.saleAmount,
            payments: t.payments,
            remarks: t.remarks);
      } else if (t.dirty) {
        await _counters.update(
            closingId: serverId,
            transactionId: t.serverId!,
            counterId: t.counterId,
            date: c.date,
            saleAmount: t.saleAmount,
            payments: t.payments,
            remarks: t.remarks);
      }
    }

    final fresh = await _closings.show(serverId);
    return EditableClosingMapper.fromDailyClosing(fresh, branchId: c.branchId);
  }
}
