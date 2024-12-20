import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_clot/data/product/models/product_color.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';

class ProductModel {
  final String categoryId;
  final List<ProductColorModel> colors;
  final Timestamp createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final String productId;
  final int salesNumber;
  final List<String> sizes;
  final String title;

  ProductModel({
    required this.categoryId,
    required this.colors,
    required this.createdDate,
    required this.discountedPrice,
    required this.gender,
    required this.images,
    required this.price,
    required this.productId,
    required this.salesNumber,
    required this.sizes,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'colors': colors.map((e) => e.toMap()).toList(),
      'createdDate': createdDate,
      'discountedPrice': discountedPrice,
      'gender': gender,
      'images': images.map((x) => x.toString()).toList(),
      'price': price,
      'productId': productId,
      'salesNumber': salesNumber,
      'sizes': sizes.map((x) => x.toString()).toList(),
      'title': title,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map['categoryId'] as String,
      colors: List<ProductColorModel>.from(
          map['colors'].map((e) => ProductColorModel.fromMap(e))),
      createdDate: map['createdDate'] as Timestamp,
      discountedPrice: map['discountedPrice'] as num,
      gender: map['gender'] as int,
      images: List<String>.from(map['images'].map((e) => e.toString())),
      price: map['price'] as num,
      productId: map['productId'] as String,
      salesNumber: map['salesNumber'] as int,
      sizes: List<String>.from(map['sizes'].map((e) => e.toString())),
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// Lấy data từ Model gắn sang Entity để xử lý logic UI
extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      colors: colors.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      productId: productId,
      salesNumber: salesNumber,
      sizes: sizes,
      title: title,
    );
  }
}

// Lấy data từ Entity gắn sang Model để làm việc với API
extension ProductXEntity on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(
      categoryId: categoryId,
      colors: colors.map((e) => e.fromEntity()).toList(),
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      productId: productId,
      salesNumber: salesNumber,
      sizes: sizes,
      title: title,
    );
  }
}
