import 'package:ecommerce_clot/core/configs/theme/custom_themes/appbar_theme.dart';
import 'package:ecommerce_clot/core/configs/theme/custom_themes/elevate_button_theme.dart';
import 'package:ecommerce_clot/core/configs/theme/custom_themes/text_form_field_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData(
    fontFamily: 'CircularStd',
    colorScheme: const ColorScheme(
      // QUY DINH CHE DO SANG
      brightness: Brightness.light,
      // MAU CHINH UNG DUNG NHU APPBAR, FAB, CAC NUT BAM
      primary: Color(0xff8E6CEF),
      // MAU SAC CHO NOI DUNG VAN BAN, BIEU TUONG TREN NEN (PRIMARY)
      onPrimary: Color(0xffF4F4F4),
      // MAU PHU UNG DUNG
      secondary: Color(0xff272727),
      // MAU SAC CHO NOI DUNG HIEN THI TREN NEN SECONDARY
      onSecondary: Color(0xff272727),
      // MAU HIEN DE THI CAC TRANG THAI LOI
      error: Color(0xffFF0000),
      // MAU SAC HIEN THI TREN NEN ERROR
      onError: Color(0xffFF0000),
      // MAU NEN CAC BE MAT GIAO DIEN NHU THE, HOP THOAI
      surface: Color(0xffFFFFFF),
      // MAU SAC CHO NOI DUNG HIEN THI TREN NEN SURFACE
      onSurface: Color(0xff272727),
    ),
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecoration,
    elevatedButtonTheme: AppElevateButtonTheme.elevateButton,
    appBarTheme: AppAppBarTheme.appBarTheme,
  );

  static final dark = ThemeData(
    fontFamily: 'CircularStd',
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff8E6CEF),
      onPrimary: Color(0xff342F3F),
      secondary: Color(0xffF4F4F4),
      onSecondary: Color(0xffF4F4F4),
      error: Color(0xffFF0000),
      onError: Color(0xffFF0000),
      surface: Color(0xff1D182A),
      onSurface: Color(0xffFFFFFF),
    ),
    inputDecorationTheme: AppTextFormFieldTheme.darkInputDecoration,
    elevatedButtonTheme: AppElevateButtonTheme.elevateButton,
    appBarTheme: AppAppBarTheme.appBarTheme,
  );
}
