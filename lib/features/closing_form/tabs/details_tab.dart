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
        TextFormField(
          initialValue: closing.date,
          readOnly: true,
          decoration: const InputDecoration(labelText: 'Date'),
        ),
        const SizedBox(height: 12),
        Chip(label: Text(closing.status.displayName)),
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
