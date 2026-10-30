class StoreModel {
  final String storeId;
  final String ownerName;
  final String storeName;
  final bool isVerified;
  final String verificationStatus;
  final String subscriptionStatus;

  StoreModel({
    required this.storeId,
    required this.ownerName,
    required this.storeName,
    required this.isVerified,
    required this.verificationStatus,
    required this.subscriptionStatus,
  });
}
