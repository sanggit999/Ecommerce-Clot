import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/auth/models/user.dart';
import 'package:ecommerce_clot/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_clot/data/auth/models/user_signup_req.dart';
import 'package:ecommerce_clot/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_clot/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce_clot/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signIn(UserSigninReq userSigninReq) async {
    return await serviceLocator<AuthFirebaseService>().signIn(userSigninReq);
  }

  @override
  Future<Either> signUp(UserSignupReq userSigninReq) async {
    return await serviceLocator<AuthFirebaseService>().signUp(userSigninReq);
  }

  @override
  Future<Either> getAges() async {
    return await serviceLocator<AuthFirebaseService>().getAges();
  }

  @override
  Future<bool> isEmailExists(String email) async {
    return await serviceLocator<AuthFirebaseService>().isEmailExists(email);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await serviceLocator<AuthFirebaseService>()
        .sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await serviceLocator<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    var userData = await serviceLocator<AuthFirebaseService>().getUser();

    return userData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(UserModel.fromMap(data).toEntity());
      },
    );
  }
}
