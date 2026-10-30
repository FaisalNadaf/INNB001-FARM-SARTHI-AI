import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_client.dart';
import '../models/farmer_model.dart';

final farmerRepositoryProvider = Provider<FarmerRepository>((ref) {
  return FarmerRepository();
});

class FarmerRepository {
  final Dio _dio = DioClient.instance;

  Future<List<FarmerModel>> fetchFarmers() async {
    try {
      final res = await _dio.get('/farmers');
      final list = (res.data['data'] as List<dynamic>? ?? []);
      return list.map((e) => FarmerModel.fromJson(e)).toList();
    } catch (_) {
      return _demoFarmers.map(FarmerModel.fromJson).toList();
    }
  }
}

final List<Map<String, dynamic>> _demoFarmers = [
  {
    "_id": "1234567890",
    "created_at": {"\$date": "2026-03-17T18:48:22.073Z"},
    "location": "Lat: 15.863254, Lng: 74.517476",
    "name": "faisal1",
    "phone": "1234567890",
    "requests": [
      {
        "timestamp": {"\$date": "2026-03-17T18:49:06.253Z"},
        "prediction": "Tungro",
        "confidence_percent": 97.07,
        "severity": {"score": 100, "level": "critical", "urgency": "immediate"},
        "weather_risk": {"score": 22},
        "visual_analysis": {
          "leaf_health_visuals": {"estimated_lesion_percent": 36.14}
        },
        "weather": {"location_name": "Belgaum"},
        "request_location": {
          "coordinates": {"lat": 15.863254, "lon": 74.517476}
        },
        "diagnostic_summary": {
          "disease_type": "viral",
          "confidence_band": "very_high"
        }
      },
      {
        "timestamp": {"\$date": "2026-03-17T18:48:22.073Z"},
        "prediction": "Sheath_blight",
        "confidence_percent": 63.24,
        "severity": {"score": 100, "level": "critical", "urgency": "immediate"},
        "weather_risk": {"score": 32},
        "visual_analysis": {
          "leaf_health_visuals": {"estimated_lesion_percent": 31.28}
        },
        "weather": {"location_name": "Belgaum"},
        "request_location": {
          "coordinates": {"lat": 15.863254, "lon": 74.517476}
        },
        "diagnostic_summary": {
          "disease_type": "fungal_or_leaf_damage",
          "confidence_band": "medium"
        }
      }
    ],
    "total_requests": 2,
    "updated_at": {"\$date": "2026-03-17T18:49:06.253Z"}
  }
];