import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/styles/basic_spacing_style.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_clot/common/widgets/title_text/basic_text_title.dart';
import 'package:ecommerce_clot/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/presentation/auth/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: BasicSpacingStyle.padingAppbarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _iconEmailSending(),
            const SizedBox(height: AppSizes.spaceBtwItem),
            _textEmailSending(),
            const SizedBox(height: AppSizes.spaceBtwItem),
            _returnToLoginButton(context)
          ],
        ),
      ),
    );
  }

  Widget _iconEmailSending() {
    return Center(
      child: SvgPicture.asset(AppVectors.emailSending),
    );
  }

  Widget _textEmailSending() {
    return const Center(
      child: BasicTextTitle(
        text: AppStrings.passwordResetEmailSent,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _returnToLoginButton(BuildContext context) {
    return Center(
      child: BasicAppButton(
        width: 200,
        onPressed: () {
          AppNavigator.pushAndRemoveUntil(context, SignInPage());
        },
        title: AppStrings.returnToLogin,
      ),
    );
  }
}
