class WishlistProductModel {
  WishlistProductModel({
    this.itemId,
    this.productId,
    this.variationId,
    this.meta,
    this.dateAdded,
    this.price,
    this.inStock,
  });

  final int? itemId;
  final int? productId;
  final int? variationId;
  final List<dynamic>? meta;
  final DateTime? dateAdded;
  final String? price;
  final bool? inStock;

  WishlistProductModel copyWith({
    int? itemId,
    int? productId,
    int? variationId,
    List<dynamic>? meta,
    DateTime? dateAdded,
    String? price,
    bool? inStock,
  }) =>
      WishlistProductModel(
        itemId: itemId ?? this.itemId,
        productId: productId ?? this.productId,
        variationId: variationId ?? this.variationId,
        meta: meta ?? this.meta,
        dateAdded: dateAdded ?? this.dateAdded,
        price: price ?? this.price,
        inStock: inStock ?? this.inStock,
      );
}
