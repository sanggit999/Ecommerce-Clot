class ProductOrderedEntity {
  final String productId;
  final String productImage;
  final String productTitle;
  final double productPrice;
  final String productSize;
  final String productColors;
  final int productQuantity;
  final double totalProductPrice;
  final String createdDate;

  ProductOrderedEntity(
      {required this.productId,
      required this.productImage,
      required this.productTitle,
      required this.productPrice,
      required this.productSize,
      required this.productColors,
      required this.productQuantity,
      required this.totalProductPrice,
      required this.createdDate});
}
