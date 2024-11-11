import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_clot/data/auth/models/user_signup_req.dart';

abstract class AuthRepository {
  Future<Either> signIn(UserSigninReq userSigninReq);

  Future<Either> signUp(UserSignupReq useuserSignupReqrModel);

  Future<Either> sendPasswordResetEmail(String email);

  Future<Either> getAges();

  Future<bool> isEmailExists(String email);
}
