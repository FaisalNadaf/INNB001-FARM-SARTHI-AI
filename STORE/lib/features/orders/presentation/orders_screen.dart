import 'package:flutter/material.dart';

import '../../../core/widgets/app_shell.dart';
import '../../../core/widgets/status_badge.dart';
import '../../common/app_sidebar_items.dart';
import '../../../routes/app_router.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      {'farmer': 'Faisal1', 'source': 'app', 'status': 'new', 'product': 'Tungro Control Mix'},
      {'farmer': 'Shivappa', 'source': 'phone support', 'status': 'packed', 'product': 'Rice Shield Pro'},
      {'farmer': 'Mahadev', 'source': 'walk-in', 'status': 'delivered', 'product': 'GreenBoost NPK'},
    ];

    return AppShell(
      route: AppRoutes.orders,
      title: 'Orders & Leads',
      items: appSidebarItems,
      child: Card(
        child: ListView.separated(
          padding: const EdgeInsets.all(18),
          itemBuilder: (_, index) {
            final order = orders[index];
            return ListTile(
              leading: const CircleAvatar(child: Icon(Icons.shopping_bag_outlined)),
              title: Text('${order['farmer']} • ${order['product']}'),
              subtitle: Text('Lead source: ${order['source']}'),
              trailing: StatusBadge(label: order['status']!),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: orders.length,
        ),
      ),
    );
  }
}
