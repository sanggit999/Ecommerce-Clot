import 'package:ecommerce_clot/domain/products/entity/product.dart';

class ProductPriceHelper {
 static double providerCurrentPrice(ProductEntity productEntity) {
    return productEntity.discountedPrice != 0
        ? productEntity.discountedPrice.toDouble()
        : productEntity.price.toDouble();
  }
}
