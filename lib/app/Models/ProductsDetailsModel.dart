class ProductsDetailsModel
{
  late String id;
  late String title;
  late String price;
  late String average_rating;
  late String regular_price;
  late String description;
  late List Images;
  late List Sizes;
  late List Reviews;





  ProductsDetailsModel({required this.id, required this.title,
    required this.price,required this.average_rating,
    required this.regular_price,required this.description,required this.Images,
    required this.Sizes,required this.Reviews});

  /*factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(title: title, image: image, description: description) */ }
