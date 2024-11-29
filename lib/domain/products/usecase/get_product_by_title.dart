import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/core/usecase/usecase.dart';
import 'package:ecommerce_clot/domain/products/repository/product_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class GetProductByTitleUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await serviceLocator<ProductRepository>().getProductByTitle(params!);
  }
}
