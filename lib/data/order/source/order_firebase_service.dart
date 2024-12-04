import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/order/models/add_to_bag_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirebaseService {
  Future<Either> addToBag(AddToBagReq addToBagReq);
}

class OrderFirebaseServiceImpl implements OrderFirebaseService {
  @override
  Future<Either> addToBag(AddToBagReq addToBagReq) async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('User')
          .doc(currentUser!.uid)
          .collection('Carts')
          .add(addToBagReq.toMap());
      
      return const Right('Thêm thành công');
    } catch (e) {
      return const Left('Thất bại, thử lại');
    }
  }
}