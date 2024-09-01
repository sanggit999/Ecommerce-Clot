import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/core/usecase/usecase.dart';
import 'package:ecommerce_clot/data/auth/models/user_models.dart';
import 'package:ecommerce_clot/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class SignUpUseCase implements UseCase<Either, UserModel> {
  @override
  Future<Either> call({UserModel? params}) async {
    return await serviceLocator<AuthRepository>().signUp(params!);
  }
}
