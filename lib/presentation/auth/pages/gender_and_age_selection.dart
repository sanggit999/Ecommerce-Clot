import 'package:ecommerce_clot/common/bloc/button/button_cubit.dart';
import 'package:ecommerce_clot/common/bloc/button/button_state.dart';
import 'package:ecommerce_clot/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/styles/basic_spacing_style.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ecommerce_clot/common/widgets/title_text/basic_text_title.dart';
import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/data/auth/models/user_signup_req.dart';
import 'package:ecommerce_clot/domain/auth/usecase/signup.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/ages_display_cubit.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/age_selection_cubit.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/gender_selection_cubit.dart';
import 'package:ecommerce_clot/presentation/auth/pages/sign_in.dart';
import 'package:ecommerce_clot/presentation/auth/widgets/ages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  final UserSignupReq userSignupReq;

  const GenderAndAgeSelectionPage({
    super.key,
    required this.userSignupReq,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const BasicAppbar(),
      body: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonSuccess) {
            AppNavigator.pushAndRemoveUntil(context, SignInPage());
          }
        },
        child: Column(
          children: [
            Padding(
              padding: BasicSpacingStyle.padingAppbarHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _tellUs(),
                  const SizedBox(height: AppSizes.defaultSpace),
                  _whoShop(),
                  const SizedBox(height: AppSizes.spaceBtwItem),
                  _gender(context),
                  const SizedBox(height: AppSizes.defaultSpace + 10),
                  _howOld(),
                  const SizedBox(height: AppSizes.spaceBtwItem),
                  _age(context)
                ],
              ),
            ),
            const Spacer(),
            _finishButton(context),
          ],
        ),
      ),
    );
  }

  Widget _tellUs() {
    return const BasicTextTitle(text: AppStrings.tellUsAboutYourself);
  }

  Widget _whoShop() {
    return const BasicTextTitle(
      text: AppStrings.whoDoYouShopFor,
      fontSize: AppSizes.fontSizeSm,
      fontWeight: FontWeight.w400,
    );
  }

  Widget _gender(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _genderTitle(context, 1, AppStrings.men),
            const SizedBox(width: 20),
            _genderTitle(context, 2, AppStrings.women),
          ],
        );
      },
    );
  }

  Widget _genderTitle(
      BuildContext context, int genderIndex, String genderTitle) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color:
                context.read<GenderSelectionCubit>().selectIndex == genderIndex
                    ? AppColors.primary
                    : Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              genderTitle,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: AppSizes.fontSizeSm,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _howOld() {
    return const BasicTextTitle(
      text: AppStrings.howOldAreYou,
      fontSize: AppSizes.fontSizeSm,
      fontWeight: FontWeight.w400,
    );
  }

  Widget _age(BuildContext context) {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomsheet.display(
              context,
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: context.read<AgesDisplayCubit>()..displayAges(),
                  ),
                  BlocProvider.value(
                    value: context.read<AgeSelectionCubit>(),
                  ),
                ],
                child: const Ages(),
              ),
            );
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BasicTextTitle(
                  text: state,
                  fontSize: AppSizes.fontSizeSm,
                  fontWeight: FontWeight.w400,
                ),
                const Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Center(
        child: BasicReactiveButton(
          onPressed: () {
            userSignupReq.gender =
                context.read<GenderSelectionCubit>().selectIndex;
            print('USER->${userSignupReq.gender}');
            userSignupReq.age = context.read<AgeSelectionCubit>().selectedAge;
            print('USER->${userSignupReq.age}');
            context.read<ButtonCubit>().execute(
                  useCase: SignUpUseCase(),
                  params: userSignupReq,
                );
          },
          title: AppStrings.finish,
        ),
      ),
    );
  }
}
