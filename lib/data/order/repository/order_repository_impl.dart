import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/order/models/add_to_bag_req.dart';
import 'package:ecommerce_clot/data/order/source/order_firebase_service.dart';
import 'package:ecommerce_clot/domain/order/repository/order_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<Either> addToBag(AddToBagReq addToBagReq) async {
    return await serviceLocator<OrderFirebaseService>().addToBag(addToBagReq);
  }
}
