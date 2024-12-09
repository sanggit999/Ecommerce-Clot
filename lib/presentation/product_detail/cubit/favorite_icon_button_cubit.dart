import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:ecommerce_clot/domain/product/usecase/add_or_remove_favorite_product.dart';
import 'package:ecommerce_clot/domain/product/usecase/is_favorite.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIconButtonCubit extends Cubit<bool> {
  FavoriteIconButtonCubit() : super(false);

  void isFavorite(String productId) async {
    var result =
        await serviceLocator<IsFavoriteUseCase>().call(params: productId);
    emit(result);
  }

  void clickFavorite(ProductEntity productEntity) async {
    var result = await serviceLocator<AddOrRemoveFavoriteProductUseCase>()
        .call(params: productEntity);

    result.fold(
      (error) {},
      (data) {
        emit(data);
      },
    );
  }
}
