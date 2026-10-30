class AppointmentModel {
  final String id;
  final String farmerName;
  final String serviceType;
  final String status;
  final DateTime scheduledAt;
  final String source;

  AppointmentModel({
    required this.id,
    required this.farmerName,
    required this.serviceType,
    required this.status,
    required this.scheduledAt,
    required this.source,
  });
}
