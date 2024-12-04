import 'package:ecommerce_clot/domain/product/entity/product.dart';

abstract class ProductDisplayState {}

class ProductInitial extends ProductDisplayState{}

class ProductLoading extends ProductDisplayState {}

class ProductLoaded extends ProductDisplayState {
  final List<ProductEntity> productEntity;

  ProductLoaded({required this.productEntity});
}

class ProductFailure extends ProductDisplayState {}
