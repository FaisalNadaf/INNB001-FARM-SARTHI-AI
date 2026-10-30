import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/app_shell.dart';
import '../../../routes/app_router.dart';
import '../../../shared/providers/auth_provider.dart';
import '../../common/app_sidebar_items.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppShell(
      route: AppRoutes.settings,
      title: 'Settings',
      items: appSidebarItems,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: ListView(
            children: [
              SwitchListTile(
                value: true,
                onChanged: (_) {},
                title: const Text('Enable notifications'),
              ),
              SwitchListTile(
                value: true,
                onChanged: (_) {},
                title: const Text('Offline draft support'),
              ),
              const ListTile(
                leading: Icon(Icons.language_outlined),
                title: Text('Languages'),
                subtitle: Text('English, Kannada, Hindi'),
              ),
              const ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: Text('Service Radius'),
                subtitle: Text('25 km'),
              ),
              const Divider(),
              FilledButton.icon(
                onPressed: () async {
                  await ref.read(authProvider.notifier).logout();
                  if (context.mounted) context.go(AppRoutes.login);
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
