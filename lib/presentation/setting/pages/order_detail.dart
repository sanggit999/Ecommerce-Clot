import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/core/configs/theme/app_colors.dart';
import 'package:ecommerce_clot/domain/order/entity/order.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderDetailPage({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text('Đơn hàng #${orderEntity.code}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _status(),
            const SizedBox(height: 30),
            _shipping(context),
          ],
        ),
      ),
    );
  }

  Widget _status() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: orderEntity.orderStatus[index].done
                          ? AppColors.primary
                          : AppColors.gray,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      size: 16,
                      color: orderEntity.orderStatus[index].done
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      orderEntity.orderStatus[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: orderEntity.orderStatus[index].done
                            ? Theme.of(context).colorScheme.secondary
                            : AppColors.gray,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              orderEntity.orderStatus[index].createdDate
                  .toDate()
                  .toString()
                  .split(' ')[0],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: orderEntity.orderStatus[index].done
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 50,
      ),
      reverse: true,
      itemCount: orderEntity.orderStatus.length,
    );
  }

  Widget _shipping(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Đơn vẩn chuyển',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              orderEntity.shippingAddress,
            ))
      ],
    );
  }
}
