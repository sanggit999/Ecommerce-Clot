import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/styles/basic_spacing_style.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_clot/common/widgets/rich_texts/app_rich_text.dart';
import 'package:ecommerce_clot/common/widgets/text_form_fields/text_form_field.dart';
import 'package:ecommerce_clot/common/widgets/title_text/text_title.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_clot/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/validate_cubit.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/validate_state.dart';
import 'package:ecommerce_clot/presentation/auth/pages/enter_password.dart';
import 'package:ecommerce_clot/presentation/auth/pages/sign_up.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final _emailAddressController = TextEditingController();

  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        final now = DateTime.now();
        const backPressDuration = Duration(seconds: 2);
        if (lastPressed == null ||
            now.difference(lastPressed!) > backPressDuration) {
          lastPressed = now;

          // HIEN THI THONG BAO CLICK LAN 1


          return; // CHUA THOAT UNG DUNG
        }

        SystemNavigator.pop();
      },
      child: Scaffold(
        appBar: const BasicAppbar(hideBack: true),
        body: Padding(
            padding: BasicSpacingStyle.padingAppbarHeight,
            child: Form(
              key: _formKey,
              child: BlocBuilder<ValidateCubit, ValidateState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _signInText(context),
                      const SizedBox(height: AppSizes.defaultSpace),
                      _emailAddressField(context),
                      const SizedBox(height: AppSizes.spaceBtwItem),
                      _continueButton(context),
                      const SizedBox(height: AppSizes.spaceBtwItem),
                      _createOne(context),
                    ],
                  );
                },
              ),
            )),
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return const BasicTextTitle(text: AppStrings.signIn);
  }

  Widget _emailAddressField(BuildContext context) {
    return BasicTextFormField(
      hintText: AppStrings.emailAddress,
      controller: _emailAddressController,
      keyboardKey: TextInputType.emailAddress,
      validator: (value) {
        context.read<ValidateCubit>().validateEmail(value!);
        return context.read<ValidateCubit>().state.messageEmail;
      },
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          final emailExist = await serviceLocator<AuthRepository>()
              .isEmailExists(_emailAddressController.text);
          if (context.mounted) {
            if (!emailExist) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(AppStrings.emailNotExists),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            } else {
              AppNavigator.push(
                context,
                EnterPasswordPage(
                  userSigninReq:
                      UserSigninReq(emailAddress: _emailAddressController.text),
                ),
              );
            }
          }
        }
      },
      title: AppStrings.appContinue,
    );
  }

  Widget _createOne(BuildContext context) {
    return AppRichText(
      onPressed: () {
        AppNavigator.push(context, SignUpPage());
      },
      text: AppStrings.dontHaveAnAccount,
      text1: AppStrings.createOne,
    );
  }
}
