import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_router.dart';
import '../../../shared/providers/auth_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(authProvider.notifier).restoreSession();
      if (!mounted) return;
      final auth = ref.read(authProvider);
      context.go(auth.loggedIn ? AppRoutes.dashboard : AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.storefront, size: 72),
            SizedBox(height: 16),
            Text('Farm Sarthi Store', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
            SizedBox(height: 16),
            SizedBox(width: 240, child: LinearProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
