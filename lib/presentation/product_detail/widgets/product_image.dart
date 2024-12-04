
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductImage({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                  image: NetworkImage(productEntity.images[index]),
                ),
                borderRadius: BorderRadius.circular(8)),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        itemCount: productEntity.images.length,
      ),
    );
  }
}
