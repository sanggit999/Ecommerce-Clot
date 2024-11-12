import 'package:dartz/dartz.dart';
import 'package:ecommerce_clot/common/cubit/button/button_state.dart';

import 'package:ecommerce_clot/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitial());

  Future<void> execute({required UseCase useCase, dynamic params}) async {
    emit(ButtonLoading());
    try {
      Either returnedData = await useCase.call(params: params);
      returnedData.fold(
        (failure) {
          emit(ButtonFailure(errorMessage: failure));
        },
        (data) {
          emit(ButtonSuccess());
        },
      );
    } catch (e) {
      emit(ButtonFailure(errorMessage: e.toString()));
    }
  }
}
