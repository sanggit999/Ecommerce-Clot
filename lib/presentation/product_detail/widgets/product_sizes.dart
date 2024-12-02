import 'package:ecommerce_clot/common/cubit/button/button_cubit.dart';
import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/products/entity/product.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/product_size_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizes extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductSizes({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          )),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Stack(
              children: [
                const Center(
                  child: Text(AppStrings.size,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return BlocBuilder<ProductSizeSelectionCubit, int>(
                      builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<ProductSizeSelectionCubit>()
                            .itemSelection(index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 55,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: state == index
                                ? AppColors.primary
                                : Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productEntity.sizes[index],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: state == index
                                      ? AppColors.white
                                      : AppColors.black),
                            ),
                            state == index
                                ? const Icon(
                                    Icons.check,
                                    size: 16,
                                    color: AppColors.white,
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    );
                  });
                },
                separatorBuilder: (contex, index) => const SizedBox(height: 10),
                itemCount: productEntity.colors.length),
          )
        ],
      ),
    );
  }
}
