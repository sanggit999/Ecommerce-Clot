import 'dart:convert';

import 'package:ecommerce_clot/domain/products/entity/product_color.dart';

class ProductColorModel {
  final String hexCode;
  final String title;

  ProductColorModel({
    required this.hexCode,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hexCode': hexCode,
      'title': title,
    };
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      hexCode: map['hexCode'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColorModel.fromJson(String source) =>
      ProductColorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      hexCode: hexCode,
      title: title,
    );
  }
}
