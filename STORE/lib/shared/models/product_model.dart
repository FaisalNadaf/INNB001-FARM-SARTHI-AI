class ProductModel {
  final String id;
  final String name;
  final String brand;
  final String category;
  final double mrp;
  final double sellingPrice;
  final int stock;
  final String unit;
  final String expiryDate;
  final List<String> diseaseTags;
  final List<String> cropTags;

  ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.mrp,
    required this.sellingPrice,
    required this.stock,
    required this.unit,
    required this.expiryDate,
    required this.diseaseTags,
    required this.cropTags,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      brand: json['brand']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      mrp: (json['mrp'] as num?)?.toDouble() ?? 0,
      sellingPrice: (json['sellingPrice'] as num?)?.toDouble() ?? 0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      unit: json['unit']?.toString() ?? '',
      expiryDate: json['expiryDate']?.toString() ?? '',
      diseaseTags: List<String>.from(json['diseaseTags'] ?? const []),
      cropTags: List<String>.from(json['cropTags'] ?? const []),
    );
  }
}
