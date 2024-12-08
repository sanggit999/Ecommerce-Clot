import 'dart:convert';

import 'package:ecommerce_clot/domain/order/entity/product_ordered.dart';

class ProductOrderedModel {
  final String productId;
  final String productImage;
  final String productTitle;
  final double productPrice;
  final String productSize;
  final String productColors;
  final int productQuantity;
  final double totalProductPrice;
  final String createdDate;
  final String id;

  ProductOrderedModel(
      {required this.productId,
      required this.productImage,
      required this.productTitle,
      required this.productPrice,
      required this.productSize,
      required this.productColors,
      required this.productQuantity,
      required this.totalProductPrice,
      required this.createdDate,
      required this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productImage': productImage,
      'productTitle': productTitle,
      'productPrice': productPrice,
      'productSize': productSize,
      'productColors': productColors,
      'productQuantity': productQuantity,
      'totalProductPrice': totalProductPrice,
      'createdDate': createdDate,
      'id': id,
    };
  }

  factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderedModel(
      productId: map['productId'] as String,
      productImage: map['productImage'] as String,
      productTitle: map['productTitle'] as String,
      productPrice: map['productPrice'] as double,
      productSize: map['productSize'] as String,
      productColors: map['productColors'] as String,
      productQuantity: map['productQuantity'] as int,
      totalProductPrice: map['totalProductPrice'] as double,
      createdDate: map['createdDate'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductOrderedModel.fromJson(String source) =>
      ProductOrderedModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ProductOrderedXModel on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
        productId: productId,
        productImage: productImage,
        productTitle: productTitle,
        productPrice: productPrice,
        productSize: productSize,
        productColors: productColors,
        productQuantity: productQuantity,
        totalProductPrice: totalProductPrice,
        createdDate: createdDate,
        id: id);
  }
}

extension ProductOrderedXEmtity on ProductOrderedEntity {
  ProductOrderedModel fromEntity() {
    return ProductOrderedModel(
        productId: productId,
        productImage: productImage,
        productTitle: productTitle,
        productPrice: productPrice,
        productSize: productSize,
        productColors: productColors,
        productQuantity: productQuantity,
        totalProductPrice: totalProductPrice,
        createdDate: createdDate,
        id: id);
  }
}
