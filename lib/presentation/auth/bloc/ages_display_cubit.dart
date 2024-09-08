import 'package:ecommerce_clot/domain/auth/usecase/get_ages_usecase.dart';
import 'package:ecommerce_clot/presentation/auth/bloc/ages_display_state.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesLoading());

  void displayAges() async {
    var returnData = await serviceLocator<GetAgesUseCase>().call();
    return returnData.fold(
      (message) => emit(AgesLoadFailure(message: message)),
      (ages) => emit(AgesLoadSuccess(ages: ages)),
    );
  }
}
