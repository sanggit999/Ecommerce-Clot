import 'package:ecommerce_clot/common/cubit/categories/categories_display_cubit.dart';
import 'package:ecommerce_clot/common/cubit/categories/categories_display_state.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/categories/entity/category.dart';
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
            _categoriesTitle(),
            const SizedBox(height: 12),
            _categories(context, state.categoryEntity)
          ],
        );
      }

      return const SizedBox();
    });
  }

  Widget _categoriesTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.categories,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            AppStrings.seeAll,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Widget _categories(
      BuildContext context, List<CategoryEntity> listCategoryEntity) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.onPrimary,
                      image: DecorationImage(
                        image: NetworkImage(listCategoryEntity[index].image),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                      )),
                ),
                const SizedBox(height: 12),
                Text(
                  listCategoryEntity[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 12),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: listCategoryEntity.length),
    );
  }
}
