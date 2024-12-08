import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/order/models/add_to_bag_req.dart';
import 'package:ecommerce_clot/data/order/models/order_registration_req.dart';

abstract class OrderRepository {
  Future<Either> addToBag(AddToBagReq addToBagReq);

  Future<Either> getCartProduct();

  Future<Either> removeCartProduct(String id);

  Future<Either> orderRegistration(OrderRegistrationReq orderRegistrationReq);
}
