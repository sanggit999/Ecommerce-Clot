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
      borderSide: const BorderSide(
        color: AppColors.darkLight,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
      borderSide: const BorderSide(
        color: AppColors.darkLight,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
      borderSide: const BorderSide(
        color: AppColors.darkLight,
        width: 1.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.5,
      ),
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
      borderSide: const BorderSide(
        color: AppColors.whiteLight,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
      borderSide: const BorderSide(
        color: AppColors.whiteLight,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
      borderSide: const BorderSide(
        color: AppColors.whiteLight,
        width: 1.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.5,
      ),
    ),
  );
}
