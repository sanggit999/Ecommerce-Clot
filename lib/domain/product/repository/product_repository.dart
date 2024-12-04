import 'package:dartz/dartz.dart';

abstract class ProductRepository{

  Future<Either> getProductTopSelling();

  Future<Either> getProductNewIn();

  Future<Either> getProductByCategoryId(String categoryId);

  Future<Either> getProductByTitle(String title);
}