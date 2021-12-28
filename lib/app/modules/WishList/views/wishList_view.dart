import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Models/wishlistModel.dart';
import 'package:motherclub/app/Models/wishlist_item_model.dart';
import 'package:motherclub/app/Shimmers/GridShimmer.dart';
import 'package:motherclub/app/modules/Store/views/product_item.dart';
import 'package:motherclub/app/modules/Store/widgets/_performSearch.dart';
import 'package:motherclub/app/modules/WishList/views/wishlist_card_item.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class WishListView extends StatefulWidget {
  WishListView({required this.wishlist});

  final WishlistModel wishlist;

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
        appBar: CustomAppBar(
          title: widget.wishlist.title,
          centerTitle: true,
          withBackButton: true,
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                padding: EdgeInsets.all(10),
                // color: Colors.red,
                height: deviceHeight,
                child: FutureBuilder<dynamic>(
                  future: Utils.bLoC.wishlistProducts(widget.wishlist.shareKey!),
                  builder: (context, snapshot) {

                    if (snapshot.hasData) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? Center(child: CircularProgressIndicator())
                          : snapshot.hasData
                              ? snapshot.data is String?
                         Center(child: Text("${snapshot.data}")):
                            GridView.builder(
                                  itemCount: snapshot.data!.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: (.65),
                                  ),
                                  itemBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return FutureBuilder<ProductModel>(
                                        future:
                                            Utils.bLoC.getSpecificProduct(snapshot.data![index].productId.toString()),
                                        builder: (context, snapshot2) {
                                          if(snapshot2.hasData){
                                          return WishlistCardItem(
                                            data: snapshot2.data!,
                                            itemId: snapshot.data![index].itemId,

                                          );

                                        }else{
                                            return Center(child: CircularProgressIndicator());
                                          }}

                                        );
                                  },
                                )
                              : Center(
                                  child: Text('no wishlist yet'),
                                );
                      // : performSearch(data!, _query);
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
