import 'farmer_request_model.dart';

class FarmerModel {
  final String id;
  final String name;
  final String phone;
  final String location;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int totalRequests;
  final List<FarmerRequestModel> requests;

  FarmerModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.totalRequests,
    required this.requests,
  });

  String get village => location;
  String get latestDisease => requests.isNotEmpty ? requests.first.prediction : 'No diagnosis';
  String get severityLevel => requests.isNotEmpty ? requests.first.severityLevel : 'unknown';
  double get latestConfidence => requests.isNotEmpty ? requests.first.confidencePercent : 0;
  bool get isNonSmartphone => false;
  String get cropType => requests.isNotEmpty ? (requests.first.cropName ?? 'Rice') : 'Rice';

  factory FarmerModel.fromJson(Map<String, dynamic> json) {
    final requestList = (json['requests'] as List<dynamic>? ?? [])
        .map((e) => FarmerRequestModel.fromJson(e as Map<String, dynamic>))
        .toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return FarmerModel(
      id: json['_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      createdAt: DateTime.tryParse(json['created_at']?['\$date']?.toString() ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at']?['\$date']?.toString() ?? ''),
      totalRequests: (json['total_requests'] as num?)?.toInt() ?? requestList.length,
      requests: requestList,
    );
  }
}
