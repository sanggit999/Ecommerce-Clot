import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/core/usecase/usecase.dart';
import 'package:ecommerce_clot/data/order/models/add_to_bag_req.dart';
import 'package:ecommerce_clot/domain/order/repository/order_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class AddToBagUseCase implements UseCase<Either,AddToBagReq> {
  @override
  Future<Either> call({AddToBagReq? params}) async {
    return await serviceLocator<OrderRepository>().addToBag(params!);
  }

}