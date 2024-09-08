import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/styles/basic_spacing_style.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_clot/common/widgets/rich_texts/app_rich_text.dart';
import 'package:ecommerce_clot/common/widgets/text_form_fields/text_form_field.dart';
import 'package:ecommerce_clot/common/widgets/title_text/basic_text_title.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:ecommerce_clot/presentation/auth/pages/password_reset_email.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
      body: Padding(
        padding: BasicSpacingStyle.padingAppbarHeight,
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
              _createOne(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return const BasicTextTitle(text: AppStrings.signIn);
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

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          AppNavigator.push(context, const GenderAndAgeSelectionPage());
          // AppNavigator.push(context, const PasswordResetEmailPage());
        } else {}
      },
      title: AppStrings.appContinue,
    );
  }

  Widget _createOne() {
    return AppRichText(
      onPressed: () {
        //AppNavigator.push(context, const GenderAndAgeSelectionPage());
      },
      text: AppStrings.dontHaveAnAccount,
      text1: AppStrings.createOne,
    );
  }
}
