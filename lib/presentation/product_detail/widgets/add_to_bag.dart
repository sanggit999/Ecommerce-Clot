import 'package:ecommerce_clot/common/helper/product/product_price.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/products/entity/product.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;

  const AddToBag({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BasicReactiveButton(
        onPressed: () {},
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
                BlocBuilder<ProductQuantityCubit,int>(
                  builder: (context,state) {
                    final price = ProductPriceHelper.providerCurrentPrice(productEntity) * state;
                    return Text(
                      '${price.toString()}\$',
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    );
                  }
                ),
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
    );
  }
}
