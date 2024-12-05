import 'package:ecommerce_clot/domain/order/usecase/get_cart_product.dart';
import 'package:ecommerce_clot/presentation/cart/cubit/cart_product_display_state.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductDisplayCubit extends Cubit<CartProductDisplayState> {
  CartProductDisplayCubit() : super(CartProductDisplayLoading());

  void displayCartProduct() async {
    var result = await serviceLocator<GetCartProductUseCase>().call();
    result.fold(
      (error) {
        emit(CartProductDisplayFailure());
      },
      (data) {
        emit(CartProductDisplayLoaded(productOrderedEntity: data));
      },
    );
  }
}
