import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/styles/basic_spacing_style.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_clot/common/widgets/rich_texts/app_rich_text.dart';
import 'package:ecommerce_clot/common/widgets/text_form_fields/text_form_field.dart';
import 'package:ecommerce_clot/common/widgets/title_text/basic_text_title.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/data/auth/models/user_signup_req.dart';
import 'package:ecommerce_clot/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/validate_cubit.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/validate_state.dart';
import 'package:ecommerce_clot/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:ecommerce_clot/presentation/auth/pages/sign_in.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _emailAddressController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                      _firstNameField(context),
                      const SizedBox(height: AppSizes.spaceBtwItem),
                      _lastNameField(context),
                      const SizedBox(height: AppSizes.spaceBtwItem),
                      _emailAddressField(context),
                      const SizedBox(height: AppSizes.spaceBtwItem),
                      _passwordField(context),
                      const SizedBox(height: AppSizes.spaceBtwItem),
                      _continueButton(context),
                      const SizedBox(height: AppSizes.spaceBtwItem),
                      _createOne(context),
                    ],
                  );
                },
              ),
            )));
  }

  Widget _signInText(BuildContext context) {
    return const BasicTextTitle(text: AppStrings.createAccount);
  }

  Widget _firstNameField(BuildContext context) {
    return BasicTextFormField(
      hintText: AppStrings.firstName,
      controller: _firstNameController,
      keyboardKey: TextInputType.text,
      validator: (value) {
        context.read<ValidateCubit>().validateFirstName(value);
        return context.read<ValidateCubit>().state.messageFirstName;
      },
    );
  }

  Widget _lastNameField(BuildContext context) {
    return BasicTextFormField(
      hintText: AppStrings.lastName,
      controller: _lastNameController,
      keyboardKey: TextInputType.text,
      validator: (value) {
        context.read<ValidateCubit>().validateLastName(value);
        return context.read<ValidateCubit>().state.messageLastName;
      },
    );
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
    return BasicAppButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          final emailExist = await serviceLocator<AuthRepository>()
              .isEmailExists(_emailAddressController.text);
          if (context.mounted) {
            if (emailExist) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(AppStrings.emailExists),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            } else {
              AppNavigator.push(
                context,
                GenderAndAgeSelectionPage(
                  userSignupReq: UserSignupReq(
                    firtName: _firstNameController.text.trim(),
                    lastName: _lastNameController.text.trim(),
                    emailAddress: _emailAddressController.text.trim(),
                    password: _passwordController.text.trim(),
                  ),
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
        AppNavigator.pushReplacement(context, SignInPage());
      },
      text: AppStrings.doYouHaveAnAccount,
      text1: AppStrings.signIn,
    );
  }
}
