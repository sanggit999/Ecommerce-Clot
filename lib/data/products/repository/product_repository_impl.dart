import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/products/models/product.dart';
import 'package:ecommerce_clot/data/products/source/product_firebase_service.dart';
import 'package:ecommerce_clot/domain/products/repository/product_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var result = await serviceLocator<ProductFirebaseService>().getTopSelling();
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(List.from(data)
            .map((e) => ProductModel.fromMap(e).toEntity())
            .toList());
      },
    );
  }

  @override
  Future<Either> getNewIn()  async {
    var result = await serviceLocator<ProductFirebaseService>().getNewIn();
    return result.fold(
          (error) {
        return Left(error);
      },
          (data) {
        return Right(List.from(data)
            .map((e) => ProductModel.fromMap(e).toEntity())
            .toList());
      },
    );
  }
}
