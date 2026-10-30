class SubscriptionModel {
  final String planName;
  final int durationDays;
  final String paymentStatus;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;

  SubscriptionModel({
    required this.planName,
    required this.durationDays,
    required this.paymentStatus,
    required this.startDate,
    required this.endDate,
    required this.isActive,
  });
}
