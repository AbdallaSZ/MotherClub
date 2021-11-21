import 'package:flutter/cupertino.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/modules/Store/widgets/_createFilteredListView.dart';

Widget performSearch(List<ProductModel> snap, String _query ) {
  List<ProductModel> _filterList = <ProductModel>[];
  for (int i = 0; i < snap.length; i++) {
    ProductModel product_list_model = ProductModel(id: snap[i].id, name: snap[i].name, description: snap[i].description, price: snap[i].price, salePrice: snap[i].salePrice, regular_price: snap[i].regular_price, on_sale: snap[i].on_sale, total_sales: snap[i].total_sales, imageslist: snap[i].imageslist);
    product_list_model=snap[i];

    var item = snap[i].name;

    if (item.toLowerCase().contains(_query.toLowerCase())) {
      _filterList.add(product_list_model);
    }
  }
  return createFilteredListView(_filterList);
}