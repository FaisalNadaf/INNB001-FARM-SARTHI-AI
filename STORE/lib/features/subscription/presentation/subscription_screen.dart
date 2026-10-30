import 'package:flutter/material.dart';

import '../../../core/widgets/app_shell.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/status_badge.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      route: AppRoutes.subscription,
      title: 'Subscription',
      items: appSidebarItems,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Farm Sarthi AI Plus',
                subtitle: '30-day partner subscription for verified stores',
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  StatusBadge(label: 'Active'),
                  SizedBox(width: 12),
                  StatusBadge(label: 'Verified Store'),
                ],
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: const [
                  _InfoTile(label: 'Plan', value: 'Farm Sarthi AI Plus'),
                  _InfoTile(label: 'Duration', value: '30 Days'),
                  _InfoTile(label: 'Activated On', value: '01 Mar 2026'),
                  _InfoTile(label: 'Expires On', value: '31 Mar 2026'),
                  _InfoTile(label: 'Payment Status', value: 'Paid'),
                  _InfoTile(label: 'Renewal Amount', value: '₹1,999'),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.refresh),
                    label: const Text('Renew Subscription'),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.receipt_long_outlined),
                    label: const Text('Payment History'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;
  const _InfoTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 8),
          Text(value, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
