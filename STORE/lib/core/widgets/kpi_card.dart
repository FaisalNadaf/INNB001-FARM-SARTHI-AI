import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class KpiCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String? footer;
  final Color? color;

  const KpiCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.footer,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.primary;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: c.withOpacity(0.12),
                  child: Icon(icon, color: c),
                ),
                const Spacer(),
                Icon(Icons.trending_up, color: c),
              ],
            ),
            const Spacer(),
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Text(value, style: Theme.of(context).textTheme.headlineMedium),
            if (footer != null) ...[
              const SizedBox(height: 8),
              Text(
                footer!,
                style: TextStyle(
                  color: AppColors.mutedText,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
