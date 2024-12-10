import 'package:ecommerce_clot/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_clot/presentation/setting/widgets/my_favorite_title.dart';
import 'package:ecommerce_clot/presentation/setting/widgets/my_order_title.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppbar(
        title: Text(
          'Cài đặt',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            MyFavoriteTitle(),
            SizedBox(height: 10),
            MyOrderTitle(),
          ],
        ),
      ),
    );
  }
}
