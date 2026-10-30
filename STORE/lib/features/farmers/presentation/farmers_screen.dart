import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/app_shell.dart';
import '../../../core/widgets/loading_state.dart';
import '../../../core/widgets/status_badge.dart';
import '../../../shared/providers/farmer_provider.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class FarmersScreen extends ConsumerWidget {
  const FarmersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farmersAsync = ref.watch(farmersProvider);

    return AppShell(
      route: AppRoutes.farmers,
      title: 'Farmers',
      items: appSidebarItems,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: farmersAsync.when(
            loading: () => const LoadingState(message: 'Fetching farmers from MongoDB...'),
            error: (e, _) => Center(child: Text(e.toString())),
            data: (farmers) {
              return Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search by farmer name, disease or phone',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      FilledButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.person_add_alt_1),
                        label: const Text('Add Walk-in Farmer'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SingleChildScrollView(
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Farmer')),
                            DataColumn(label: Text('Phone')),
                            DataColumn(label: Text('Crop')),
                            DataColumn(label: Text('Latest Diagnosis')),
                            DataColumn(label: Text('Severity')),
                            DataColumn(label: Text('Confidence')),
                            DataColumn(label: Text('Requests')),
                          ],
                          rows: farmers
                              .map(
                                (f) => DataRow(
                                  cells: [
                                    DataCell(Text(f.name)),
                                    DataCell(Text(f.phone)),
                                    DataCell(Text(f.cropType)),
                                    DataCell(Text(f.latestDisease)),
                                    DataCell(StatusBadge(label: f.severityLevel)),
                                    DataCell(Text('${f.latestConfidence.toStringAsFixed(1)}%')),
                                    DataCell(Text('${f.totalRequests}')),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
