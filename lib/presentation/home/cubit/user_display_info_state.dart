import 'package:ecommerce_clot/domain/auth/entity/user.dart';

abstract class UserDisplayInfoState {}

class UserDisplayInfoLoading extends UserDisplayInfoState {}

class UserDisplayInfoLoaded extends UserDisplayInfoState {
  final UserEntity userEntity;

  UserDisplayInfoLoaded({required this.userEntity});
}

class UserDisplayInfoFailure extends UserDisplayInfoState {}
