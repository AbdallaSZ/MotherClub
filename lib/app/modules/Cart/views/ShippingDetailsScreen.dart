import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:motherclub/app/Dialogs/Dialogs.dart';
import 'package:motherclub/app/Models/shipping_cost_model.dart';
import 'package:motherclub/app/Models/shipping_zone_model.dart';
import 'package:motherclub/app/modules/orders/OrderRequestModel.dart';
import 'package:motherclub/app/modules/orders/orderRepo.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/CustomWidget/EditTextWithoutIcon.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:size_helper/size_helper.dart';

class ShippingDetailsScreen extends StatefulWidget {
  List<dynamic>? data;

  double total;

  ShippingDetailsScreen(this.data, this.total);

  @override
  _ShippingDetailsScreenState createState() => _ShippingDetailsScreenState();
}

class _ShippingDetailsScreenState extends State<ShippingDetailsScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _zipCodeController = TextEditingController();
  BehaviorSubject<ShippingZoneModel>? rxShippingZone =
      BehaviorSubject(sync: true);
  BehaviorSubject<String>? rxZoneName = BehaviorSubject(sync: true);
  double cost = 0;
  double tax = 0;
  double taxVal = 0;
  ShippingZoneModel? firstIndex;

  // ============ check Box Behaviour ======

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    // TODO: implement dispose
    rxShippingZone?.close();
    rxZoneName?.close();
    super.dispose();
  }

  @override
  void initState() {
    rxZoneName!.sink.add('not selected');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: Utils.labels!.shipping_details,
        onBackButtonPressed: backFunction,
        withBackButton: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Divider(
                  color: Colors.transparent,
                  height: deviceHeight / 25,
                ),
                EditTextwidget(Utils.labels!.name, _nameController, context,
                    validate: nameValidate),
                Divider(
                  color: Colors.transparent,
                  height: 10,
                ),
                // InternationalPhoneNumberInput(
                //   textFieldController: _phoneController,
                //   cursorColor: Colors.blue,
                //   textStyle: Theme.of(context)
                //       .textTheme
                //       .bodyText1!
                //       .copyWith(color: Colors.black),
                //   // selectorTextStyle: Theme.of(context).textTheme.bodyText1.copyWith(  fontWeight: FontWeight.w300,
                //   //   fontSize: SizeHelper.of(context).help(
                //   //     tabletLarge: 14,
                //   //     desktopLarge: 18,
                //   //   ),),
                //   inputDecoration: InputDecoration(
                //     fillColor: Edit_textColor,
                //     filled: true,
                //     contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                //     hintText: Utils.labels!.phone,
                //     // hintStyle: Theme.of(context).textTheme.headline1.copyWith(  fontWeight: FontWeight.w300,
                //     //   fontSize: SizeHelper.of(context).help(
                //     //     tabletLarge: 16,
                //     //     desktopLarge: 20,
                //     //   ),),
                //
                //     counterText: '',
                //     border: InputBorder.none,
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide.none,
                //       borderRadius:
                //           const BorderRadius.all(const Radius.circular(10)),
                //     ),
                //     disabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide.none,
                //       borderRadius:
                //           const BorderRadius.all(const Radius.circular(10)),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         color: Colors.white,
                //         width: 1,
                //       ),
                //       borderRadius:
                //           const BorderRadius.all(const Radius.circular(10)),
                //     ),
                //     errorBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         color: Colors.red,
                //         width: 1,
                //       ),
                //       borderRadius:
                //           const BorderRadius.all(const Radius.circular(10)),
                //     ),
                //     focusedErrorBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         color: Colors.red,
                //         width: 1,
                //       ),
                //       borderRadius:
                //           const BorderRadius.all(const Radius.circular(10)),
                //     ),
                //   ),
                //   initialValue: PhoneNumber(
                //     isoCode: 'EG',
                //   ),
                //
                //   onInputChanged: (v) {},
                // ),
                EditTextwidget(Utils.labels!.phone, _phoneController, context,
                    validate: phoneValidate),
                Divider(
                  color: Colors.transparent,
                  height: 10,
                ),
                EditTextwidget(Utils.labels!.email, _emailController, context,
                    validate: emailValidate),
                Divider(
                  color: Colors.transparent,
                  height: 10,
                ),

                // Divider(
                //   color: Colors.transparent,
                //   height: 10,
                // ),
                // EditTextwidget(
                //     Utils.labels!.country, _addressController, context,
                //     validate: addressValidate),
                // Divider(
                //   color: Colors.transparent,
                //   height: 10,
                // ),
                EditTextwidget(Utils.labels!.city, _cityController, context,
                    validate: cityValidate),
                Divider(
                  color: Colors.transparent,
                  height: 10,
                ),
                StreamBuilder<String>(
                    stream: rxZoneName!.stream,
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? Container()
                          : (snapshot.data! == 'not selected' || snapshot.data! == 'UAE')
                              ? Container()
                              : EditTextwidget(Utils.labels!.zipCode,
                                  _zipCodeController, context,
                                  validate: zipCodeValidate);
                    }),
                Divider(
                  color: Colors.transparent,
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 10),
                  child: InkWell(
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              cost = 0;
                              tax = 0;
                              return AlertDialog(

                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      taxVal = tax;

                                      _addressController.text = rxShippingZone!
                                                  .value.name! ==
                                              'Locations not covered by your other zones'
                                          ? 'not selected'
                                          : rxShippingZone!.value.name!;

                                      rxZoneName!.sink.add(rxShippingZone!
                                                  .value.name! ==
                                              'Locations not covered by your other zones'
                                          ? 'not selected'
                                          : rxShippingZone!.value.name!);

                                      rxShippingZone!.sink.add(firstIndex!);
                                    },
                                    child: Text(Utils.labels!.done),
                                  ),
                                ],
                                title: Text(
                                  Utils.labels!.select_zone,
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
                                content: Container(
                                  height: 140,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FutureBuilder<List<ShippingZoneModel>>(
                                          future: Utils.bLoC.shippingZone(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              firstIndex = snapshot.data![0];
                                              rxShippingZone!.sink.add(snapshot.data![0]);
                                            }
                                            return ((snapshot.connectionState ==
                                                        ConnectionState
                                                            .waiting) ||
                                                    !snapshot.hasData)
                                                ? Container(
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                  )
                                                : StreamBuilder<
                                                        ShippingZoneModel>(
                                                    stream:
                                                        rxShippingZone!.stream,
                                                    builder: (context,
                                                        rxShippingZoneSnapshot) {
                                                      return !rxShippingZoneSnapshot
                                                              .hasData
                                                          ? Container(
                                                              child: Center(
                                                                child:
                                                                    CircularProgressIndicator(),
                                                              ),
                                                            )
                                                          : Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color:
                                                                    Edit_textColor,
                                                              ),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              // width: double.infinity,
                                                              child: DropdownButton<
                                                                  ShippingZoneModel>(
                                                                isExpanded:
                                                                    true,
                                                                value:
                                                                    rxShippingZone!
                                                                        .value,
                                                                icon: const Icon(
                                                                    Icons
                                                                        .arrow_drop_down_circle_sharp),
                                                                elevation: 16,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                                underline:
                                                                    Container(
                                                                  height: 1,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                onChanged:
                                                                    (ShippingZoneModel?
                                                                        newValue) {
                                                                  rxShippingZone!
                                                                      .sink
                                                                      .add(
                                                                          newValue!);
                                                                },
                                                                items: snapshot.data!.map<
                                                                        DropdownMenuItem<
                                                                            ShippingZoneModel>>(
                                                                    (ShippingZoneModel
                                                                        value) {
                                                                  return DropdownMenuItem<
                                                                      ShippingZoneModel>(
                                                                    value:
                                                                        value,
                                                                    child: Text(value.name! ==
                                                                            'Locations not covered by your other zones'
                                                                        ? 'Select'
                                                                        : value
                                                                            .name!),
                                                                  );
                                                                }).toList(),
                                                              ),
                                                            );
                                                    });
                                          }),
                                      StreamBuilder<ShippingZoneModel>(
                                          stream: rxShippingZone!.stream,
                                          builder: (context,
                                              rxShippingZoneSnapshot) {
                                            return rxShippingZoneSnapshot
                                                    .hasData
                                                ? rxShippingZoneSnapshot
                                                .data!.id! == 0 ?Text(
                                                '${Utils.labels!.tax}:0.0'):FutureBuilder<double>(
                                                    future: Utils.bLoC.taxCost(
                                                        rxShippingZoneSnapshot
                                                                        .data!
                                                                        .name ==
                                                                    'Saudi Arabia' ||
                                                                rxShippingZoneSnapshot
                                                                        .data!
                                                                        .name ==
                                                                    'Kuwait'
                                                            ? 2
                                                            : 1),
                                                    builder:
                                                        (context, taxSnapshot) {
                                                      if (taxSnapshot.hasData)
                                                        rxShippingZoneSnapshot
                                                                    .data!
                                                                    .name ==
                                                                'Locations not covered by your other zones'
                                                            ? tax = 0
                                                            : tax = taxSnapshot.data!*widget.total/100;
                                                      return (taxSnapshot
                                                              .hasData)
                                                          ? taxSnapshot
                                                                      .connectionState ==
                                                                  ConnectionState
                                                                      .waiting
                                                              ? Text(
                                                                  '${Utils.labels!.tax} : 0.0')
                                                              : Text(
                                                                  '${Utils.labels!.tax} : $tax')
                                                          : Text(
                                                              '${Utils.labels!.tax} : 0.0');
                                                    })
                                                : Text(
                                                    '${Utils.labels!.tax} : 0.0');
                                          }),

                                      StreamBuilder<ShippingZoneModel>(
                                          stream: rxShippingZone!.stream,
                                          builder: (context, rxShippingZoneSnapshot) {
                                            return rxShippingZoneSnapshot.hasData
                                                ? rxShippingZoneSnapshot
                                                .data!.id! == 0 ?Text(
                                                '${Utils.labels!.shipping_cost}:0.0'):FutureBuilder<
                                                        List<ShippingCostModel>>(
                                                    future: Utils.bLoC
                                                        .shippingCost(
                                                            rxShippingZoneSnapshot
                                                                .data!.id!),
                                                    builder: (context,
                                                        costSnapshot) {
                                                      if (costSnapshot.hasData)
                                                        cost = widget.total >= double.parse(costSnapshot.data![0].settings!.minAmount!.value!)? 0:
                                                        double.parse(
                                                            costSnapshot
                                                                .data![1]
                                                                .settings!
                                                                .cost!
                                                                .value!);
                                                      return (costSnapshot
                                                              .hasData)
                                                          ? costSnapshot
                                                                      .connectionState ==
                                                                  ConnectionState
                                                                      .waiting
                                                              ? Text(
                                                                  '${Utils.labels!.shipping_cost} : 0.0')
                                                              : Text(
                                                                  '${Utils.labels!.shipping_cost} : $cost')
                                                          : Text(
                                                              '${Utils.labels!.shipping_cost} : 0.0');
                                                    })
                                                : Text(
                                                    '${Utils.labels!.shipping_cost} : 0.0');
                                          }),

                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select address',
                            style: TextStyle(color: Colors.pinkAccent),
                          ),
                          StreamBuilder<String>(
                              stream: rxZoneName!.stream,
                              builder: (context, snapshot) {
                                return !snapshot.hasData
                                    ? Container()
                                    : snapshot.data == 'not selected'
                                        ? Text(
                                            'no address selected',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .errorColor),
                                          )
                                        : Text(
                                            snapshot.data!,
                                            style:
                                                TextStyle(color: Colors.green),
                                          );
                              }),
                        ],
                      )),
                ),

                // EditTextWidget("Your Pregnancy", context, Icons.keyboard_arrow_down_outlined),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                    onTap: () {
                      submit();
                    },
                    child: CustomBUttonWidget(Utils.labels!.online_pay,
                        deviceHeight / 17, deviceWidth / 1.1, context)),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      cODSubmit();
                    },
                    child: CustomBUttonWidget(Utils.labels!.cod,
                        deviceHeight / 17, deviceWidth / 1.1, context)),
                Divider(
                  color: Colors.transparent,
                  height: deviceHeight / 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? nameValidate(String? text) {
    return text!.length < 3 ? Utils.labels!.name_must_be_more_than : null;
  }

  String? addressValidate(String? text) {
    return text!.length < 3 ? Utils.labels!.address_validation : null;
  }

  String? cityValidate(String? text) {
    return text!.length < 3 ? Utils.labels!.city_validation : null;
  }

  String? zipCodeValidate(String? text) {
    return text!.length < 3 ? Utils.labels!.zipCode_validation : null;
  }

  String? phoneValidate(String? text) {
    return text!.length < 4 ? Utils.labels!.phone_validation : null;
  }

  String? emailValidate(String? text) {
    return text!.isNotEmpty &&
            text.length > 0 &&
            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\-*[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(text)
        ? null
        : Utils.labels!.email_must_be_more_than;
  }

  Future<void> cODPayPressed() async {
    var billingDetails = new BillingDetails(
        _nameController.text,
        _emailController.text,
        _phoneController.text,
        _addressController.text,
        "ae",
        _cityController.text,
        _cityController.text,
        _zipCodeController.text);
    var shippingDetails = new ShippingDetails(
      _nameController.text,
      _emailController.text,
      _phoneController.text,
      _addressController.text,
      "ae",
      _cityController.text,
      _cityController.text,
      _zipCodeController.text,
    );

    if (Platform.isIOS) {
      // Set up here your custom theme
      // var theme = IOSThemeConfigurations();
      // configuration.iOSThemeConfigurations = theme;
    }
    await createOrder(shippingDetails, billingDetails, "cod", "Cash on delivery").then((v){
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content:  Text(Utils.labels!.pay_done),
          duration: const Duration(
              seconds: 3),
        ),
      );

    });
  }

  Future<void> payPressed() async {
    var billingDetails = new BillingDetails(
      _nameController.text,
      _emailController.text,
      _phoneController.text,
      _addressController.text,
      "ae",
      _cityController.text,
      _cityController.text,
      _zipCodeController.text,
    );
    var shippingDetails = new ShippingDetails(
      _nameController.text,
      _emailController.text,
      _phoneController.text,
      _addressController.text,
      "ae",
      _cityController.text,
      _cityController.text,
      _zipCodeController.text,
    );
    var configuration = PaymentSdkConfigurationDetails(
      profileId: "84543",
      serverKey: Utils.payTabsServerKey,
      clientKey: Utils.payTabsClientKey,
      cartId: "12433",
      tokeniseType: PaymentSdkTokeniseType.MERCHANT_MANDATORY,
      cartDescription: "Mother Club ",
      merchantName: "Mother Club Store",
      screentTitle: "Pay with Card",
      billingDetails: billingDetails,
      shippingDetails: shippingDetails,
      amount: widget.total + cost + taxVal,
      currencyCode: "AED",
      merchantCountryCode: "ae",
    );
    configuration.showShippingInfo = true;
    if (Platform.isIOS) {
      // Set up here your custom theme
      // var theme = IOSThemeConfigurations();
      // configuration.iOSThemeConfigurations = theme;
    }
    var res = await createOrder(shippingDetails, billingDetails, "", "");

    configuration.amount = double.parse(res);
    FlutterPaytabsBridge.startCardPayment(configuration, (event) async {
      print(event);
      if (event["status"] == "event") {
        await showDialog(
            context: context,
            builder: (c) {
              return Dialogs.warningDialog(Utils.labels!.warning,
                  Utils.labels!.error, Utils.labels!.ok, backFunction);
            });
      } else if (event["status"] == "success") {
        // createOrder(shippingDetails, billingDetails, event["data"]["paymentInfo"]["cardScheme"],event["data"]["paymentInfo"]["cardType"]);
        if (event["data"]["paymentResult"]["responseStatus"] == 'A') {
          await showDialog(
              context: context,
              builder: (c) {
                return Dialogs.warningDialog(
                    Utils.labels!.confirmed,
                    event["data"]["paymentResult"]["responseMessage"],
                    Utils.labels!.ok,
                    backFunction);
              });
        } else {
          await showDialog(
              context: context,
              builder: (c) {
                return Dialogs.warningDialog(
                    Utils.labels!.warning,
                    event["data"]["paymentResult"]["responseMessage"],
                    Utils.labels!.ok,
                    backFunction);
              });
        }
      } else if (event["status"] == "error") {
        await showDialog(
            context: context,
            builder: (c) {
              return Dialogs.warningDialog(
                  Utils.labels!.warning,
                  event["data"]["paymentResult"]["responseMessage"],
                  Utils.labels!.ok,
                  backFunction);
            });
      } else if (event["status"] == "event") {
        await showDialog(
            context: context,
            builder: (c) {
              return Dialogs.warningDialog(Utils.labels!.warning,
                  event["responseMessage"], Utils.labels!.ok, backFunction);
            });
      }
    });
  }

  Future<void> cODApplePayPressed() async {}

  Future<void> applePayPressed() async {
    var configuration = PaymentSdkConfigurationDetails(
        profileId: "*Your profile id*",
        serverKey: Utils.payTabsServerKey,
        clientKey: Utils.payTabsClientKey,
        cartId: "12433",
        cartDescription: "Mother Club",
        merchantName: "Mother club Store",
        amount: widget.total + cost + taxVal,
        currencyCode: "AED",
        merchantCountryCode: "ae",
        merchantApplePayIndentifier: "merchant.com.bunldeId",
        simplifyApplePayValidation: true);

    // var res = await createOrder(shippingDetails, billingDetails, "","");
    //
    // configuration.amount = res;
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

  backFunction() {
    Navigator.pop(context);
  }

  void submit() {
    if (validateForm()&&rxZoneName!.value != 'not selected') {
      if (Platform.isIOS) {
        applePayPressed();
      } else {
        payPressed();
      }
    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content:  Text(Utils.labels!.insert_all_data),
          duration: const Duration(
              seconds: 3),
        ),
      );
    }
  }

  void cODSubmit() {
    if (validateForm()&&rxZoneName!.value != 'not selected') {
      if (Platform.isIOS) {
        cODApplePayPressed();
      } else {
        cODPayPressed();
      }
    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content:  Text(Utils.labels!.insert_all_data),
          duration: const Duration(
              seconds: 3),
        ),
      );
    }
  }

  bool validateForm() {
    if (_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  Future createOrder(
      ShippingDetails shippingDetails,
      BillingDetails billingDetails,
      String paymentMethod,
      String cardType) async {
    var productData = getProductData();
    OrderRequestModel orderRequestModel = OrderRequestModel(paymentMethod,
        cardType, true, billingDetails, shippingDetails, productData, [
      ShippingLines(
          methodId: "asas", methodTitle: "", total: widget.total.toString()),
    ]);
    await OrderRepo.createRepo(orderRequestModel);
    return (widget.total + cost + taxVal).toString();
  }

  List<LineItems> getProductData() {
    List<LineItems> lineItems = [];
    for (var i in widget.data!) {
      lineItems.add(LineItems(i.id, i.quantity.value, variationId: i.id));
    }
    return lineItems;
  }
}
