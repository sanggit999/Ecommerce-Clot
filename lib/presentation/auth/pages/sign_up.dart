import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/styles/basic_spacing_style.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_clot/common/widgets/rich_texts/app_rich_text.dart';
import 'package:ecommerce_clot/common/widgets/text_form_fields/text_form_field.dart';
import 'package:ecommerce_clot/common/widgets/title_text/basic_text_title.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/presentation/auth/pages/sign_in.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: BasicSpacingStyle.padingAppbarHeight,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signInText(context),
                const SizedBox(height: AppSizes.defaultSpace),
                _firtNameField(context),
                const SizedBox(height: AppSizes.spaceBtwItem),
                _lastNameField(context),
                const SizedBox(height: AppSizes.spaceBtwItem),
                _emailAddressField(context),
                const SizedBox(height: AppSizes.spaceBtwItem),
                _passwordField(context),
                const SizedBox(height: AppSizes.spaceBtwItem),
                _continueButton(context),
                const SizedBox(height: AppSizes.spaceBtwItem),
                _createOne(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return const BasicTextTitle(text: AppStrings.createAccount);
  }

  Widget _firtNameField(BuildContext context) {
    return BasicTextFormField(
      hintText: AppStrings.firstName,
      controller: firstNameController,
      keyboardKey: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Khong duoc bo trong';
        } else {
          return null;
        }
      },
    );
  }

  Widget _lastNameField(BuildContext context) {
    return BasicTextFormField(
      hintText: AppStrings.lastName,
      controller: lastNameController,
      keyboardKey: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Khong duoc bo trong';
        } else {
          return null;
        }
      },
    );
  }

  Widget _emailAddressField(BuildContext context) {
    return BasicTextFormField(
      hintText: AppStrings.emailAddress,
      controller: emailAddressController,
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
        if (formKey.currentState!.validate()) {
         // AppNavigator.push(context, const EnterPasswordPage());
        } else {}
      },
      title: AppStrings.appContinue,
    );
  }

  Widget _createOne() {
    return AppRichText(
      onPressed: () {
        AppNavigator.pushReplacement(context, const SignInPage());
      },
      text: AppStrings.doYouHaveAnAccount,
      text1: AppStrings.signIn,
    );
  }
}
