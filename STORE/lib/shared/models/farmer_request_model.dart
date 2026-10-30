class FarmerRequestModel {
  final DateTime timestamp;
  final String prediction;
  final double confidencePercent;
  final String severityLevel;
  final int severityScore;
  final String urgency;
  final String? cropName;
  final String diseaseType;
  final String confidenceBand;
  final double lesionPercent;
  final double weatherRiskScore;
  final String locationName;
  final double lat;
  final double lng;

  FarmerRequestModel({
    required this.timestamp,
    required this.prediction,
    required this.confidencePercent,
    required this.severityLevel,
    required this.severityScore,
    required this.urgency,
    required this.cropName,
    required this.diseaseType,
    required this.confidenceBand,
    required this.lesionPercent,
    required this.weatherRiskScore,
    required this.locationName,
    required this.lat,
    required this.lng,
  });

  factory FarmerRequestModel.fromJson(Map<String, dynamic> json) {
    final diagnostic = (json['diagnostic_summary'] as Map<String, dynamic>?) ?? {};
    final severity = (json['severity'] as Map<String, dynamic>?) ?? {};
    final requestLocation = (json['request_location'] as Map<String, dynamic>?) ?? {};
    final coordinates = (requestLocation['coordinates'] as Map<String, dynamic>?) ?? {};
    final visualAnalysis = (json['visual_analysis'] as Map<String, dynamic>?) ?? {};
    final leafHealth = (visualAnalysis['leaf_health_visuals'] as Map<String, dynamic>?) ?? {};

    return FarmerRequestModel(
      timestamp: DateTime.tryParse(json['timestamp']?['\$date']?.toString() ?? '') ?? DateTime.now(),
      prediction: json['prediction']?.toString() ?? 'Unknown',
      confidencePercent: (json['confidence_percent'] as num?)?.toDouble() ?? 0,
      severityLevel: severity['level']?.toString() ?? 'unknown',
      severityScore: (severity['score'] as num?)?.toInt() ?? 0,
      urgency: severity['urgency']?.toString() ?? 'normal',
      cropName: json['cropName']?.toString() ?? 'Rice',
      diseaseType: diagnostic['disease_type']?.toString() ?? 'unknown',
      confidenceBand: diagnostic['confidence_band']?.toString() ?? 'unknown',
      lesionPercent: (leafHealth['estimated_lesion_percent'] as num?)?.toDouble() ?? 0,
      weatherRiskScore: (json['weather_risk']?['score'] as num?)?.toDouble() ?? 0,
      locationName: json['weather']?['location_name']?.toString() ?? 'Unknown',
      lat: (coordinates['lat'] as num?)?.toDouble() ?? 0,
      lng: (coordinates['lon'] as num?)?.toDouble() ?? 0,
    );
  }
}
