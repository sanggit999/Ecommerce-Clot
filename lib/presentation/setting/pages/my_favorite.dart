import 'package:ecommerce_clot/common/cubit/product/product_display_cubit.dart';
import 'package:ecommerce_clot/common/cubit/product/product_display_state.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/product/product_card.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:ecommerce_clot/domain/product/usecase/get_favorite_product.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavoritePage extends StatelessWidget {
  const MyFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDisplayCubit(
          useCase: serviceLocator<GetFavoriteProductUseCase>())
        ..displayProduct(),
      child: BlocBuilder<ProductDisplayCubit, ProductDisplayState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProductLoaded) {
            return Scaffold(
              appBar: BasicAppbar(
                  title:
                      Text('Yêu thích của Tôi (${state.productEntity.length})',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ))),
              body: RefreshIndicator(
                  onRefresh: () async {
                    context.read<ProductDisplayCubit>().displayProduct();
                  },
                  child: _products(context, state.productEntity)),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _products(BuildContext context, List<ProductEntity> productEntity) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
