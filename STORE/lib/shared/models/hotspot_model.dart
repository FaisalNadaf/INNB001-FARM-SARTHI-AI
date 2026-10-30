class HotspotModel {
  final String area;
  final String disease;
  final int count;
  final double lat;
  final double lng;
  final double avgConfidence;
  final double avgLesion;

  HotspotModel({
    required this.area,
    required this.disease,
    required this.count,
    required this.lat,
    required this.lng,
    required this.avgConfidence,
    required this.avgLesion,
  });
}
