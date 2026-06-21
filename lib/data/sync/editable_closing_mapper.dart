import 'package:uuid/uuid.dart';
import '../models/daily_closing.dart';
import '../models/editable/editable_closing.dart';

const _uuid = Uuid();

/// Converts a server [DailyClosing] into a clean [EditableClosing] (no dirty/deleted
/// flags, all server ids populated).
abstract final class EditableClosingMapper {
  static EditableClosing fromDailyClosing(DailyClosing dc, {required int branchId}) {
    return EditableClosing(
      serverId: dc.id,
      branchId: dc.branch?.id ?? branchId,
      date: dc.date,
      status: dc.status,
      notes: dc.notes,
      totalSales: dc.totalSales,
      headerDirty: false,
      sales: dc.sales
          .map((s) => EditableSale(
                clientId: _uuid.v4(),
                serverId: s.id,
                paymentChannelId: s.paymentChannelId,
                amount: s.amount,
              ))
          .toList(),
      expenses: dc.expenses
          .map((e) => EditableExpense(
                clientId: _uuid.v4(),
                serverId: e.id,
                expenseCategoryId: e.expenseCategoryId,
                description: e.description,
                amount: e.amount,
                paymentChannelId: e.paymentChannelId,
              ))
          .toList(),
      deductions: dc.deductions
          .map((d) => EditableDeduction(
                clientId: _uuid.v4(),
                serverId: d.id,
                type: d.type,
                description: d.description,
                amount: d.amount,
                paymentChannelId: d.paymentChannelId,
              ))
          .toList(),
      counterTransactions: dc.counterTransactions
          .map((t) => EditableCounterTxn(
                clientId: _uuid.v4(),
                serverId: t.id,
                counterId: t.counterId,
                saleAmount: t.saleAmount,
                payments: t.payments
                    .map((p) => EditablePayment(amount: p.amount, paymentMethod: p.method))
                    .toList(),
                remarks: t.remarks,
              ))
          .toList(),
    );
  }
}
