import 'package:ecommerce_clot/domain/auth/usecase/is_logged_in.dart';
import 'package:ecommerce_clot/presentation/splash/cubit/splash_state.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await serviceLocator<IsLoggedInUseCase>().call();
    if(isLoggedIn){
      emit(Authenticated());
    }else{
      emit(
        UnAuthenticated(),
      );
    }

  }
}
