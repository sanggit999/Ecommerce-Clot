import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseService {
  Future<Either> getProductTopSelling();

  Future<Either> getProductNewIn();

  Future<Either> getProductByCategoryId(String categoryId);

  Future<Either> getProductByTitle(String title);
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
      return Right(result.docs.map((e)=>e.data()).toList());
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
          .startAt([title])
          .endAt(['$title\uf8ff'])
          .get();
      return Right(result.docs.map((e)=>e.data()).toList());
    } catch (e) {
      return const Left('Lỗi thử lại sau');
    }
  }
}
