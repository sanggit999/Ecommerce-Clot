import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/order/entity/product_ordered.dart';
import 'package:ecommerce_clot/presentation/cart/cubit/cart_product_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductOrderedCard extends StatelessWidget {
  final ProductOrderedEntity productOrderedEntity;

  const ProductOrderedCard({
    super.key,
    required this.productOrderedEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                    image: NetworkImage(productOrderedEntity.productImage),
                  ),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productOrderedEntity.productTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis),
                ),
                Text.rich(
                  TextSpan(
                      text: '${AppStrings.quantity}: ',
                      style: const TextStyle(
                        color: AppColors.gray,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                            text:
                                productOrderedEntity.productQuantity.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary,
                            ))
                      ]),
                ),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                          text: '${AppStrings.size}: ',
                          style: const TextStyle(
                            color: AppColors.gray,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                                text: productOrderedEntity.productSize,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ))
                          ]),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text.rich(
                      TextSpan(
                          text: '${AppStrings.color}: ',
                          style: const TextStyle(
                            color: AppColors.gray,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                                text: productOrderedEntity.productColors,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    overflow: TextOverflow.ellipsis))
                          ]),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${productOrderedEntity.totalProductPrice}\$',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    context
                        .read<CartProductDisplayCubit>()
                        .removeCartProduct(productOrderedEntity);
                  },
                  child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                          color: AppColors.primary, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.remove,
                        size: 12,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
