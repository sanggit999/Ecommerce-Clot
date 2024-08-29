import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_clot/common/widgets/text_form_fields/text_form_field.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final forgotPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 27,
          vertical: 40,
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _signInText(context),
              const SizedBox(height: AppSizes.defaultSpace),
              _emailAddressField(context),
              const SizedBox(height: AppSizes.spaceBtwItem),
              _continueButton(context),
              const SizedBox(height: AppSizes.spaceBtwItem),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return const Text(
      AppStrings.headerForgotPassword,
      style: TextStyle(
        fontSize: AppSizes.fontSizeLg,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailAddressField(BuildContext context) {
    return BasicTextFormField(
      hintText: AppStrings.enterEmailAddress,
      controller: forgotPasswordController,
      keyboardKey: TextInputType.emailAddress,
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
}
