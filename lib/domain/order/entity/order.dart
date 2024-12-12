import 'package:ecommerce_clot/domain/order/entity/order_status.dart';
import 'package:ecommerce_clot/domain/order/entity/product_ordered.dart';

class OrderEntity {
  final List<ProductOrderedEntity> products;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String createdDate;
  final String code;
  final List<OrderStatusEntity> orderStatus;

  OrderEntity(
      {required this.products,
      required this.shippingAddress,
      required this.itemCount,
      required this.totalPrice,
      required this.createdDate,
      required this.code,
      required this.orderStatus});
}
