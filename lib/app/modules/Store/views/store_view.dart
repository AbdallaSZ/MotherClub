import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:motherclub/app/Models/ProductDetailsModel.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/SearchModule/DataSearch.dart';
import 'package:motherclub/app/SearchModule/SearchBloc.dart';
import 'package:motherclub/app/Shimmers/GridShimmer.dart';
import 'package:motherclub/app/modules/ProductDetailsModule/ProductDetailsBloc/ProductDetailsBloc.dart';
import 'package:motherclub/app/modules/Store/views/product_item.dart';
import 'package:motherclub/app/modules/Store/widgets/_performSearch.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Dialogs.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';

import '../../ProductDetailsModule/ProductDetailsScreen.dart';
import '../../ProductDetailsModule/ProductDetailsScreen.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StoreView extends StatefulWidget {
  @override
  _StoreViewScreenState createState() => _StoreViewScreenState();
}

class _StoreViewScreenState extends State<StoreView> {
  var _searchview = new TextEditingController();
  SearchBloc? searchBloc;
  static int _pageSize = 10;

  final PagingController<int, ProductDetailsModel> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    searchBloc = SearchBloc();
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  List<ProductDetailsModel>? data;

  _StoreViewScreenState() {
    //Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Column(children: [
            Padding(
              padding: EdgeInsets.only(
                top: SizeHelper.of(context).help(
                  mobileSmall: 4,
                  mobileNormal: 5,
                  mobileLarge: 10,
                  tabletNormal: 10,
                  tabletExtraLarge: 25,
                  desktopLarge: 30,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: SizeHelper.of(context).help(
                      mobileSmall: 35,
                      mobileNormal: 35,
                      mobileLarge: 40,
                      mobileExtraLarge: 45,
                      tabletNormal: 30,
                      tabletLarge: 45,
                      tabletExtraLarge: 50,
                      desktopLarge: 70,
                    ),
                    width: SizeHelper.of(context).help(
                      mobileSmall: 150,
                      mobileNormal: 230,
                      mobileLarge: 240,
                      mobileExtraLarge: 250,
                      tabletNormal: 250,
                      tabletLarge: 300,
                      tabletExtraLarge: 500,
                      desktopLarge: 600,
                    ),
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffe0e0e0),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: white_color, width: 0.5),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        print("tapped");
                        DataSearch myDataSearch = DataSearch();
                        var result = showSearch(
                            context: context, delegate: myDataSearch);
                        result.then((value) {
                          if (value != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => BlocProvider(
                                        create: (c) => ProductDetailsBloc(),
                                        child: ProductDetailsScreen(
                                            value.productId!))));
                          }
                        });
                      },
                      child: TextFormField(
                        controller: _searchview,
                        enabled: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Black_textColor,
                          ),

                          labelText: Utils.labels!.search_product,
                          labelStyle: Theme.of(context).textTheme.bodyText2,
                          //  suffixIcon:  Icon(IconButton,color: Black_textColor,),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 10,),
                  // Icon(Icons.sort,color: Colors.black,size: 25,),
                  /*Icon(Icons.arrow_back,color: Colors.black,),
                          SizedBox(width: 20,),
                          Text('Category List',style: Theme.of(context).textTheme.headline1,),
*/
                ],
              ),
            ),
            Flexible(
              flex: 6,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: PagedGridView(
                      pagingController: _pagingController,
                      builderDelegate:
                          PagedChildBuilderDelegate<ProductDetailsModel>(
                        itemBuilder: (context, item, index) => buildProductItem(
                          item,
                        ),
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: SizeHelper.of(context).help(
                          mobileSmall: 2,
                          mobileNormal: 2,
                          mobileLarge: 2,
                          mobileExtraLarge: 2,
                          tabletSmall: 2,
                          tabletNormal: 2,
                          tabletLarge: 3,
                          tabletExtraLarge: 3,
                          desktopLarge: 4,
                        ),
                        childAspectRatio: (.68),
                      ))),
            ),
          ]),
          PositionedDirectional(
            bottom: 20,
            end: 40,
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  if (Utils.id != "")
                    Get.toNamed(Routes.CART);
                  else
                    showDialog(
                        context: context,
                        builder: (c) {
                          return loginDialog;
                        });
                },
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [
                            0.0,
                            0.1,
                            10.0
                          ],
                          colors: [
                            // Colors.deepPurple.shade400,
                            CustomButton_Color,
                            CustomButton_Color,
                            CustomButton_Second_Color,
                            // Colors.deepPurple.shade200,
                          ]),
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: white_color,
                      size: 35,
                    )),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  GestureDetector buildProductItem(ProductDetailsModel model) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (c) => BlocProvider(
                      create: (c) => ProductDetailsBloc(),
                      child: ProductDetailsScreen(model.id.toString()))));
        },
        child: ProductItem(
          data: model,
          // isLiked: false,
        ));
  }

  int page = 1;

  Future<void> _fetchPage(int pageKey) async {
    try {
      var newItems =
          await Utils.bLoC.productList(context, page: page, perPage: _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
      page += 1;
    } catch (error) {
      _pagingController.error = error;
    }
  }
}
