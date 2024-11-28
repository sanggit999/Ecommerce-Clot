import 'package:ecommerce_clot/core/usecase/usecase.dart';
import 'package:ecommerce_clot/common/cubit/product/product_display_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDisplayCubit extends Cubit<ProductDisplayState> {
  final UseCase useCase;
  ProductDisplayCubit({required this.useCase}) : super(ProductLoading());

  void displayProduct({dynamic params}) async {
    var result = await useCase.call(params: params);
    result.fold(
      (erorr) {
        emit(ProductFailure());
      },
      (data) {
        emit(ProductLoaded(productEntity: data));
      },
    );
  }
}
