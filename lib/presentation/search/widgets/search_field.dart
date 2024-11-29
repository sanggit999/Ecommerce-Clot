import 'package:ecommerce_clot/common/cubit/product/product_display_cubit.dart';
import 'package:ecommerce_clot/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: (value) {
          if (value.isEmpty) {
            context.read<ProductDisplayCubit>().displayProductInitial();
          } else {
            context.read<ProductDisplayCubit>().displayProduct(params: value);
          }
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
          prefixIcon: SvgPicture.asset(
            AppVectors.search,
            fit: BoxFit.none,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          hintText: AppStrings.search,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
