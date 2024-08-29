import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
  });

  final VoidCallback onPressed;
  final double? height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: AppSizes.fontSizeSm,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}