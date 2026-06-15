import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.hint,
    required this.onTap,
  });

  final IconData icon;
  final Color iconBg;
  final String title;
  final String hint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 42, height: 42,
              decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(13)),
              child: Icon(icon, color: AppColors.navy),
            ),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 15, color: AppColors.navy)),
            Text(hint, style: const TextStyle(fontSize: 12, color: AppColors.slate)),
          ],
        ),
      ),
    );
  }
}
