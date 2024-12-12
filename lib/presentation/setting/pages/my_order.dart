import 'package:ecommerce_clot/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/domain/order/entity/order.dart';
import 'package:ecommerce_clot/presentation/setting/cubit/order_display_cubit.dart';
import 'package:ecommerce_clot/presentation/setting/cubit/order_display_state.dart';
import 'package:ecommerce_clot/presentation/setting/pages/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderDisplayCubit()..displayOrder(),
      child: Scaffold(
        appBar: const BasicAppbar(
          title: Text(
            'Đặt hàng của Tôi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<OrderDisplayCubit, OrderDisplayState>(
            builder: (context, state) {
          if (state is OrderDisplayLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is OrderDisplayLoaded) {
            return _orders(context, state.orders);
          }
          return const SizedBox();
        }),
      ),
    );
  }

  Widget _orders(BuildContext context, List<OrderEntity> orders) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              AppNavigator.push(
                  context, OrderDetailPage(orderEntity: orders[index]));
            },
            child: Container(
              height: 55,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Đơn hàng #${orders[index].code}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: orders.length);
  }
}
