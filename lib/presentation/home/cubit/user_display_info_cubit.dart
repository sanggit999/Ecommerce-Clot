import 'package:ecommerce_clot/domain/auth/usecase/get_user.dart';
import 'package:ecommerce_clot/presentation/home/cubit/user_display_info_state.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDisplayInfoCubit extends Cubit<UserDisplayInfoState> {
  UserDisplayInfoCubit() : super(UserDisplayInfoLoading());

  void displayUserInfo() async {
    var returnedData = await serviceLocator<GetUserUseCase>().call();
    returnedData.fold(
      (error) {
        emit(UserDisplayInfoFailure());
      },
      (data) {
        emit(UserDisplayInfoLoaded(userEntity: data));
      },
    );
  }
}
