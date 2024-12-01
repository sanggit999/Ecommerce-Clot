import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/domain/products/entity/product.dart';
import 'package:flutter/material.dart';

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
                  return Container(
                    height: 55,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productEntity.colors[index].title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      productEntity.colors[index].rgb[0],
                                      productEntity.colors[index].rgb[1],
                                      productEntity.colors[index].rgb[2],
                                      1),
                                  shape: BoxShape.circle),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.check,
                              size: 16,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (contex, index) => const SizedBox(height: 10),
                itemCount: productEntity.colors.length),
          )
        ],
      ),
    );
  }
}
