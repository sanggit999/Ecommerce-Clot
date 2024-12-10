import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/favorite_icon_button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIconButton extends StatelessWidget {
  final ProductEntity productEntity;

  const FavoriteIconButton({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavoriteIconButtonCubit>().clickFavorite(productEntity);
      },
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          shape: BoxShape.circle,
        ),
        child: BlocBuilder<FavoriteIconButtonCubit, bool>(
            builder: (context, state) {
          return Icon(
            state ? Icons.favorite : Icons.favorite_outline,
            size: AppSizes.iconSizeSm,
            color: state ? Colors.red : Theme.of(context).colorScheme.onSurface,
          );
        }),
      ),
    );
  }
}
