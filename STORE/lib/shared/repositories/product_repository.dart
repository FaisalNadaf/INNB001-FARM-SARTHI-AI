import '../models/product_model.dart';

class ProductRepository {
  Future<List<ProductModel>> fetchProducts() async {
    return _demoProducts.map(ProductModel.fromJson).toList();
  }
}

final List<Map<String, dynamic>> _demoProducts = [
  {
    "_id": "p1",
    "name": "Rice Shield Pro",
    "brand": "AgriCare",
    "category": "fungicides",
    "mrp": 850,
    "sellingPrice": 799,
    "stock": 24,
    "unit": "500 ml",
    "expiryDate": "2027-12-31",
    "diseaseTags": ["Sheath_blight", "Leaf_blast"],
    "cropTags": ["Rice"]
  },
  {
    "_id": "p2",
    "name": "Tungro Control Mix",
    "brand": "FarmX",
    "category": "pesticides",
    "mrp": 620,
    "sellingPrice": 575,
    "stock": 8,
    "unit": "250 ml",
    "expiryDate": "2027-08-11",
    "diseaseTags": ["Tungro"],
    "cropTags": ["Rice"]
  },
  {
    "_id": "p3",
    "name": "GreenBoost NPK",
    "brand": "GrowMax",
    "category": "fertilizers",
    "mrp": 1200,
    "sellingPrice": 1110,
    "stock": 46,
    "unit": "25 kg",
    "expiryDate": "2028-01-01",
    "diseaseTags": [],
    "cropTags": ["Rice", "Sugarcane"]
  }
];
