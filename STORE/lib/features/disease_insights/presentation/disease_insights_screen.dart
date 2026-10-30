import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/app_shell.dart';
import '../../../core/widgets/loading_state.dart';
import '../../../shared/providers/analytics_provider.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class DiseaseInsightsScreen extends ConsumerWidget {
  const DiseaseInsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final distribution = ref.watch(diseaseDistributionProvider);

    return AppShell(
      route: AppRoutes.diseaseInsights,
      title: 'Crop Disease Insights',
      items: appSidebarItems,
      child: distribution.when(
        loading: () =>
            const LoadingState(message: 'Preparing disease analytics...'),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (data) {
          final entries = data.entries.toList();
          return Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Disease Distribution',
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 20),
                        Expanded(
                          child: PieChart(
                            PieChartData(
                              sections: List.generate(entries.length, (i) {
                                final e = entries[i];
                                return PieChartSectionData(
                                  value: e.value.toDouble(),
                                  title: '${e.key}\n${e.value}',
                                  radius: 120,
                                );
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Card(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(18),
                    itemBuilder: (_, index) {
                      final e = entries[index];
                      return ListTile(
                        leading: const Icon(Icons.bug_report_outlined),
                        title: Text(e.key),
                        subtitle: Text('Affected cases: ${e.value}'),
                        trailing: const Icon(Icons.chevron_right),
                      );
                    },
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: entries.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
