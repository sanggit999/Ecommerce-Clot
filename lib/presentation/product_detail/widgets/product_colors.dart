import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/product_color_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductColors extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductColors({super.key, required this.productEntity});

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
                  child: Text(AppStrings.color,
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
                  return BlocBuilder<ProductColorSelectionCubit, int>(
                      builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<ProductColorSelectionCubit>()
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
                              productEntity.colors[index].title,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: state == index
                                      ? AppColors.white
                                      : Theme.of(context).colorScheme.onSurface),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration:  BoxDecoration(
                                      color: state == index ? AppColors.white : null,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(
                                            productEntity.colors[index].rgb[0],
                                            productEntity.colors[index].rgb[1],
                                            productEntity.colors[index].rgb[2],
                                            1),
                                          shape: BoxShape.circle
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                state == index
                                    ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: AppColors.white,
                                      )
                                    : const SizedBox()
                              ],
                            )
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
