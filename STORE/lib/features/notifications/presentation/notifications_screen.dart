import 'package:flutter/material.dart';

import '../../../core/widgets/app_shell.dart';
import '../../../core/widgets/status_badge.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {'title': 'Subscription expires in 5 days', 'type': 'warning'},
      {'title': 'New farm checkup appointment received', 'type': 'new'},
      {'title': 'Disease spike detected in Belgaum region', 'type': 'alert'},
      {'title': 'Low stock for Tungro Control Mix', 'type': 'warning'},
    ];

    return AppShell(
      route: AppRoutes.notifications,
      title: 'Notifications & Alerts',
      items: appSidebarItems,
      child: Card(
        child: ListView.separated(
          padding: const EdgeInsets.all(18),
          itemBuilder: (_, i) {
            final n = notifications[i];
            return ListTile(
              leading: const Icon(Icons.notifications_active_outlined),
              title: Text(n['title']!),
              trailing: StatusBadge(label: n['type']!),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: notifications.length,
        ),
      ),
    );
  }
}
