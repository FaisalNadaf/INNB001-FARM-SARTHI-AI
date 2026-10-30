import 'package:flutter/material.dart';

import '../../../core/widgets/app_shell.dart';
import '../../../core/widgets/status_badge.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class SchemesScreen extends StatelessWidget {
  const SchemesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final schemes = [
      {'name': 'PM-KISAN Support', 'status': 'active', 'bonus': '₹150/case'},
      {'name': 'Subsidy Irrigation Assistance', 'status': 'deadline soon', 'bonus': '₹300/case'},
      {'name': 'Crop Insurance Help', 'status': 'active', 'bonus': '₹200/case'},
    ];

    return AppShell(
      route: AppRoutes.schemes,
      title: 'Government Scheme Assistance',
      items: appSidebarItems,
      child: Row(
        children: [
          Expanded(
            child: Card(
              child: ListView.separated(
                padding: const EdgeInsets.all(18),
                itemBuilder: (_, i) {
                  final s = schemes[i];
                  return ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.account_balance_outlined)),
                    title: Text(s['name']!),
                    subtitle: Text('Incentive: ${s['bonus']}'),
                    trailing: StatusBadge(label: s['status']!),
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: schemes.length,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: ListView(
                  children: [
                    Text('Assistance Workflow', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    const ListTile(title: Text('1. Check farmer eligibility')),
                    const ListTile(title: Text('2. Collect documents')),
                    const ListTile(title: Text('3. Submit assistance request')),
                    const ListTile(title: Text('4. Mark completion and collect bonus')),
                    const Divider(),
                    Text('Completed this month: 12', style: Theme.of(context).textTheme.titleMedium),
                    Text('Bonus earned: ₹2,450', style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
