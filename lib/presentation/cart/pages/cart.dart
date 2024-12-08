import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/order/entity/product_ordered.dart';
import 'package:ecommerce_clot/presentation/cart/cubit/cart_product_display_cubit.dart';
import 'package:ecommerce_clot/presentation/cart/cubit/cart_product_display_state.dart';
import 'package:ecommerce_clot/presentation/cart/widgets/checkout.dart';
import 'package:ecommerce_clot/presentation/cart/widgets/product_ordered_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartProductDisplayCubit()..displayCartProduct(),
      child: Scaffold(
        appBar: const BasicAppbar(
          title: Text(
            AppStrings.cart,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<CartProductDisplayCubit, CartProductDisplayState>(
            builder: (context, state) {
          if (state is CartProductDisplayLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CartProductDisplayLoaded) {
            return state.productOrderedEntity.isEmpty
                ? Center(
                    child: _noCartResult(),
                  )
                : Stack(
                    children: [
                      _product(state.productOrderedEntity),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Checkout(listProductOrderedEntity: state.productOrderedEntity),
                      )
                    ],
                  );
          }

          return const SizedBox();
        }),
      ),
    );
  }

  Widget _noCartResult() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.cartNoResult),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            AppStrings.noCardResult,
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

  Widget _product(List<ProductOrderedEntity> productOrderedEntity) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return ProductOrderedCard(
            productOrderedEntity: productOrderedEntity[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: productOrderedEntity.length);
  }
}
