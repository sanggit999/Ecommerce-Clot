import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_clot/common/widgets/rich_texts/app_rich_text.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/presentation/auth/pages/forgot_password.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

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
            _passwordField(context),
            const SizedBox(height: AppSizes.spaceBtwItem),
            _continueButton(context),
            const SizedBox(height: AppSizes.spaceBtwItem),
            _resetPassword(context),
          ],
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return const Text(
      AppStrings.signIn,
      style:
          TextStyle(fontSize: AppSizes.fontSizeLg, fontWeight: FontWeight.bold),
    );
  }

  Widget _passwordField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: AppStrings.password),
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

  Widget _resetPassword(BuildContext context) {
    return AppRichText(
      onPressed: () {
        AppNavigator.push(context, const ForgotPasswordPage());
      },
      text: AppStrings.forgotPassword,
      text1: AppStrings.reset,
    );
  }
}
