import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/app_shell.dart';
import '../../../core/widgets/status_badge.dart';
import '../../../shared/providers/support_call_provider.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class SupportCallsScreen extends ConsumerWidget {
  const SupportCallsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calls = ref.watch(supportCallsProvider);

    return AppShell(
      route: AppRoutes.supportCalls,
      title: 'Non-Smartphone Farmer Support',
      items: appSidebarItems,
      child: calls.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (items) => Row(
          children: [
            Expanded(
              flex: 2,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Form(
                    child: ListView(
                      children: [
                        Text('Create Support Case', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 16),
                        const TextField(decoration: InputDecoration(labelText: 'Farmer Name')),
                        const SizedBox(height: 12),
                        const TextField(decoration: InputDecoration(labelText: 'Contact Number')),
                        const SizedBox(height: 12),
                        const TextField(decoration: InputDecoration(labelText: 'Village')),
                        const SizedBox(height: 12),
                        const TextField(decoration: InputDecoration(labelText: 'Crop')),
                        const SizedBox(height: 12),
                        const TextField(maxLines: 4, decoration: InputDecoration(labelText: 'Symptoms')),
                        const SizedBox(height: 16),
                        FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add_call),
                          label: const Text('Register Phone Case'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: Card(
                child: ListView.builder(
                  padding: const EdgeInsets.all(18),
                  itemCount: items.length,
                  itemBuilder: (_, i) {
                    final call = items[i];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.support_agent_outlined),
                        title: Text('${call['farmerName']} • ${call['crop']}'),
                        subtitle: Text('${call['village']} • ${call['symptoms']}'),
                        trailing: StatusBadge(label: call['status']!),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
