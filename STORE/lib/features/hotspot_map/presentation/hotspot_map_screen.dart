import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/widgets/app_shell.dart';
import '../../../core/widgets/loading_state.dart';
import '../../../shared/providers/dashboard_provider.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class HotspotMapScreen extends ConsumerWidget {
  const HotspotMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);

    return AppShell(
      route: AppRoutes.hotspotMap,
      title: 'Disease Hotspot Map',
      items: appSidebarItems,
      child: dashboard.when(
        loading: () => const LoadingState(message: 'Loading hotspot regions...'),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (data) {
          final hotspots = data['hotspots'] as List<dynamic>;
          return Row(
            children: [
              Expanded(
                flex: 3,
                child: Card(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'Google Map placeholder Integrate google_maps_flutter markers + heatmap here',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 16,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: const [
                                SizedBox(
                                  width: 240,
                                  child: TextField(decoration: InputDecoration(labelText: 'Filter by disease')),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  width: 240,
                                  child: TextField(decoration: InputDecoration(labelText: 'Filter by village')),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Card(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(18),
                    itemCount: hotspots.length,
                    itemBuilder: (_, index) {
                      final h = hotspots[index];
                      return Card(
                        child: ListTile(
                          title: Text('${h.disease} • ${h.area}'),
                          subtitle: Text(
                            'Cases ${h.count} | Avg confidence ${h.avgConfidence.toStringAsFixed(1)}%',
                          ),
                          trailing: Text('${h.lat.toStringAsFixed(3)}, ${h.lng.toStringAsFixed(3)}'),
                        ),
                      );
                    },
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
