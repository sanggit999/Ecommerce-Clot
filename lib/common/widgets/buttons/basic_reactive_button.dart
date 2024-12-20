import 'package:ecommerce_clot/common/cubit/button/button_cubit.dart';
import 'package:ecommerce_clot/common/cubit/button/button_state.dart';
import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicReactiveButton extends StatelessWidget {
  const BasicReactiveButton({
    super.key,
    required this.onPressed,
    this.title = '',
    this.height,
    this.width,
    this.widget,
  });

  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final String title;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonState>(
      builder: (context, state) {
        return _isLoading(state is ButtonLoading ? true : false);
      },
    );
  }

  Widget _isLoading(bool isLoading) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50),
        backgroundColor: isLoading ? AppColors.primary : AppColors.primary,
      ),
      child: isLoading
          ? Container(
              height: height ?? 50,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: AppColors.white,
              ),
            )
          : widget ??
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: AppSizes.fontSizeSm,
                  fontWeight: FontWeight.w400,
                ),
              ),
    );
  }
}
