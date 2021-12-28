class ProductModel{
  late String id;
  late String name;
  late String description;
  late String price;
  late String regular_price;
  late String salePrice;
  late bool on_sale;
  late String total_sales;
  late List<Images> imageslist;


  ProductModel({required this.id, required this.name, required this.description, required this.price, required this.salePrice, required this.regular_price,required this.on_sale,required this.total_sales,required this.imageslist});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? "",
      price: json['price'] ?? "",
      regular_price: json['regular_price'] ?? "",
      salePrice: json['sale_price'] ?? "",
      on_sale: json['on_sale'],
      total_sales: json['total_sales'] ?? 0,
      imageslist: json['images'],
    );
  }
}


class Images{
  late int id;
  late String src;

  Images({required this.id,required this.src});
  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'],
      src: json['src'],
    );
  }

}