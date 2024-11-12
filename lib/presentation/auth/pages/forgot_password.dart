import 'package:ecommerce_clot/common/cubit/button/button_cubit.dart';
import 'package:ecommerce_clot/common/cubit/button/button_state.dart';
import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/styles/basic_spacing_style.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ecommerce_clot/common/widgets/text_form_fields/text_form_field.dart';
import 'package:ecommerce_clot/common/widgets/title_text/basic_text_title.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/auth/usecase/send_password_reset_email.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/validate_cubit.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/validate_state.dart';
import 'package:ecommerce_clot/presentation/auth/pages/password_reset_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final _emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocBuilder<ValidateCubit, ValidateState>(
        builder: (context, state) {
          return BlocListener<ButtonCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonSuccess) {
                AppNavigator.push(context, const PasswordResetEmailPage());
              }
            },
            child: Padding(
              padding: BasicSpacingStyle.padingAppbarHeight,
              child: Form(
                key: _formKey,
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
        },
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return const BasicTextTitle(text: AppStrings.titleForgotPassword);
  }

  Widget _emailAddressField(BuildContext context) {
    return BasicTextFormField(
      hintText: AppStrings.enterEmailAddress,
      controller: _emailAddressController,
      keyboardKey: TextInputType.emailAddress,
      // validator: (emailAddress) {
      //   context.read<ValidateCubit>().validateEmail(emailAddress!, true);
      //   return context.read<ValidateCubit>().state.messageEmail;
      // },
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicReactiveButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {}
        context.read<ButtonCubit>().execute(
              useCase: SendPasswordResetEmailUseCase(),
              params: _emailAddressController.text.trim(),
            );
      },
      title: AppStrings.appContinue,
    );
  }
}
