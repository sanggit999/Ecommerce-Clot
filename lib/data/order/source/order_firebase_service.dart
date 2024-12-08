import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/order/models/add_to_bag_req.dart';
import 'package:ecommerce_clot/data/order/models/order_registration_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirebaseService {
  Future<Either> addToBag(AddToBagReq addToBagReq);

  Future<Either> getCartProduct();

  Future<Either> removeCartProduct(String id);

  Future<Either> orderRegistration(OrderRegistrationReq orderRegistrationReq);
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

  @override
  Future<Either> getCartProduct() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var result = await FirebaseFirestore.instance
          .collection('User')
          .doc(currentUser!.uid)
          .collection('Carts')
          .get();

      List<Map> products = [];
      for (var i in result.docs) {
        var data = i.data();
        data.addAll({'id': i.id});
        products.add(data);
      }

      return Right(products);
    } catch (e) {
      return const Left('Thất bại, thử lại');
    }
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('User')
          .doc(currentUser!.uid)
          .collection('Carts')
          .doc(id)
          .delete();

      return const Right('Xoá thành công');
    } catch (e) {
      return const Left('Thất bại, thử lại sau');
    }
  }

  @override
  Future<Either> orderRegistration(
      OrderRegistrationReq orderRegistrationReq) async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('User')
          .doc(currentUser!.uid)
          .collection('Orders')
          .add(orderRegistrationReq.toMap());

      for (var i in orderRegistrationReq.listProductOrderedEntity) {
        await FirebaseFirestore.instance
            .collection('User')
            .doc(currentUser.uid)
            .collection('Carts')
            .doc(i.id)
            .delete();
      }

      return const Right('Đặt hàng thành công');
    } catch (e) {
      return const Left('Thất bại, thử lại');
    }
  }
}
