import 'package:ecommerce_clot/core/usecase/usecase.dart';
import 'package:ecommerce_clot/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool,dynamic>{
  @override
  Future<bool> call({dynamic params}) async {
    return await serviceLocator<AuthRepository>().isLoggedIn();
  }
}