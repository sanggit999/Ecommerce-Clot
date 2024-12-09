import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/core/usecase/usecase.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:ecommerce_clot/domain/product/repository/product_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class AddOrRemoveFavoriteProductUseCase
    implements UseCase<Either, ProductEntity> {
  @override
  Future<Either> call({ProductEntity? params}) async {
    return await serviceLocator<ProductRepository>()
        .addOrRemoveFavoriteProduct(params!);
  }
}
