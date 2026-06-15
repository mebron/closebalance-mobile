import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class LineCard extends StatelessWidget {
  const LineCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.amount,
    required this.onTap,
    required this.onDelete,
  });

  final String title;
  final String? subtitle;
  final String amount;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              color: AppColors.danger,
              onPressed: onDelete,
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
