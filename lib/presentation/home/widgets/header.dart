import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/core/configs/assets/app_images.dart';
import 'package:ecommerce_clot/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/auth/entity/user.dart';
import 'package:ecommerce_clot/presentation/cart/pages/cart.dart';
import 'package:ecommerce_clot/presentation/home/cubit/user_display_info_cubit.dart';
import 'package:ecommerce_clot/presentation/home/cubit/user_display_info_state.dart';
import 'package:ecommerce_clot/presentation/setting/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
      child: BlocBuilder<UserDisplayInfoCubit, UserDisplayInfoState>(
          builder: (context, state) {
        if (state is UserDisplayInfoLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserDisplayInfoLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _profileImage(context,state.userEntity),
              _gender(context,state.userEntity),
              _cart(context),
            ],
          );
        }

        return const SizedBox();
      }),
    );
  }

  Widget _profileImage(BuildContext context,UserEntity userEntity) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const SettingPage());
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: userEntity.image.isEmpty
                ? const AssetImage(AppImages.profile)
                : NetworkImage(userEntity.image),
          ),
          color:Theme.of(context).colorScheme.onPrimary,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _gender(BuildContext context, UserEntity userEntity) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          userEntity.gender == 1 ? AppStrings.men : AppStrings.women,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _cart(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const CartPage());
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: SvgPicture.asset(
          AppVectors.bag,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
