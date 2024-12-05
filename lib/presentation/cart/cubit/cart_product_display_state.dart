import 'package:ecommerce_clot/domain/order/entity/product_ordered.dart';

abstract class CartProductDisplayState {}

class CartProductDisplayLoading extends CartProductDisplayState {}

class CartProductDisplayLoaded extends CartProductDisplayState {
  final List<ProductOrderedEntity> productOrderedEntity;

  CartProductDisplayLoaded({required this.productOrderedEntity});
}

class CartProductDisplayFailure extends CartProductDisplayState {}
