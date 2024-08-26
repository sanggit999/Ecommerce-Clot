import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppElevateButtonTheme {
  AppElevateButtonTheme._();

  static ElevatedButtonThemeData elevateButton = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    elevation: 0,
    textStyle: const TextStyle(
      fontSize: AppSizes.fontSizeSm,
      fontWeight: FontWeight.w400,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  ));
}
