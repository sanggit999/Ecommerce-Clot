import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/product/models/product.dart';
import 'package:ecommerce_clot/domain/product/entity/product.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProductFirebaseService {
  Future<Either> getProductTopSelling();

  Future<Either> getProductNewIn();

  Future<Either> getProductByCategoryId(String categoryId);

  Future<Either> getProductByTitle(String title);

  Future<Either> addOrRemoveFavoriteProduct(ProductEntity productEntity);

  Future<bool> isFavorite(String productId);

  Future<Either> getFavoriteProduct();
}

class ProductFirebaseServiceImpl implements ProductFirebaseService {
  @override
  Future<Either> getProductTopSelling() async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('Products')
          .where('salesNumber', isGreaterThanOrEqualTo: 20)
          .get();

      return Right(result.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Lỗi thử lại sau');
    }
  }

  @override
  Future<Either> getProductNewIn() async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('Products')
          .where('createdDate', isGreaterThanOrEqualTo: DateTime(2024, 11, 25))
          .get();

      return Right(result.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Lỗi thử lại sau');
    }
  }

  @override
  Future<Either> getProductByCategoryId(String categoryId) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      return Right(result.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Lỗi thử lại sau');
    }
  }

  @override
  Future<Either> getProductByTitle(String title) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('Products')
          .orderBy('title')
          .startAt([title]).endAt(['$title\uf8ff']).get();
      return Right(result.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Lỗi thử lại sau');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity productEntity) async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var result = await FirebaseFirestore.instance
          .collection('User')
          .doc(currentUser!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: productEntity.productId)
          .get();

      if (result.docs.isNotEmpty) {
        await result.docs.first.reference.delete();
        return const Right(false); // Có yêu thích thì xoá
      } else {
        await FirebaseFirestore.instance
            .collection('User')
            .doc(currentUser.uid)
            .collection('Favorites')
            .add(productEntity.fromEntity().toMap());
        return const Right(true);
      }
    } catch (e) {
      return const Left("Vui long thu lai");
    }
  }

  @override
  Future<bool> isFavorite(String productId) async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var result = await FirebaseFirestore.instance
          .collection('User')
          .doc(currentUser!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: productId)
          .get();

      if (result.docs.isNotEmpty) {
        return true; // Có yêu thích thì hiện thị
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getFavoriteProduct() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var result = await FirebaseFirestore.instance
          .collection('User')
          .doc(currentUser!.uid)
          .collection('Favorites')
          .get();

      return Right(result.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Vui long thu lai sau');
    }
  }
}
