import 'package:ecommerce_clot/common/cubit/product/product_display_cubit.dart';
import 'package:ecommerce_clot/common/cubit/product/product_display_state.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/product/product_card.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:ecommerce_clot/domain/product/usecase/get_prodcut_top_selling.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllProductTopSellingPage extends StatelessWidget {
  const SeeAllProductTopSellingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (_) =>
            ProductDisplayCubit(useCase: serviceLocator<GetProductTopSellingUseCase>())
              ..displayProduct(),
        child: BlocBuilder<ProductDisplayCubit, ProductDisplayState>(
            builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _topSelling(),
                  const SizedBox(height: 24),
                  _products(context, state.productEntity),
                ],
              ),
            );
          }

          return const SizedBox();
        }),
      ),
    );
  }

  Widget _topSelling() {
    return const Text(
      AppStrings.topSelling,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _products(BuildContext context, List<ProductEntity> productEntity) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.55),
        itemBuilder: (context, index) {
          return ProductCard(productEntity: productEntity[index]);
        },
        itemCount: productEntity.length,
      ),
    );
  }
}
