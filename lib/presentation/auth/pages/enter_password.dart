import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/styles/basic_spacing_style.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_clot/common/widgets/rich_texts/app_rich_text.dart';
import 'package:ecommerce_clot/common/widgets/text_form_fields/text_form_field.dart';
import 'package:ecommerce_clot/common/widgets/title_text/basic_text_title.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/presentation/auth/pages/forgot_password.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatefulWidget {
  const EnterPasswordPage({super.key});

  @override
  State<EnterPasswordPage> createState() => _EnterPasswordPageState();
}

class _EnterPasswordPageState extends State<EnterPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: BasicSpacingStyle.padingAppbarHeight,
        child: Form(
          key: formKey,
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
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return const BasicTextTitle(text: AppStrings.signIn);
  }

  Widget _passwordField(BuildContext context) {
    return BasicTextFormField(
      hintText: AppStrings.password,
      controller: passwordController,
      keyboardKey: TextInputType.text,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Khong duoc bo trong';
        } else {
          return null;
        }
      },
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {}
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
