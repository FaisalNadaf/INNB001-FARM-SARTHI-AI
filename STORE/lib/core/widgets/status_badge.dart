import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class StatusBadge extends StatelessWidget {
  final String label;
  final Color? color;

  const StatusBadge({
    super.key,
    required this.label,
    this.color,
  });

  Color _resolveColor() {
    final lower = label.toLowerCase();
    if (color != null) return color!;
    if (lower.contains('active') || lower.contains('approved')) return AppColors.success;
    if (lower.contains('pending') || lower.contains('expiring') || lower.contains('warning')) return AppColors.warning;
    if (lower.contains('expired') || lower.contains('cancelled') || lower.contains('critical') || lower.contains('alert')) {
      return AppColors.danger;
    }
    return AppColors.info;
  }

  @override
  Widget build(BuildContext context) {
    final c = _resolveColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: c.withOpacity(0.10),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: c,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}
