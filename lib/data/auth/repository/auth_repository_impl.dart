import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/auth/models/user_models.dart';
import 'package:ecommerce_clot/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_clot/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

 class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signUp(UserModel userModel) {

    return serviceLocator<AuthFirebaseService>().signUp(userModel);
  }
  
}