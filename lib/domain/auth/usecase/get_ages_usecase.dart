import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/core/usecase/usecase.dart';
import 'package:ecommerce_clot/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class GetAgesUseCase implements UseCase<Either,dynamic>{
  @override
  Future<Either> call({params})  async{
      return await serviceLocator<AuthRepository>().getAges();
  }

}