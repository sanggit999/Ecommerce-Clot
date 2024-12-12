import 'package:ecommerce_clot/data/order/models/order_status.dart';
import 'package:ecommerce_clot/data/order/models/product_ordered.dart';
import 'package:ecommerce_clot/domain/order/entity/order.dart';

class OrderModel {
  final List<ProductOrderedModel> products;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String createdDate;
  final String code;
  final List<OrderStatusModel> orderStatus;

  OrderModel(
      {required this.products,
      required this.shippingAddress,
      required this.itemCount,
      required this.totalPrice,
      required this.createdDate,
      required this.code,
      required this.orderStatus});

  Map<String, dynamic> toMap() {
    return {
      'products': products,
      'shippingAddress': shippingAddress,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'createdDate': createdDate,
      'code': code,
      'orderStatus': orderStatus,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      products:
          List.from(map['products'].map((e) => ProductOrderedModel.fromMap(e))),
      shippingAddress: map['shippingAddress'] as String,
      itemCount: map['itemCount'] as int,
      totalPrice: map['totalPrice'] as double,
      createdDate: map['createdDate'] as String,
      code: map['code'] as String,
      orderStatus:
          List.from(map['orderStatus'].map((e) => OrderStatusModel.fromMap(e))),
    );
  }
}

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      products: products.map((e) => e.toEntity()).toList(),
      shippingAddress: shippingAddress,
      itemCount: itemCount,
      totalPrice: totalPrice,
      createdDate: createdDate,
      code: code,
      orderStatus: orderStatus.map((e) => e.toEntity()).toList(),
    );
  }
}
