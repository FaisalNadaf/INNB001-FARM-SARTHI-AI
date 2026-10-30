import '../models/farmer_model.dart';
import '../models/hotspot_model.dart';
import 'farmer_repository.dart';

class DashboardRepository {
  final FarmerRepository farmerRepository;

  DashboardRepository(this.farmerRepository);

  Future<Map<String, dynamic>> fetchDashboardData() async {
    final farmers = await farmerRepository.fetchFarmers();
    const totalProducts = 126;
    const lowStock = 14;
    const appointmentsToday = 8;
    const monthlyRevenue = 42850.0;

    return {
      'farmers': farmers,
      'activeFarmersCount': farmers.length,
      'appointmentsToday': appointmentsToday,
      'totalProducts': totalProducts,
      'lowStockAlerts': lowStock,
      'monthlyRevenue': monthlyRevenue,
      'hotspots': _buildHotspots(farmers),
    };
  }

  List<HotspotModel> _buildHotspots(List<FarmerModel> farmers) {
    final map = <String, List<FarmerModel>>{};
    for (final farmer in farmers) {
      final key = farmer.latestDisease;
      map.putIfAbsent(key, () => []).add(farmer);
    }
    return map.entries.map((entry) {
      final first = entry.value.first.requests.first;
      return HotspotModel(
        area: first.locationName,
        disease: entry.key,
        count: entry.value.length,
        lat: first.lat,
        lng: first.lng,
        avgConfidence: entry.value.map((e) => e.latestConfidence).fold<double>(0, (a, b) => a + b) / entry.value.length,
        avgLesion: entry.value.map((e) => e.requests.first.lesionPercent).fold<double>(0, (a, b) => a + b) / entry.value.length,
      );
    }).toList();
  }
}
