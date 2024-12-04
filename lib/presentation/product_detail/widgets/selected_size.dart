import 'package:ecommerce_clot/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/product_size_selection_cubit.dart';
import 'package:ecommerce_clot/presentation/product_detail/widgets/product_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedSize extends StatelessWidget {
  final ProductEntity productEntity;

  const SelectedSize({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomsheet.display(
            context,
            BlocProvider.value(
                value: BlocProvider.of<ProductSizeSelectionCubit>(context),
                child: ProductSizes(productEntity: productEntity)));
      },
      child: Container(
        height: 55,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              AppStrings.size,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ProductSizeSelectionCubit,int>(
                  builder: (context,state) {
                    return Text(
                      productEntity.sizes[state],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    );
                  }
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
