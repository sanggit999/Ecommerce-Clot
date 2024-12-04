import 'package:ecommerce_clot/common/cubit/product/product_display_cubit.dart';
import 'package:ecommerce_clot/common/cubit/product/product_display_state.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/product/product_card.dart';
import 'package:ecommerce_clot/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:ecommerce_clot/domain/product/usecase/get_product_by_title.dart';

import 'package:ecommerce_clot/presentation/search/widgets/search_field.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDisplayCubit(
          useCase: serviceLocator<GetProductByTitleUseCase>()),
      child: Scaffold(
        appBar: const BasicAppbar(
          height: 80,
          title: SearchField(),
        ),
        body: BlocBuilder<ProductDisplayCubit, ProductDisplayState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProductLoaded) {
              return state.productEntity.isEmpty
                  ? _noSearchResult()
                  : _products(context, state.productEntity);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _noSearchResult() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.searchNoResult),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            AppStrings.noSearchResult,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }

  Widget _products(BuildContext context, List<ProductEntity> productEntity) {
    return GridView.builder(
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
    );
  }
}
