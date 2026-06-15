import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../core/theme/app_colors.dart';

/// Thin banner shown when offline or when entries are waiting to sync.
class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final online = ref.watch(onlineStatusProvider).value ?? true;
    final pending = ref.watch(pendingCountProvider).value ?? 0;

    if (online && pending == 0) {
      return const SizedBox.shrink();
    }
    final text = !online
        ? "You're offline — entries are saved and will sync"
        : '$pending change${pending == 1 ? '' : 's'} syncing…';
    return Container(
      width: double.infinity,
      color: online ? AppColors.greenLight : AppColors.slate,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }
}
