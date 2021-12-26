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
import 'package:rxdart/subjects.dart';
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
  bool isFiltering = false;
  PagingController<int, ProductDetailsModel> _pagingController =
      PagingController(firstPageKey: 1);
  BehaviorSubject<RangeValues>? _rxRangeValues = BehaviorSubject(sync: true);
  BehaviorSubject<bool>? rxIsChecked = BehaviorSubject(sync: true);

  @override
  void initState() {
    _rxRangeValues!.sink.add(RangeValues(10.0, 80.0));
    rxIsChecked!.sink.add(false);
    searchBloc = SearchBloc();
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      isFiltering
          ? _fetchPage(
              pageKey,
              onSale: rxIsChecked!.value,
              minPrice: _rxRangeValues!.value.start.toString(),
              maxPrice: _rxRangeValues!.value.end.toString(),
            )
          : _fetchPage(pageKey);
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
                right: SizeHelper.of(context).help(
                  mobileSmall: 4,
                  mobileNormal: 5,
                  mobileLarge: 10,
                  tabletNormal: 10,
                  tabletExtraLarge: 25,
                  desktopLarge: 30,
                ),
                left: SizeHelper.of(context).help(
                  mobileSmall: 4,
                  mobileNormal: 5,
                  mobileLarge: 10,
                  tabletNormal: 10,
                  tabletExtraLarge: 25,
                  desktopLarge: 30,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: SizeHelper.of(context).help(
                        mobileSmall: 35,
                        mobileNormal: 35,
                        mobileLarge: 40,
                        mobileExtraLarge: 45,
                        tabletNormal: 45,
                        tabletLarge: 50,
                        tabletExtraLarge: 56,
                        desktopLarge: 75,
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
                  ),
                  // SizedBox(width: 10,),
                  // Icon(Icons.sort,color: Colors.black,size: 25,),
                  /*Icon(Icons.arrow_back,color: Colors.black,),
                          SizedBox(width: 20,),
                          Text('Category List',style: Theme.of(context).textTheme.headline1,),
*/
                  SizedBox(
                    width: SizeHelper.of(context).help(
                      mobileSmall: 4,
                      mobileNormal: 5,
                      mobileLarge: 10,
                      tabletNormal: 10,
                      tabletExtraLarge: 25,
                      desktopLarge: 30,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                      Color getColor(Set<MaterialState> states) {
                        const Set<MaterialState> interactiveStates =
                            <MaterialState>{
                          MaterialState.pressed,
                          MaterialState.hovered,
                          MaterialState.focused,
                        };
                        if (states.any(interactiveStates.contains)) {
                          return Colors.blue;
                        }
                        return Colors.red;
                      }

                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                Utils.labels!.filters,
                                style: TextStyle(
                                  fontSize: SizeHelper.of(context).help(
                                    mobileSmall: 10,
                                    mobileNormal: 12,
                                    mobileLarge: 14,
                                    tabletNormal: 16,
                                    tabletExtraLarge: 18,
                                    desktopLarge: 20,
                                  ),
                                ),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  StreamBuilder<RangeValues>(
                                      stream: _rxRangeValues!.stream,
                                      builder: (context, sSnapshot) {
                                        if (sSnapshot.hasData)
                                          return Column(
                                            children: [
                                              RangeSlider(
                                                min: 10.0,
                                                max: 80.0,
                                                values: sSnapshot.data!,
                                                onChanged: (values) {
                                                  // setState(() {
                                                  _rxRangeValues!.sink.add(
                                                      RangeValues(values.start,
                                                          values.end));
                                                  //   });
                                                },
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text:
                                                          '${Utils.labels!.price} : ',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              SizeHelper.of(
                                                                      context)
                                                                  .help(
                                                            mobileSmall: 10,
                                                            mobileNormal: 12,
                                                            mobileLarge: 14,
                                                            tabletNormal: 16,
                                                            tabletExtraLarge:
                                                                18,
                                                            desktopLarge: 20,
                                                          ),
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          '${sSnapshot.data!.start.toInt()} - ${sSnapshot.data!.end.toInt()}',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize:
                                                              SizeHelper.of(
                                                                      context)
                                                                  .help(
                                                            mobileSmall: 10,
                                                            mobileNormal: 12,
                                                            mobileLarge: 14,
                                                            tabletNormal: 16,
                                                            tabletExtraLarge:
                                                                18,
                                                            desktopLarge: 20,
                                                          ),
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        else
                                          return Container();
                                      }),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${Utils.labels!.on_sale} : ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                SizeHelper.of(context).help(
                                              mobileSmall: 10,
                                              mobileNormal: 12,
                                              mobileLarge: 14,
                                              tabletNormal: 16,
                                              tabletExtraLarge: 18,
                                              desktopLarge: 20,
                                            ),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      StreamBuilder<bool>(
                                          stream: rxIsChecked!.stream,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData)
                                              return Checkbox(
                                                checkColor: Colors.white,
                                                fillColor: MaterialStateProperty
                                                    .resolveWith(getColor),
                                                value: snapshot.data!,
                                                onChanged: (bool? value) {
                                                  rxIsChecked!.sink.add(value!);
                                                },
                                              );
                                            else
                                              return Container();
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    page = 1;
                                    isFiltering = true;
                                    Navigator.pop(context);
                                    _fetchPage(
                                      1,
                                      onSale: rxIsChecked!.value,
                                      minPrice: _rxRangeValues!.value.start
                                          .toString(),
                                      maxPrice:
                                          _rxRangeValues!.value.end.toString(),
                                    );
                                  },
                                  child: Text(Utils.labels!.search),
                                )
                              ],
                            );
                          });
                    },
                    child: Icon(Icons.filter_list),
                  ),
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

  Future<void> _fetchPage(int pageKey,
      {bool? onSale, String? minPrice, String? maxPrice}) async {
    try {
      List<ProductDetailsModel> newItems = [];
      if (onSale == null && minPrice == null && maxPrice == null)
        newItems = await Utils.bLoC.productList(page: page, perPage: _pageSize);
      else {
        if (pageKey == 1) _pagingController.itemList = [];
        newItems = await Utils.bLoC.productList(
          page: page,
          perPage: _pageSize,
          onSale: onSale!,
          max: maxPrice!,
          min: minPrice!,
        );
      }
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
