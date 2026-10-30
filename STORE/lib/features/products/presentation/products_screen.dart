import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/app_shell.dart';
import '../../../core/widgets/loading_state.dart';
import '../../../core/widgets/status_badge.dart';
import '../../../shared/providers/product_provider.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return AppShell(
      route: AppRoutes.products,
      title: 'Product Management',
      items: appSidebarItems,
      child: products.when(
        loading: () => const LoadingState(message: 'Loading products...'),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (data) => Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search products, brand, category or disease tag',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add Product'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (_, index) {
                  final p = data[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(child: Icon(Icons.inventory)),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  p.name,
                                  style: Theme.of(context).textTheme.titleMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (p.stock < 10) const StatusBadge(label: 'Low Stock'),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Text('${p.brand} • ${p.category}'),
                          const Spacer(),
                          Text('MRP ₹${p.mrp.toStringAsFixed(0)}'),
                          Text('Sell ₹${p.sellingPrice.toStringAsFixed(0)}'),
                          Text('Stock ${p.stock} ${p.unit}'),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            children: p.diseaseTags.take(2).map((e) => StatusBadge(label: e)).toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
