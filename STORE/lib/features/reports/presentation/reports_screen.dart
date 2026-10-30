import 'package:flutter/material.dart';

import '../../../core/widgets/app_shell.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reports = [
      'Export Inventory CSV',
      'Export Farmer Visits PDF',
      'Export Appointment Logs CSV',
      'Export Disease Demand Report PDF',
      'Export Monthly Sales CSV',
    ];

    return AppShell(
      route: AppRoutes.reports,
      title: 'Reports & Export',
      items: appSidebarItems,
      child: Card(
        child: ListView.builder(
          padding: const EdgeInsets.all(18),
          itemCount: reports.length,
          itemBuilder: (_, i) => Card(
            child: ListTile(
              leading: const Icon(Icons.file_download_outlined),
              title: Text(reports[i]),
              trailing: FilledButton(
                onPressed: () {},
                child: const Text('Export'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
