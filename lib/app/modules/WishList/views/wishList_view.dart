import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Shimmers/GridShimmer.dart';
import 'package:motherclub/app/modules/Store/views/product_item.dart';
import 'package:motherclub/app/modules/Store/widgets/_performSearch.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class WishListView extends StatefulWidget {
  @override
  _StoreViewScreenState createState() => _StoreViewScreenState();
}

class _StoreViewScreenState extends State<WishListView> {
  var _searchview = new TextEditingController();
  bool _show = false;
  bool _firstSearch = true;
  String _query = "";

  @override
  void initState() {
    super.initState();
  }

  _StoreViewScreenState() {
    //Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'WishList',centerTitle: true,withBackButton: true,onBackButtonPressed: () {
          Get.back();
        },),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                padding: EdgeInsets.all(10),
                // color: Colors.red,
                height: deviceHeight,
                child: FutureBuilder<List<ProductModel>>(
                  future: Utils.bLoC.Product_list(context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ProductModel>? data = snapshot.data;
                      print(data);
                      return _firstSearch
                          ? GridView.builder(
                              itemCount: data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: (.53),
                              ),
                              itemBuilder: (
                                context,
                                index,
                              ) {
                                return ProductItem(data: snapshot.data![index]);
                              },
                            )
                          : performSearch(data!, _query);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return GridShimmer(
                        deviceWidth: deviceWidth, deviceHeight: deviceHeight);
                    return CircularProgressIndicator();
                  },
                ))
          ]),
        ),
      ),
    );
  }
}
