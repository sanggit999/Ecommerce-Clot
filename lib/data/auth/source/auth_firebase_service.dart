import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_clot/data/auth/models/user_signup_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(UserSigninReq userSigninReq);

  Future<Either> signUp(UserSignupReq userSignupReq);

  Future<Either> sendPasswordResetEmail(String email);

  Future<Either> getAges();

  Future<bool> isEmailExists(String email);

  Future<bool> isLoggedIn();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signIn(UserSigninReq userSigninReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userSigninReq.emailAddress!,
        password: userSigninReq.password!,
      );

      return const Right('Đăng nhập thành công');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Tài khoản không tồn tại';
      } else if (e.code == 'invalid-credential') {
        message = 'Mật khẩu sai';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signUp(UserSignupReq userSignupReq) async {
    try {
      var returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userSignupReq.emailAddress!,
              password: userSignupReq.password!);

      await FirebaseFirestore.instance
          .collection('User')
          .doc(returnedData.user!.uid)
          .set(
        {
          'firstName': userSignupReq.firtName,
          'lastName': userSignupReq.lastName,
          'emailAddress': userSignupReq.emailAddress,
          'gender': userSignupReq.gender,
          'age': userSignupReq.age
        },
      );

      return const Right('Đăng ký thành công ');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'email-already-in-use') {
        message = 'Email đã tồn tại';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Ages').get();
      return Right(returnedData.docs);
    } catch (e) {
      return const Left('Vui lòng thử lại.');
    }
  }

  @override
  Future<bool> isEmailExists(String email) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('User')
        .where('emailAddress', isEqualTo: email)
        .limit(1)
        .get();

    return snapshot.docs.isNotEmpty;
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Đổi thành công');
    } catch (e) {
      return const Left('Lỗi, thử lại');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
