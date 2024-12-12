import 'package:ecommerce_clot/domain/order/usecase/get_order.dart';
import 'package:ecommerce_clot/presentation/setting/cubit/order_display_state.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDisplayCubit extends Cubit<OrderDisplayState> {
  OrderDisplayCubit() : super(OrderDisplayLoading());

  void displayOrder() async {
    var result = await serviceLocator<GetOrderUseCase>().call();
    result.fold(
      (error) {
        emit(OrderDisplayFailure());
      },
      (data) {
        emit(OrderDisplayLoaded(orders: data));
      },
    );
  }
}
