import 'package:ecommerce_clot/common/cubit/product/product_display_cubit.dart';
import 'package:ecommerce_clot/common/cubit/product/product_display_state.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/product/product_card.dart';
import 'package:ecommerce_clot/domain/categories/entity/category.dart';
import 'package:ecommerce_clot/domain/products/entity/product.dart';
import 'package:ecommerce_clot/domain/products/usecase/get_product_by_category_id.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsPage extends StatelessWidget {
  final CategoryEntity categoryEntity;

  const CategoryProductsPage({
    super.key,
    required this.categoryEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (_) => ProductDisplayCubit(
            useCase: serviceLocator<GetProductByCategoryIdUseCase>())
          ..displayProduct(params: categoryEntity.categoryId),
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
                  _title(state.productEntity),
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

  Widget _title(List<ProductEntity> productEntity) {
    return Text(
      '${categoryEntity.title} (${productEntity.length})',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
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
