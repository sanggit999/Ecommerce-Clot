import 'package:ecommerce_clot/domain/order/entity/product_ordered.dart';

abstract class CartProductDisplayState {}

class CartProductDisplayLoading extends CartProductDisplayState {}

class CartProductDisplayLoaded extends CartProductDisplayState {
  final List<ProductOrderedEntity> products;

  CartProductDisplayLoaded({required this.products});
}

class CartProductDisplayFailure extends CartProductDisplayState {}
