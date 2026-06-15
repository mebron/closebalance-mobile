import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/auth_controller.dart';

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider).value;
    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: ListView(children: [
        ListTile(
          leading: const Icon(Icons.person_outline),
          title: Text(user?.name ?? ''),
          subtitle: Text(user?.email ?? ''),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Sign out'),
          onTap: () => ref.read(authControllerProvider.notifier).logout(),
        ),
      ]),
    );
  }
}
