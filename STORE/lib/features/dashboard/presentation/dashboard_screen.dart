import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/app_shell.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/kpi_card.dart';
import '../../../core/widgets/loading_state.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/status_badge.dart';
import '../../../shared/providers/dashboard_provider.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);

    return AppShell(
      route: AppRoutes.dashboard,
      title: 'Store Dashboard',
      items: appSidebarItems,
      child: dashboard.when(
        loading: () => const LoadingState(message: 'Loading dashboard...'),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (data) {
          final farmers = data['farmers'] as List<dynamic>;
          final hotspots = data['hotspots'] as List<dynamic>;

          if (farmers.isEmpty) {
            return const EmptyState(
              title: 'No business data yet',
              subtitle: 'Once farmers, products and service logs are available, the dashboard will populate.',
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Row(
                    children: [
                      Expanded(
                        child: KpiCard(
                          title: 'Active Farmers',
                          value: '${data['activeFarmersCount']}',
                          icon: Icons.people_alt_outlined,
                          footer: 'In linked service area',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: KpiCard(
                          title: 'Appointments Today',
                          value: '${data['appointmentsToday']}',
                          icon: Icons.calendar_month_outlined,
                          footer: 'Pending + approved',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: KpiCard(
                          title: 'Products',
                          value: '${data['totalProducts']}',
                          icon: Icons.inventory_2_outlined,
                          footer: 'Live in store catalog',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: KpiCard(
                          title: 'Monthly Revenue',
                          value: '₹${(data['monthlyRevenue'] as double).toStringAsFixed(0)}',
                          icon: Icons.currency_rupee,
                          footer: 'Sales + services',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SectionHeader(
                                title: 'Disease Demand Trend',
                                subtitle: 'Latest disease-linked farmer requests',
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 260,
                                child: LineChart(
                                  LineChartData(
                                    gridData: const FlGridData(show: true),
                                    titlesData: const FlTitlesData(show: true),
                                    borderData: FlBorderData(show: false),
                                    lineBarsData: [
                                      LineChartBarData(
                                        spots: List.generate(
                                          farmers.length,
                                          (index) => FlSpot(index.toDouble(), (index + 1).toDouble() * 2),
                                        ),
                                        isCurved: true,
                                        barWidth: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SectionHeader(
                                title: 'Subscription Status',
                                subtitle: 'Farm Sarthi AI Plus',
                              ),
                              const SizedBox(height: 12),
                              const StatusBadge(label: 'Active'),
                              const SizedBox(height: 12),
                              const ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(Icons.verified_user_outlined),
                                title: Text('Verified Store'),
                                subtitle: Text('Premium features unlocked'),
                              ),
                              const Divider(),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: const Icon(Icons.warning_amber_outlined),
                                title: const Text('Low Stock Alerts'),
                                trailing: StatusBadge(label: '${data['lowStockAlerts']} items'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 18),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionHeader(
                          title: 'Hotspot Summary',
                          subtitle: 'High disease demand by area',
                        ),
                        const SizedBox(height: 14),
                        ...hotspots.map((h) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.location_on_outlined),
                              title: Text('${h.disease} in ${h.area}'),
                              subtitle: Text(
                                'Cases: ${h.count} | Avg confidence: ${h.avgConfidence.toStringAsFixed(1)}% | Avg lesion: ${h.avgLesion.toStringAsFixed(1)}%',
                              ),
                              trailing: const StatusBadge(label: 'Hotspot'),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
