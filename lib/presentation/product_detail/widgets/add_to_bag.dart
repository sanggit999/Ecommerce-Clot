import 'package:ecommerce_clot/common/cubit/button/button_cubit.dart';
import 'package:ecommerce_clot/common/cubit/button/button_state.dart';
import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/helper/product/product_price.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/data/order/models/add_to_bag_req.dart';
import 'package:ecommerce_clot/domain/order/usecase/add_to_bag.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:ecommerce_clot/presentation/cart/pages/cart.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/product_color_selection_cubit.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/product_quantity_cubit.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/product_size_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;

  const AddToBag({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonCubit,ButtonState>(
      listener: (context, state) {
        if(state is ButtonSuccess){
          AppNavigator.push(context, const CartPage());
        }

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BasicReactiveButton(
          onPressed: () {
            context.read<ButtonCubit>().execute(
                useCase: AddToBagUseCase(),
                params: AddToBagReq(
                  productId: productEntity.productId,
                  productImage: productEntity.images[0],
                  productTitle: productEntity.title,
                  productPrice: productEntity.price.toDouble(),
                  productSize: productEntity.sizes[context.read<ProductSizeSelectionCubit>().selectedIndex],
                  productColors: productEntity.colors[context.read<ProductColorSelectionCubit>().selectedIndex].title,
                  productQuantity: context.read<ProductQuantityCubit>().state,
                  totalProductPrice: ProductPriceHelper.providerCurrentPrice(productEntity) * context.read<ProductQuantityCubit>().state,
                  createdDate: DateTime.now().toString(),
                ));
          },
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    AppStrings.total,
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 5),
                  BlocBuilder<ProductQuantityCubit, int>(
                      builder: (context, state) {
                    final price =
                        ProductPriceHelper.providerCurrentPrice(productEntity) *
                            state;
                    return Text(
                      '${price.toString()}\$',
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    );
                  }),
                ],
              ),
              const Text(
                AppStrings.addToBag,
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
