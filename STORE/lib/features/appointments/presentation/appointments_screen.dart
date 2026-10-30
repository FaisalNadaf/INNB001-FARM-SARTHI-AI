import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/widgets/app_shell.dart';
import '../../../core/widgets/status_badge.dart';
import '../../../shared/providers/appointment_provider.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class AppointmentsScreen extends ConsumerWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appts = ref.watch(appointmentsProvider);

    return AppShell(
      route: AppRoutes.appointments,
      title: 'Appointments',
      items: appSidebarItems,
      child: appts.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (items) => Card(
          child: ListView.separated(
            padding: const EdgeInsets.all(18),
            itemBuilder: (_, i) {
              final a = items[i];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.event_note_outlined)),
                title: Text('${a.farmerName} • ${a.serviceType}'),
                subtitle: Text('${DateFormat('dd MMM yyyy, hh:mm a').format(a.scheduledAt)} • ${a.source}'),
                trailing: StatusBadge(label: a.status),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: items.length,
          ),
        ),
      ),
    );
  }
}
