import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_colors.dart';

class SidebarItem {
  final String label;
  final IconData icon;
  final String route;

  const SidebarItem({
    required this.label,
    required this.icon,
    required this.route,
  });
}

class AppSidebar extends StatelessWidget {
  final List<SidebarItem> items;
  final String currentRoute;

  const AppSidebar({
    super.key,
    required this.items,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      color: AppColors.sidebar,
      child: Column(
        children: [
          const SizedBox(height: 22),
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.storefront)),
            title: Text(
              'Farm Sarthi Store',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              'Agri partner tablet',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final item = items[index];
                final selected = currentRoute == item.route;
                return Material(
                  color: selected ? Colors.white.withOpacity(0.12) : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  child: ListTile(
                    onTap: () => context.go(item.route),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    leading: Icon(item.icon, color: Colors.white),
                    title: Text(
                      item.label,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
