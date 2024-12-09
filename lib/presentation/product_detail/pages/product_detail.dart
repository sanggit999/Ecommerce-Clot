import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/favorite_icon_button_cubit.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/product_color_selection_cubit.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/product_quantity_cubit.dart';
import 'package:ecommerce_clot/presentation/product_detail/cubit/product_size_selection_cubit.dart';
import 'package:ecommerce_clot/presentation/product_detail/widgets/add_to_bag.dart';
import 'package:ecommerce_clot/presentation/product_detail/widgets/favorite_icon_button.dart';
import 'package:ecommerce_clot/presentation/product_detail/widgets/product_image.dart';
import 'package:ecommerce_clot/presentation/product_detail/widgets/product_price.dart';
import 'package:ecommerce_clot/presentation/product_detail/widgets/product_quantity.dart';
import 'package:ecommerce_clot/presentation/product_detail/widgets/product_title.dart';
import 'package:ecommerce_clot/presentation/product_detail/widgets/selected_color.dart';
import 'package:ecommerce_clot/presentation/product_detail/widgets/selected_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetail extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetail({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductQuantityCubit()),
        BlocProvider(create: (_) => ProductColorSelectionCubit()),
        BlocProvider(create: (_) => ProductSizeSelectionCubit()),
        BlocProvider(create: (_) => FavoriteIconButtonCubit()..isFavorite(productEntity.productId)),
      ],
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: false,
          actions: FavoriteIconButton(productEntity: productEntity,),
        ),
        bottomNavigationBar: AddToBag(productEntity: productEntity),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(productEntity: productEntity),
            const SizedBox(height: 12),
            ProductTitle(productEntity: productEntity),
            const SizedBox(height: 12),
            ProductPrice(productEntity: productEntity),
            const SizedBox(height: 12),
            SelectedSize(
              productEntity: productEntity,
            ),
            const SizedBox(height: 12),
            SelectedColor(productEntity: productEntity),
            const SizedBox(height: 12),
            const ProductQuantity(),
          ],
        ),
      ),
    );
  }
}


