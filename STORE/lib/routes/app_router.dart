import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/analytics/presentation/analytics_screen.dart';
import '../features/appointments/presentation/appointments_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/dashboard/presentation/dashboard_screen.dart';
import '../features/disease_insights/presentation/disease_insights_screen.dart';
import '../features/farmers/presentation/farmers_screen.dart';
import '../features/hotspot_map/presentation/hotspot_map_screen.dart';
import '../features/inventory/presentation/inventory_screen.dart';
import '../features/notifications/presentation/notifications_screen.dart';
import '../features/orders/presentation/orders_screen.dart';
import '../features/products/presentation/products_screen.dart';
import '../features/reports/presentation/reports_screen.dart';
import '../features/schemes/presentation/schemes_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../features/splash/presentation/splash_screen.dart';
import '../features/subscription/presentation/subscription_screen.dart';
import '../features/support_calls/presentation/support_calls_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const subscription = '/subscription';
  static const farmers = '/farmers';
  static const diseaseInsights = '/disease-insights';
  static const hotspotMap = '/hotspot-map';
  static const products = '/products';
  static const inventory = '/inventory';
  static const orders = '/orders';
  static const appointments = '/appointments';
  static const supportCalls = '/support-calls';
  static const schemes = '/schemes';
  static const analytics = '/analytics';
  static const notifications = '/notifications';
  static const reports = '/reports';
  static const settings = '/settings';
}

final appRouter = GoRouter(
  routes: [
    GoRoute(path: AppRoutes.splash, builder: (_, __) => const SplashScreen()),
    GoRoute(path: AppRoutes.login, builder: (_, __) => const LoginScreen()),
    GoRoute(path: AppRoutes.dashboard, builder: (_, __) => const DashboardScreen()),
    GoRoute(path: AppRoutes.subscription, builder: (_, __) => const SubscriptionScreen()),
    GoRoute(path: AppRoutes.farmers, builder: (_, __) => const FarmersScreen()),
    GoRoute(path: AppRoutes.diseaseInsights, builder: (_, __) => const DiseaseInsightsScreen()),
    GoRoute(path: AppRoutes.hotspotMap, builder: (_, __) => const HotspotMapScreen()),
    GoRoute(path: AppRoutes.products, builder: (_, __) => const ProductsScreen()),
    GoRoute(path: AppRoutes.inventory, builder: (_, __) => const InventoryScreen()),
    GoRoute(path: AppRoutes.orders, builder: (_, __) => const OrdersScreen()),
    GoRoute(path: AppRoutes.appointments, builder: (_, __) => const AppointmentsScreen()),
    GoRoute(path: AppRoutes.supportCalls, builder: (_, __) => const SupportCallsScreen()),
    GoRoute(path: AppRoutes.schemes, builder: (_, __) => const SchemesScreen()),
    GoRoute(path: AppRoutes.analytics, builder: (_, __) => const AnalyticsScreen()),
    GoRoute(path: AppRoutes.notifications, builder: (_, __) => const NotificationsScreen()),
    GoRoute(path: AppRoutes.reports, builder: (_, __) => const ReportsScreen()),
    GoRoute(path: AppRoutes.settings, builder: (_, __) => const SettingsScreen()),
  ],
  errorBuilder: (_, __) => const Scaffold(body: Center(child: Text('Route not found'))),
);
