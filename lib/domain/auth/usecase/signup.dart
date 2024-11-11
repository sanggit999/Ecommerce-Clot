import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/core/usecase/usecase.dart';
import 'package:ecommerce_clot/data/auth/models/user_signup_req.dart';

import 'package:ecommerce_clot/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class SignUpUseCase implements UseCase<Either, UserSignupReq> {
  @override
  Future<Either> call({UserSignupReq? params}) async {
    return await serviceLocator<AuthRepository>().signUp(params!);
  }
}
