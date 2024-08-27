import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 27,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signInText(context),
            const SizedBox(height: AppSizes.defaultSpace),
            _emailField(context),
            const SizedBox(height: AppSizes.spaceBtwItem),
            _continueButton(context),
            const SizedBox(height: AppSizes.spaceBtwItem),
          ],
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return const Text(
      AppStrings.headerForgotPassword,
      style:
          TextStyle(fontSize: AppSizes.fontSizeLg, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: AppStrings.enterEmailAddress),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        // AppNavigator.pushReplacement(context, widget)
      },
      title: AppStrings.appContinue,
    );
  }
}
