import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            AppStrings.quantity,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  child: Center(
                    child: IconButton(
                        onPressed: () {context.read<ProductQuantityCubit>().decrement();},
                        icon: const Icon(
                          Icons.remove,
                          size: 16,
                        )),
                  )),
              const SizedBox(width: 10),
              BlocBuilder<ProductQuantityCubit,int>(
                builder: (context,state) {
                  return  Text(
                    state.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                }
              ),
              const SizedBox(width: 10),
              Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  child: Center(
                    child: IconButton(
                        onPressed: () {context.read<ProductQuantityCubit>().increment();},
                        icon: const Icon(
                          Icons.add,
                          size: 16,
                        )),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
