import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/core/usecase/usecase.dart';
import 'package:ecommerce_clot/domain/order/repository/order_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class RemoveCartProductUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await serviceLocator<OrderRepository>().removeCartProduct(params!);
  }
}
