import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductPrice({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            productEntity.discountedPrice == 0
                ? '${productEntity.price}\$'
                : '${productEntity.discountedPrice}\$',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 5),
          Text(
            productEntity.discountedPrice == 0
                ? ''
                : '${productEntity.price}\$',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.gray,
                decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
