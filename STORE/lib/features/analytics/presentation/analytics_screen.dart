import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/app_shell.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final revenue = [12, 18, 15, 20, 28, 34, 31];

    return AppShell(
      route: AppRoutes.analytics,
      title: 'Revenue & Earnings Analytics',
      items: appSidebarItems,
      child: Row(
        children: [
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Weekly Revenue Trend', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 20),
                    Expanded(
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          barGroups: List.generate(
                            revenue.length,
                            (i) => BarChartGroupData(
                              x: i,
                              barRods: [BarChartRodData(toY: revenue[i].toDouble(), width: 24)],
                            ),
                          ),
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
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Top Income Channels', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 12),
                    const ListTile(title: Text('Product Sales'), trailing: Text('₹21,000')),
                    const ListTile(title: Text('Farm Visits'), trailing: Text('₹8,400')),
                    const ListTile(title: Text('Scheme Assistance'), trailing: Text('₹2,450')),
                    const ListTile(title: Text('Phone Support Conversions'), trailing: Text('₹5,600')),
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
