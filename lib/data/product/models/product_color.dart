import 'dart:convert';

import 'package:ecommerce_clot/domain/product/entity/product_color.dart';

class ProductColorModel {
  final List<int> rgb;
  final String title;

  ProductColorModel({
    required this.rgb,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rgb': rgb,
      'title': title,
    };
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      rgb: List<int>.from(map['rgb'].map((e) => e)),
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
      rgb: rgb,
      title: title,
    );
  }
}

extension ProductColorXEntity on ProductColorEntity {
  ProductColorModel fromEntity() {
    return ProductColorModel(
      rgb: rgb,
      title: title,
    );
  }
}
