import 'package:flutter_riverpod/flutter_riverpod.dart';

final supportCallsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  return [
    {
      'farmerName': 'Shivappa',
      'phone': '9999990001',
      'village': 'Kakati',
      'crop': 'Rice',
      'symptoms': 'Yellowing and stunted leaves',
      'status': 'phone consultation completed',
    },
    {
      'farmerName': 'Basavaraj',
      'phone': '9999990002',
      'village': 'Belagavi Rural',
      'crop': 'Rice',
      'symptoms': 'Patchy lesion spread',
      'status': 'farm visit scheduled',
    },
  ];
});
