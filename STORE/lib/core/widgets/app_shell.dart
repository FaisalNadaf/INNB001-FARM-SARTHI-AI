import 'package:flutter/material.dart';

import 'app_sidebar.dart';

class AppShell extends StatelessWidget {
  final String route;
  final String title;
  final Widget child;
  final List<SidebarItem> items;
  final List<Widget>? actions;

  const AppShell({
    super.key,
    required this.route,
    required this.title,
    required this.child,
    required this.items,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AppSidebar(items: items, currentRoute: route),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 76,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(title, style: Theme.of(context).textTheme.headlineMedium),
                      const Spacer(),
                      ...?actions,
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
