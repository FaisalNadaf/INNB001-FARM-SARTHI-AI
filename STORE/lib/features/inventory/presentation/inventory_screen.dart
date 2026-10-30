import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/app_shell.dart';
import '../../../shared/providers/product_provider.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class InventoryScreen extends ConsumerWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return AppShell(
      route: AppRoutes.inventory,
      title: 'Inventory',
      items: appSidebarItems,
      child: products.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (items) {
          final lowStock = items.where((e) => e.stock < 10).toList();
          return Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Stock Overview', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 16),
                        Text('Total SKUs: ${items.length}'),
                        Text('Low stock alerts: ${lowStock.length}'),
                        Text(
                          'Inventory valuation: ₹${items.fold<double>(0, (a, b) => a + (b.sellingPrice * b.stock)).toStringAsFixed(0)}',
                        ),
                        const Divider(height: 28),
                        Expanded(
                          child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (_, i) {
                              final p = items[i];
                              return ListTile(
                                leading: const Icon(Icons.inventory_2_outlined),
                                title: Text(p.name),
                                subtitle: Text('${p.category} • ${p.unit}'),
                                trailing: Text('Stock ${p.stock}'),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Reorder Suggestions', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                            itemCount: lowStock.length,
                            itemBuilder: (_, i) {
                              final p = lowStock[i];
                              return Card(
                                child: ListTile(
                                  title: Text(p.name),
                                  subtitle: Text('Disease demand linked to ${p.diseaseTags.join(', ')}'),
                                  trailing: FilledButton(
                                    onPressed: () {},
                                    child: const Text('Reorder'),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
