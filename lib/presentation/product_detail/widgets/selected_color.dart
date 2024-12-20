import 'package:ecommerce_clot/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/product_color_selection_cubit.dart';
import 'package:ecommerce_clot/presentation/product_detail/widgets/product_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedColor extends StatelessWidget {
  final ProductEntity productEntity;

  const SelectedColor({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomsheet.display(
            context,
            BlocProvider.value(
                value: BlocProvider.of<ProductColorSelectionCubit>(context),
                child: ProductColors(
                  productEntity: productEntity,
                )));
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
              AppStrings.color,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ProductColorSelectionCubit,int>(
                  builder: (context,state) {
                    return Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                            productEntity.colors[state].rgb[0],
                            productEntity.colors[state].rgb[1],
                            productEntity.colors[state].rgb[2],
                            1),
                        shape: BoxShape.circle,
                      ),
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
