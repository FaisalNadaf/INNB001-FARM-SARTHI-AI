import 'package:flutter/material.dart';

import '../../core/widgets/app_sidebar.dart';
import '../../routes/app_router.dart';

const appSidebarItems = <SidebarItem>[
  SidebarItem(label: 'Dashboard', icon: Icons.dashboard_outlined, route: AppRoutes.dashboard),
  SidebarItem(label: 'Subscription', icon: Icons.workspace_premium_outlined, route: AppRoutes.subscription),
  SidebarItem(label: 'Farmers', icon: Icons.people_outline, route: AppRoutes.farmers),
  SidebarItem(label: 'Disease Insights', icon: Icons.biotech_outlined, route: AppRoutes.diseaseInsights),
  SidebarItem(label: 'Hotspot Map', icon: Icons.map_outlined, route: AppRoutes.hotspotMap),
  SidebarItem(label: 'Products', icon: Icons.inventory_2_outlined, route: AppRoutes.products),
  SidebarItem(label: 'Inventory', icon: Icons.warehouse_outlined, route: AppRoutes.inventory),
  SidebarItem(label: 'Orders', icon: Icons.shopping_bag_outlined, route: AppRoutes.orders),
  SidebarItem(label: 'Appointments', icon: Icons.event_note_outlined, route: AppRoutes.appointments),
  SidebarItem(label: 'Support Calls', icon: Icons.support_agent_outlined, route: AppRoutes.supportCalls),
  SidebarItem(label: 'Schemes', icon: Icons.account_balance_outlined, route: AppRoutes.schemes),
  SidebarItem(label: 'Analytics', icon: Icons.query_stats_outlined, route: AppRoutes.analytics),
  SidebarItem(label: 'Notifications', icon: Icons.notifications_none_outlined, route: AppRoutes.notifications),
  SidebarItem(label: 'Reports', icon: Icons.file_download_outlined, route: AppRoutes.reports),
  SidebarItem(label: 'Settings', icon: Icons.settings_outlined, route: AppRoutes.settings),
];
