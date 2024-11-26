import 'package:ecommerce_clot/common/cubit/categories/categories_display_cubit.dart';
import 'package:ecommerce_clot/common/cubit/categories/categories_display_state.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/categories/entity/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllCategoriesPages extends StatelessWidget {
  const SeeAllCategoriesPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
          builder: (context, state) {
        if (state is CategoriesDisplayLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CategoriesDisplayLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _shopByCategories(),
              const SizedBox(height: 24),
              _categories(context, state.categoryEntity)
            ],
          );
        }

        return const SizedBox();
      }),
    );
  }

  Widget _shopByCategories() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        AppStrings.shopByCategories,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,

        ),
      ),
    );
  }

  Widget _categories(
      BuildContext context, List<CategoryEntity> categoryEntity) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return Container(
          height: 65,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.onPrimary,
                    image: DecorationImage(
                      image: NetworkImage(categoryEntity[index].image),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(width: 15),
              Text(
                categoryEntity[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemCount: categoryEntity.length,
    );
  }
}
