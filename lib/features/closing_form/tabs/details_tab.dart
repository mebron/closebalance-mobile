import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/editable/editable_closing.dart';
import '../closing_form_controller.dart';

class DetailsTab extends ConsumerWidget {
  const DetailsTab({
    super.key,
    required this.closing,
    required this.arg,
    required this.branchName,
  });

  final EditableClosing closing;
  final ClosingFormArg arg;
  final String branchName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFinalized = closing.status.isFinalized;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextFormField(
          initialValue: branchName,
          readOnly: true,
          decoration: const InputDecoration(labelText: 'Branch'),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: isFinalized
              ? null
              : () async {
                  final parsed = DateTime.tryParse(closing.date) ?? DateTime.now();
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: parsed,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null && context.mounted) {
                    final iso =
                        '${picked.year.toString().padLeft(4, '0')}-'
                        '${picked.month.toString().padLeft(2, '0')}-'
                        '${picked.day.toString().padLeft(2, '0')}';
                    ref.read(closingFormControllerProvider(arg).notifier).setDate(iso);
                  }
                },
          child: IgnorePointer(
            child: TextFormField(
              key: ValueKey(closing.date),
              initialValue: closing.date,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Date',
                suffixIcon: isFinalized ? null : const Icon(Icons.calendar_today, size: 18),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: closing.status.isFinalized
                  ? Colors.green.shade100
                  : Colors.orange.shade100,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: closing.status.isFinalized
                    ? Colors.green.shade400
                    : Colors.orange.shade400,
              ),
            ),
            child: Text(
              closing.status.displayName,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: closing.status.isFinalized
                    ? Colors.green.shade800
                    : Colors.orange.shade800,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: closing.totalSales.toStringAsFixed(2),
          readOnly: isFinalized,
          decoration: const InputDecoration(labelText: 'Total Sales'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: isFinalized
              ? null
              : (v) {
                  final n = double.tryParse(v);
                  if (n != null) {
                    ref
                        .read(closingFormControllerProvider(arg).notifier)
                        .setTotalSales(n);
                  }
                },
        ),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: closing.notes,
          readOnly: isFinalized,
          decoration: const InputDecoration(labelText: 'Notes'),
          maxLines: 3,
          onChanged: isFinalized
              ? null
              : (v) {
                  ref
                      .read(closingFormControllerProvider(arg).notifier)
                      .setNotes(v.isEmpty ? null : v);
                },
        ),
      ],
    );
  }
}
