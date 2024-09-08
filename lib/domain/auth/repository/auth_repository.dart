import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/auth/models/user_models.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserModel userModel);

  Future<Either> getAges();
}
