import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/farmer_model.dart';
import '../repositories/farmer_repository.dart';

final farmerRepositoryProvider = Provider((ref) => FarmerRepository());

final farmersProvider = FutureProvider<List<FarmerModel>>((ref) async {
  return ref.read(farmerRepositoryProvider).fetchFarmers();
});
