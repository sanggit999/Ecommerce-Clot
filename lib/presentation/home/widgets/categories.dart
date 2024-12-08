import 'package:ecommerce_clot/common/cubit/categories/categories_display_cubit.dart';
import 'package:ecommerce_clot/common/cubit/categories/categories_display_state.dart';
import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/category/entity/category.dart';
import 'package:ecommerce_clot/presentation/category_products/pages/category_products.dart';
import 'package:ecommerce_clot/presentation/see_all_categories/pages/see_all_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
      if (state is CategoriesDisplayLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is CategoriesDisplayLoaded) {
        return Column(
          children: [
            _categoriesTitle(context),
            const SizedBox(height: 12),
            _categories(context, state.categoryEntity)
          ],
        );
      }

      return const SizedBox();
    });
  }

  Widget _categoriesTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            AppStrings.categories,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () {
              AppNavigator.push(context, const SeeAllCategoriesPages());
            },
            child: const Text(
              AppStrings.seeAll,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _categories(
      BuildContext context, List<CategoryEntity> categoryEntity) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    AppNavigator.push(context, CategoryProductsPage(categoryEntity: categoryEntity[index]));
                  },
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.onPrimary,
                        image: DecorationImage(
                          image: NetworkImage(categoryEntity[index].image),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  categoryEntity[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 12),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: categoryEntity.length),
    );
  }
}
