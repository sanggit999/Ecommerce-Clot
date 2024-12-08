import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/order/models/add_to_bag_req.dart';
import 'package:ecommerce_clot/data/order/models/order_registration_req.dart';
import 'package:ecommerce_clot/data/order/models/product_ordered.dart';
import 'package:ecommerce_clot/data/order/source/order_firebase_service.dart';
import 'package:ecommerce_clot/domain/order/repository/order_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<Either> addToBag(AddToBagReq addToBagReq) async {
    return await serviceLocator<OrderFirebaseService>().addToBag(addToBagReq);
  }

  @override
  Future<Either> getCartProduct() async {
    var result = await serviceLocator<OrderFirebaseService>().getCartProduct();
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(List.from(data)
            .map((e) => ProductOrderedModel.fromMap(e).toEntity())
            .toList());
      },
    );
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    var result =
        await serviceLocator<OrderFirebaseService>().removeCartProduct(id);
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq orderRegistrationReq)  async{
    var result =
        await serviceLocator<OrderFirebaseService>().orderRegistration(orderRegistrationReq);
    return result.fold(
          (error) {
        return Left(error);
      },
          (data) {
        return Right(data);
      },
    );
  }
}
