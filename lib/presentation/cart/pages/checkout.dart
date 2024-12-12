import 'package:ecommerce_clot/common/cubit/button/button_cubit.dart';
import 'package:ecommerce_clot/common/cubit/button/button_state.dart';
import 'package:ecommerce_clot/common/helper/cart/cart_price.dart';
import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/data/order/models/order_registration_req.dart';
import 'package:ecommerce_clot/domain/order/entity/product_ordered.dart';
import 'package:ecommerce_clot/domain/order/usecase/order_registration.dart';
import 'package:ecommerce_clot/presentation/cart/pages/order_placed.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;

  CheckoutPage({super.key, required this.products});

  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text(AppStrings.checkOut,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: BlocListener<ButtonCubit,ButtonState>(
        listener: (context, state) {
          if(state is ButtonSuccess){
            AppNavigator.pushAndRemoveUntil(context, const OrderPlacedPage());
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _addressTextField(context),
              BasicReactiveButton(
                onPressed: () {
                  context.read<ButtonCubit>().execute(
                        useCase: serviceLocator<OrderRegistrationUseCase>(),
                        params: OrderRegistrationReq(
                          products: products,
                          shippingAddress: _addressController.text,
                          itemCount: products.length,
                          totalPrice: CartPriceHelper.caluclateCartSubtotal(products) +
                                  10,
                          createdDate: DateTime.now().toString(),
                        ),
                      );
                },
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(
                        text: '${AppStrings.total}:',
                        style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                              text:
                                  '${CartPriceHelper.caluclateCartSubtotal(products) + 10}\$',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold))
                        ])),
                    const Text(
                      AppStrings.placeOrder,
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _addressTextField(BuildContext context) {
    return TextField(
      controller: _addressController,
      keyboardType: TextInputType.text,
      minLines: 2,
      maxLines: 2,
      decoration: InputDecoration(
        hintText: 'Địa chỉ giao hàng',
        hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 12,
            fontWeight: FontWeight.w400),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
      ),
    );
  }
}
