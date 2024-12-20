import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/presentation/search/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        readOnly: true,
        onTap: () {
          AppNavigator.push(context, const SearchPage());
        },
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
