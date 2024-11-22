import 'dart:convert';

import 'package:ecommerce_clot/domain/categories/entity/category.dart';

class CategoryModel {
  final String categoryId;
  final String title;
  final String image;

  CategoryModel({
    required this.categoryId,
    required this.title,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'title': title,
      'image': image,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map['categoryId'] as String,
      title: map['title'] as String,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      title: title,
      image: image,
    );
  }
}
