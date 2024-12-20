import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/product/models/product.dart';
import 'package:ecommerce_clot/data/product/source/product_firebase_service.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:ecommerce_clot/domain/product/repository/product_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<Either> getProductTopSelling() async {
    var result =
        await serviceLocator<ProductFirebaseService>().getProductTopSelling();
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
  Future<Either> getProductNewIn() async {
    var result =
        await serviceLocator<ProductFirebaseService>().getProductNewIn();
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
  Future<Either> getProductByCategoryId(String categoryId) async {
    var result = await serviceLocator<ProductFirebaseService>()
        .getProductByCategoryId(categoryId);
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
  Future<Either> getProductByTitle(String title) async {
    var result =
        await serviceLocator<ProductFirebaseService>().getProductByTitle(title);
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
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity productEntity) async {
    var result = await serviceLocator<ProductFirebaseService>()
        .addOrRemoveFavoriteProduct(productEntity);
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }

  @override
  Future<bool> isFavorite(String productId) async {
    return await serviceLocator<ProductFirebaseService>().isFavorite(productId);
  }

  @override
  Future<Either> getFavoriteProduct() async {
    var result =
        await serviceLocator<ProductFirebaseService>().getFavoriteProduct();
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
