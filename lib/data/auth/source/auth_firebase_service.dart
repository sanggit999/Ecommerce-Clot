import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/auth/models/user_models.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(UserModel userModel);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signUp(UserModel userModel) async {
    try {
      var returnData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userModel.emailAddress!, password: userModel.password!);

      await FirebaseFirestore.instance
          .collection('User')
          .doc(returnData.user!.uid)
          .set({
        'firstName': userModel.firtName,
        'lastName': userModel.lastName,
        'emailAddress': userModel.emailAddress,
        'gender': userModel.gender,
        'age': userModel.age
      });

      return const Right('Đăng ký thành công ');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'Mật khẩu quá yếu';
      } else if (e.code == 'email-already-in-use') {
        message = 'Tài khoản đã tồn tại với địa chỉ email ';
      }

      return Left(message);
    }
  }

}
