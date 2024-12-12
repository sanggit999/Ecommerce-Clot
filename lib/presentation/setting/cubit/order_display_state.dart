import 'package:ecommerce_clot/domain/order/entity/order.dart';

abstract class OrderDisplayState {}

class OrderDisplayLoading extends OrderDisplayState {}

class OrderDisplayLoaded extends OrderDisplayState {
  final List<OrderEntity> orders;

  OrderDisplayLoaded({required this.orders});
}

class OrderDisplayFailure extends OrderDisplayState {}
