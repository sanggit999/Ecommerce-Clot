import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/core/usecase/usecase.dart';
import 'package:ecommerce_clot/domain/order/repository/order_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class GetOrderUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await serviceLocator<OrderRepository>().getOrder();
  }
}
