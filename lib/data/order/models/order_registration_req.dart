import 'package:ecommerce_clot/data/order/models/product_ordered.dart';
import 'package:ecommerce_clot/domain/order/entity/product_ordered.dart';

class OrderRegistrationReq {
  final List<ProductOrderedEntity> listProductOrderedEntity;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String createdDate;

  OrderRegistrationReq(
      {required this.listProductOrderedEntity,
      required this.shippingAddress,
      required this.itemCount,
      required this.totalPrice,
      required this.createdDate});

  Map<String, dynamic> toMap() {
    return {
      'listProductOrderedEntity':
          listProductOrderedEntity.map((e) => e.fromEntity().toMap()).toList(),
      'shippingAddress': shippingAddress,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'createdDate': createdDate,
    };
  }

  factory OrderRegistrationReq.fromMap(Map<String, dynamic> map) {
    return OrderRegistrationReq(
      listProductOrderedEntity:
          map['listProductOrderedEntity'] as List<ProductOrderedEntity>,
      shippingAddress: map['shippingAddress'] as String,
      itemCount: map['itemCount'] as int,
      totalPrice: map['totalPrice'] as double,
      createdDate: map['createdDate'] as String,
    );
  }
}