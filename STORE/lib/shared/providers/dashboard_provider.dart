import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/dashboard_repository.dart';
import '../repositories/farmer_repository.dart';

final dashboardRepositoryProvider = Provider((ref) {
  return DashboardRepository(ref.read(farmerRepositoryProvider));
});

final dashboardProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  return ref.read(dashboardRepositoryProvider).fetchDashboardData();
});
