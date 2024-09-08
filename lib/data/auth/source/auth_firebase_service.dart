import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/data/auth/models/user_models.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(UserModel userModel);

  Future<Either> getAges();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signUp(UserModel userModel) async {
    try {
      var returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userModel.emailAddress!, password: userModel.password!);

      await FirebaseFirestore.instance
          .collection('User')
          .doc(returnedData.user!.uid)
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

  @override
  Future<Either> getAges() async{
      try{
        var returnedData  =  await FirebaseFirestore.instance.collection('ages').get();
        return Right(
          returnedData.docs
        );
      }catch(e){
        return const Left('Vui lòng thử lại.');
      }
  }

}
