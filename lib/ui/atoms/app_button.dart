import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

enum AppButtonVariant { filled, outline, text }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final double borderRadius;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final bool isCompact;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.filled,
    this.borderRadius = 10,
    this.color,
    this.padding,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    // Tentukan style berdasarkan variant
    Color bgColor;
    Color borderColor;
    Color textColor;

    switch (variant) {
      case AppButtonVariant.filled:
        bgColor = onPressed == null
            ? AppColors.disabled
            : (color ?? AppColors.primary);
        borderColor = Colors.transparent;
        textColor = Colors.white;
        break;
      case AppButtonVariant.outline:
        bgColor = onPressed == null
            ? Colors.transparent
            : (color ?? Colors.white);
        borderColor = onPressed == null
            ? AppColors.disabled
            : (color ?? AppColors.primary);
        textColor = onPressed == null
            ? AppColors.disabled
            : (color ?? AppColors.primary);
        break;
      case AppButtonVariant.text:
        bgColor = Colors.transparent;
        borderColor = Colors.transparent;
        textColor = onPressed == null
            ? AppColors.disabled
            : (color ?? AppColors.primary);
        break;
    }

    return SizedBox(
      width: isCompact ? null : double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          padding:
              padding ??
              EdgeInsets.symmetric(
                vertical: isCompact ? 8 : 16,
                horizontal: isCompact ? 12 : 0,
              ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: borderColor,
              width: variant == AppButtonVariant.outline ? 1 : 0,
            ),
          ),
          elevation: variant == AppButtonVariant.text ? 0 : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: isCompact ? 14 : 16,
          ),
        ),
      ),
    );
  }
}
