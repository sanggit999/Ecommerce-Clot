import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecoration = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.whiteLight,
    hintStyle:
        const TextStyle(color: AppColors.gray, fontWeight: FontWeight.w400),
    contentPadding: const EdgeInsets.all(AppSizes.spaceBtwInputField),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
      borderSide: BorderSide.none,
    ),
  );

  static InputDecorationTheme darkInputDecoration = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkLight,
    hintStyle:
        const TextStyle(color: AppColors.gray, fontWeight: FontWeight.w400),
    contentPadding: const EdgeInsets.all(AppSizes.spaceBtwInputField),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
        borderSide: BorderSide.none),
  );
}
