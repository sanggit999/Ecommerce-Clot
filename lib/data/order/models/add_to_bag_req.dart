import 'dart:convert';

class AddToBagReq {
  final String productId;
  final String productImage;
  final String productTitle;
  final double productPrice;
  final String productSize;
  final String productColors;
  final int productQuantity;
  final double totalProductPrice;
  final String createdDate;

  AddToBagReq(
      {required this.productId,
      required this.productImage,
      required this.productTitle,
      required this.productPrice,
      required this.productSize,
      required this.productColors,
      required this.productQuantity,
      required this.totalProductPrice,
      required this.createdDate});

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
    };
  }

  factory AddToBagReq.fromMap(Map<String, dynamic> map) {
    return AddToBagReq(
      productId: map['productId'] as String,
      productImage: map['productImage'] as String,
      productTitle: map['productTitle'] as String,
      productPrice: map['productPrice'] as double,
      productSize: map['productSize'] as String,
      productColors: map['productColors'] as String,
      productQuantity: map['productQuantity'] as int,
      totalProductPrice: map['totalProductPrice'] as double,
      createdDate: map['createdDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddToBagReq.fromJson(String source) =>
      AddToBagReq.fromMap(json.decode(source) as Map<String, dynamic>);
}
