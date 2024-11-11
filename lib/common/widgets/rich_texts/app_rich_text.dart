import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    required this.onPressed,
    required this.text,
    required this.text1,
  });

  final VoidCallback onPressed;
  final String text, text1;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: AppSizes.fontSizeXs,
              )),
          TextSpan(
              text: text1,
              recognizer: TapGestureRecognizer()..onTap = onPressed,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: AppSizes.fontSizeXs,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}
