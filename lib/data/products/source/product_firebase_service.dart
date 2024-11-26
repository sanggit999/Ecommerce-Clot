import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  
  Future<Either> getNewIn();
}

class ProductFirebaseServiceImpl implements ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
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
  Future<Either> getNewIn()  async{
    try {
      var result = await FirebaseFirestore.instance
          .collection('Products')
          .where('createdDate', isGreaterThanOrEqualTo: DateTime(2024,11,25))
          .get();

      return Right(result.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Lỗi thử lại sau');
    }
  }
}
