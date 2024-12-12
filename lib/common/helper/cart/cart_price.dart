import 'package:ecommerce_clot/domain/order/entity/product_ordered.dart';

class CartPriceHelper {
  static double caluclateCartSubtotal(
      List<ProductOrderedEntity> products) {
    double subTotalPrice = 0;
    for (var i in products) {
      subTotalPrice += i.totalProductPrice;
    }
    return subTotalPrice;
  }
}
