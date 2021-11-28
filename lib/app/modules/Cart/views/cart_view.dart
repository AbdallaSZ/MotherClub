import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Models/cart_item_model.dart';
import 'package:motherclub/app/Shimmers/GridShimmer.dart';
import 'package:motherclub/app/modules/Store/controller/storeController.dart';
import 'package:motherclub/app/modules/Store/widgets/_performSearch.dart';
import 'package:motherclub/app/modules/Store/widgets/store_widget.dart';
import 'package:motherclub/app/repository/cart_repository.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/CustomWidget/appBarWidget.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class CartView extends StatefulWidget {
  @override
  _StoreViewScreenState createState() => _StoreViewScreenState();
}

class _StoreViewScreenState extends State<CartView> {
  var _searchview = new TextEditingController();
  bool _show = false;
  bool _firstSearch = true;
  String _query = "";

  Future<void> payPressed() async {
    var billingDetails = new BillingDetails(
        "Mohamed Adly",
        "m.adly@paytabs.com",
        "+201111111111",
        "st. 12",
        "ae",
        "dubai",
        "dubai",
        "12345");
    var shippingDetails = new ShippingDetails(
        "Mohamed Adly",
        "email@example.com",
        "+201111111111",
        "st. 12",
        "ae",
        "dubai",
        "dubai",
        "12345");
    var configuration = PaymentSdkConfigurationDetails(
      profileId: "*Your profile id*",
      serverKey: "*server key*",
      clientKey: "*client key*",
      cartId: "12433",
      cartDescription: "Flowers",
      merchantName: "Flowers Store",
      screentTitle: "Pay with Card",
      billingDetails: billingDetails,
      shippingDetails: shippingDetails,
      amount: 20.0,
      currencyCode: "AED",
      merchantCountryCode: "ae",
    );
    if (Platform.isIOS) {
      // Set up here your custom theme
      // var theme = IOSThemeConfigurations();
      // configuration.iOSThemeConfigurations = theme;
    }
    FlutterPaytabsBridge.startCardPayment(configuration, (event) {
      setState(() {
        if (event["status"] == "success") {
          // Handle transaction details here.
          var transactionDetails = event["data"];
          print(transactionDetails);
        } else if (event["status"] == "error") {
          // Handle error here.
        } else if (event["status"] == "event") {
          // Handle events here.
        }
      });
    });
  }

  Future<void> applePayPressed() async {
    var configuration = PaymentSdkConfigurationDetails(
        profileId: "*Your profile id*",
        serverKey: "*server key*",
        clientKey: "*client key*",
        cartId: "12433",
        cartDescription: "Flowers",
        merchantName: "Flowers Store",
        amount: 20.0,
        currencyCode: "AED",
        merchantCountryCode: "ae",
        merchantApplePayIndentifier: "merchant.com.bunldeId",
        simplifyApplePayValidation: true);
    FlutterPaytabsBridge.startApplePayPayment(configuration, (event) {
      setState(() {
        if (event["status"] == "success") {
          // Handle transaction details here.
          var transactionDetails = event["data"];
          print(transactionDetails);
        } else if (event["status"] == "error") {
          // Handle error here.
        } else if (event["status"] == "event") {
          // Handle events here.
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState

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
      child: FutureBuilder<List<CartItemModel>>(
          future: Utils.bLoC.cartItemsList(),
          builder: (context, snapshot) {
            return Scaffold(
              appBar: CustomAppBar(
                onBackButtonPressed: () {
                  Navigator.of(context).pop();
                },
                centerTitle: true,
                withBackButton: true,
                title: 'Your Cart',
              ),
              bottomSheet: Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: Utils.deviceHeight / 4,
                  width: Utils.deviceWidth,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Utils.labels!.items,
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.blueGrey)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(Utils.labels!.amd + ' 180',
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Utils.labels!.discount,
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blueGrey)),
                          SizedBox(
                            width: 10,
                          ),
                          Text(Utils.labels!.amd + '180',
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                        ],
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Utils.labels!.total,
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                          SizedBox(
                            width: 10,
                          ),
                          Text(Utils.labels!.amd + '180',
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent)),
                        ],
                      ),
                      SizedBox(
                        height: Utils.deviceHeight / 38,
                      ),
                      CustomBUttonWidget('CHECKOUT', Utils.deviceHeight / 20,
                          Utils.deviceWidth / 1.1, context, onTap: () {
                        if (Platform.isIOS) {
                          applePayPressed();
                        } else {
                          payPressed();
                        }
                      }),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_basket,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            "You have snapshot.data?.items.length items  in list cart",
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                            ))
                      ],
                    ),
                  ),
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
                                ? ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: data!.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          width: deviceWidth / 2.3,
                                          // height: deviceHeight/2.98,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: white_color,
                                          ),

                                          child: SingleChildScrollView(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                //crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  // SizedBox(height:23),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Image.network(
                                                        '${data[index].imageslist[0].src}',
                                                        height: 100,
                                                        width: 155,
                                                      )),
                                                  // SizedBox(height:15),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "${data[index].name}",
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize: 13,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Black_textColor,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15),
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text("10 cm",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 14,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color:
                                                                    Colors.grey,
                                                              )),
                                                        ),
                                                        SizedBox(height: 15),
                                                        Row(
                                                          children: [
                                                            Text(
                                                                Utils.labels!
                                                                        .amd +
                                                                    " ${data[index].price}",
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontSize: 18,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color:
                                                                      Black_textColor,
                                                                )),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  // SizedBox(height:10),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10.0))),
                                                          height: Utils
                                                                  .deviceHeight /
                                                              25,
                                                          //width: Utils.deviceWidth/5,
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Icon(
                                                                Icons.remove,
                                                                size: 18,
                                                              ),
                                                              Text('1',
                                                                  style: GoogleFonts.roboto(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      color: Colors
                                                                          .black)),
                                                              Icon(
                                                                Icons.add,
                                                                size: 18,
                                                              )
                                                            ],
                                                          )),
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : performSearch(data!, _query);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return GridShimmer(
                              deviceWidth: deviceWidth,
                              deviceHeight: deviceHeight);
                          return CircularProgressIndicator();
                        },
                      ))
                ]),
              ),
              //storeAppBar("",deviceHeight/9.4,deviceWidth,context),
              /*floatingActionButton: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0,0.1,10.0],

                    colors: [
                      // Colors.deepPurple.shade400,
                      CustomButton_Color,
                      CustomButton_Color,
                      CustomButton_Second_Color,
                      // Colors.deepPurple.shade200,
                    ]),
              ),
              child: Icon(Icons.shopping_cart,color: white_color,size: 35,)
            )*/
            );
          }),
    );
  }

  Widget? _showBottomSheet() {
    if (_show) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Card(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(10),
              height: Utils.deviceHeight / 4,
              width: Utils.deviceWidth,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        Utils.labels!.sizes,
                        style: Theme.of(context).textTheme.headline4,
                      )),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          width: 100,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(8),
                          color: CustomButton_Color.withOpacity(0.1),
                          child: Text('10.5 cm',
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.red)),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Text(Utils.labels!.amd + '150',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(Utils.labels!.amd + '180',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey)),
                        SizedBox(
                          width: 10,
                        ),
                        Text('(10% off)',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.red)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomBUttonWidget(Utils.labels!.done,
                      Utils.deviceHeight / 20, Utils.deviceWidth / 1.1, context)
                ],
              ),
            ),
          );
        },
      );
    } else {
      return null;
    }
  }
}
