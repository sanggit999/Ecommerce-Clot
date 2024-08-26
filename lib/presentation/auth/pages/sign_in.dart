import 'package:ecommerce_clot/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_clot/common/widgets/rich_texts/app_rich_text.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 123),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signInText(context),
            const SizedBox(height: AppSizes.defaultSpace),
            _emailField(context),
            const SizedBox(height: AppSizes.spaceBtwItem),
            _continueButton(),
            const SizedBox(height: AppSizes.spaceBtwItem),
            _createOne(),
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

  Widget _emailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: AppStrings.emailAddress),
    );
  }

  Widget _continueButton() {
    return BasicAppButton(
      onPressed: () {},
      title: AppStrings.appContinue,
    );
  }

  Widget _createOne() {
    return AppRichText(
      onPressed: () {},
      text: AppStrings.dontHaveAnAccount,
      text1: AppStrings.createOne,
    );
  }
}
