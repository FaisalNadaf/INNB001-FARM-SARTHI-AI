import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dashboard_provider.dart';

final diseaseDistributionProvider = FutureProvider<Map<String, int>>((ref) async {
  final dashboard = await ref.watch(dashboardProvider.future);
  final farmers = dashboard['farmers'] as List<dynamic>;
  final result = <String, int>{};

  for (final farmer in farmers) {
    final disease = farmer.latestDisease.toString();
    result[disease] = (result[disease] ?? 0) + 1;
  }
  return result;
});
