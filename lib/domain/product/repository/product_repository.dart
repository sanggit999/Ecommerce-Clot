import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';

abstract class ProductRepository{

  Future<Either> getProductTopSelling();

  Future<Either> getProductNewIn();

  Future<Either> getProductByCategoryId(String categoryId);

  Future<Either> getProductByTitle(String title);

  Future<Either> addOrRemoveFavoriteProduct(ProductEntity productEntity);

  Future<bool> isFavorite(String productId);

  Future<Either> getFavoriteProduct();
}