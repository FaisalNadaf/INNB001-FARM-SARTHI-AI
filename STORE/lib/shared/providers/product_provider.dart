import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';
import '../repositories/product_repository.dart';

final productRepositoryProvider = Provider((ref) => ProductRepository());

final productsProvider = FutureProvider<List<ProductModel>>((ref) async {
  return ref.read(productRepositoryProvider).fetchProducts();
});
