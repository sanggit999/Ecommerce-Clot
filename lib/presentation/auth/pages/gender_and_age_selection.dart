import 'package:ecommerce_clot/common/styles/basic_spacing_style.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_clot/common/widgets/title_text/basic_text_title.dart';
import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  const GenderAndAgeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const BasicAppbar(),
      body: Column(
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
    return GestureDetector(
      onTap: () {
        print('OK');
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BasicTextTitle(
              text: AppStrings.ageRange,
              fontSize: AppSizes.fontSizeSm,
              fontWeight: FontWeight.w400,
            ),
            Icon(Icons.keyboard_arrow_down)
          ],
        ),
      ),
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Center(
        child: BasicAppButton(
          onPressed: () {},
          title: AppStrings.finish,
        ),
      ),
    );
  }
}
