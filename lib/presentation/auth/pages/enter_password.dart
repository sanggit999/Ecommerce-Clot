import 'package:ecommerce_clot/common/cubit/button/button_cubit.dart';
import 'package:ecommerce_clot/common/cubit/button/button_state.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ecommerce_clot/domain/auth/usecase/signin.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/validate_state.dart';
import 'package:ecommerce_clot/presentation/home/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/styles/basic_spacing_style.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/rich_texts/app_rich_text.dart';
import 'package:ecommerce_clot/common/widgets/text_form_fields/text_form_field.dart';
import 'package:ecommerce_clot/common/widgets/title_text/basic_text_title.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/validate_cubit.dart';
import 'package:ecommerce_clot/presentation/auth/pages/forgot_password.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninReq userSigninReq;

  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();

  EnterPasswordPage({
    super.key,
    required this.userSigninReq,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: BasicSpacingStyle.padingAppbarHeight,
        child: Form(
          key: _formKey,
          child: BlocBuilder<ValidateCubit, ValidateState>(
              builder: (context, state) {
            return BlocListener<ButtonCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
                if (state is ButtonSuccess) {
                  AppNavigator.pushAndRemoveUntil(context, const HomePage());
                }
              },
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
            );
          }),
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
      controller: _passwordController,
      keyboardKey: TextInputType.text,
      obscureText: true,
      validator: (value) {
        context.read<ValidateCubit>().validatePassword(value);
        return context.read<ValidateCubit>().state.messagePassword;
      },
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicReactiveButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          userSigninReq.password = _passwordController.text;
          context
              .read<ButtonCubit>()
              .execute(useCase: SignInUseCase(), params: userSigninReq);
        }
      },
      title: AppStrings.appContinue,
    );
  }

  Widget _resetPassword(BuildContext context) {
    return AppRichText(
      onPressed: () {
        AppNavigator.push(context, ForgotPasswordPage());
      },
      text: AppStrings.forgotPassword,
      text1: AppStrings.reset,
    );
  }
}
