import 'package:flutter/material.dart';

import '../theme/colors.dart';

class AppButton extends StatelessWidget {
  final Widget label;
  final Widget? icon;
  final VoidCallback? onPressed;

  const AppButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          elevation: 0,
          backgroundColor:
              isDark ? AppColors.colorPrimaryDark : AppColors.colorPrimary,
          foregroundColor:
              isDark ? AppColors.colorTextDark : AppColors.colorTextLight,
          iconAlignment: IconAlignment.end,
          iconColor:
              isDark ? AppColors.colorTextDark : AppColors.colorTextLight,
        ),
        onPressed: onPressed,
        icon: icon,
        label: label,
      ),
    );
  }
}
