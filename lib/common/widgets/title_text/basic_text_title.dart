import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class BasicTextTitle extends StatelessWidget {
  const BasicTextTitle({
    super.key,
    required this.text,
    this.fontSize = AppSizes.fontSizeLg,
    this.fontWeight = FontWeight.bold,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );

  }
}
