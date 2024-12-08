import 'package:ecommerce_clot/domain/order/entity/product_ordered.dart';

class CartPriceHelper {
  static double caluclateCartSubtotal(
      List<ProductOrderedEntity> listProductOrderedEntity) {
    double subTotalPrice = 0;
    for (var i in listProductOrderedEntity) {
      subTotalPrice += i.totalProductPrice;
    }
    return subTotalPrice;
  }
}
