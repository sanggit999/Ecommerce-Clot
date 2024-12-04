import 'package:ecommerce_clot/common/cubit/product/product_display_cubit.dart';
import 'package:ecommerce_clot/common/cubit/product/product_display_state.dart';
import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/widgets/product/product_card.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:ecommerce_clot/domain/product/usecase/get_product_new_in.dart';
import 'package:ecommerce_clot/presentation/see_all_product_new_in/pages/see_all_product_new_in.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewIn extends StatelessWidget {
  const NewIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDisplayCubit(
        useCase: serviceLocator<GetProductNewInUseCase>(),
      )..displayProduct(),
      child: BlocBuilder<ProductDisplayCubit, ProductDisplayState>(
          builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductLoaded) {
          return Column(
            children: [
              _newInTitle(context),
              const SizedBox(height: 12),
              _products(context, state.productEntity)
            ],
          );
        }

        return const SizedBox();
      }),
    );
  }

  Widget _newInTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            AppStrings.newIn,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () {
              AppNavigator.push(context, const SeeAllProductNewInPage());
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

  Widget _products(BuildContext context, List<ProductEntity> productEntity) {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return ProductCard(productEntity: productEntity[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        itemCount: productEntity.length,
      ),
    );
  }
}
