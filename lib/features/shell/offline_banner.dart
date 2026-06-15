import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../core/theme/app_colors.dart';

/// Thin banner shown when the device is offline.
class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final online = ref.watch(onlineStatusProvider).value ?? true;

    if (online) {
      return const SizedBox.shrink();
    }
    return Container(
      width: double.infinity,
      color: AppColors.slate,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: const Text(
        "You're offline — entries are saved and will sync",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
