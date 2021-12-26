import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Dialogs/Dialogs.dart';
import 'package:motherclub/app/modules/orders/OrderRequestModel.dart';
import 'package:motherclub/app/modules/orders/orderRepo.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/CustomWidget/EditTextWithoutIcon.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:rxdart/rxdart.dart';

class ShippingDetailsScreen extends StatefulWidget {
  List <dynamic>?data ;
  double total ;
  ShippingDetailsScreen(this.data, this.total);

  @override
  _ShippingDetailsScreenState createState() => _ShippingDetailsScreenState();
}

class _ShippingDetailsScreenState extends State<ShippingDetailsScreen> {
  TextEditingController _nameController=TextEditingController();
  TextEditingController _phoneController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _addressController=TextEditingController();
  TextEditingController _cityController=TextEditingController();
  TextEditingController _zipCodeController=TextEditingController();

  // ============ check Box Behaviour ======


  GlobalKey<ScaffoldState>_scaffoldKey = GlobalKey();
  GlobalKey<FormState>_formKey = GlobalKey();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: Utils.labels!.shipping_details,onBackButtonPressed:backFunction
      ,withBackButton: true,),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Container(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(color: Colors.transparent, height: deviceHeight /25,),
                  EditTextwidget(Utils.labels!.name,_nameController ,context,validate: nameValidate),
                  Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  EditTextNumberWidget(Utils.labels!.phone, _phoneController,context,11,validate:phoneValidate),
                 Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  EditTextwidget(Utils.labels!.email, _emailController,context,validate: emailValidate
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  EditTextwidget(Utils.labels!.address, _addressController,context,validate: addressValidate),
                  Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  EditTextwidget(Utils.labels!.city, _cityController,context,validate: cityValidate),
                  Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  EditTextNumberWidget(Utils.labels!.zipCode, _zipCodeController,context,5,validate: zipCodeValidate),
                  Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  // EditTextWidget("Your Pregnancy", context, Icons.keyboard_arrow_down_outlined),
                  Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),



                  InkWell(
                      onTap: (){
                        submit();
                        },
                      child: CustomBUttonWidget(Utils.labels!.continue_, deviceHeight/17 , deviceWidth/1.1, context)),
                  Divider(
                    color: Colors.transparent,
                    height: deviceHeight/30,
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  String? nameValidate(String? text) {
    return text!.length < 3 ?Utils.labels!.name_must_be_more_than: null;
  }
  String? addressValidate(String? text) {
    return text!.length < 3 ?Utils.labels!.address_validation: null;
  }
  String? cityValidate(String? text) {
    return text!.length < 3 ?Utils.labels!.city_validation: null;
  }
  String? zipCodeValidate(String? text) {
    return text!.length < 3 ?Utils.labels!.zipCode_validation: null;
  }

  String? phoneValidate(String? text) {
    return text!.length < 11 ?Utils.labels!.phone_validation: null;
  }
  String? emailValidate(String? text) {
    return text!.isNotEmpty &&
        text.length > 0 &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\-*[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(text)? null:  Utils.labels!.email_must_be_more_than;
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
        _zipCodeController.text);
    var shippingDetails = new ShippingDetails(
        _nameController.text,
        _emailController.text,
        _phoneController.text,
        _addressController.text,
        "ae",
        _cityController.text,
        _cityController.text,
        _zipCodeController.text);
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
      amount: widget.total,
      currencyCode: "AED",
      merchantCountryCode: "ae",
    );
    configuration.showShippingInfo = true;
    if (Platform.isIOS) {
      // Set up here your custom theme
      // var theme = IOSThemeConfigurations();
      // configuration.iOSThemeConfigurations = theme;
    }
    createOrder(shippingDetails, billingDetails, "","");


    FlutterPaytabsBridge.startCardPayment(configuration, (event)async {
        print(event);
      if(event["status"] == "event"){
        await showDialog(context: context, builder:  (c){
          return Dialogs.warningDialog(Utils.labels!.warning,Utils.labels!.error, Utils.labels!.ok, backFunction);
        });
      }
       else if (event["status"] == "success") {
       // createOrder(shippingDetails, billingDetails, event["data"]["paymentInfo"]["cardScheme"],event["data"]["paymentInfo"]["cardType"]);
         if(event["data"]["paymentResult"]["responseStatus"] == 'A') {
          await  showDialog(context: context, builder:  (c){
              return Dialogs.warningDialog(Utils.labels!.confirmed, event["data"]["paymentResult"]["responseMessage"], Utils.labels!.ok, backFunction);
            });
          }
         else {
             await showDialog(context: context, builder:  (c){
               return Dialogs.warningDialog(Utils.labels!.warning, event["data"]["paymentResult"]["responseMessage"], Utils.labels!.ok, backFunction);
             });

         }
      }
      else if (event["status"] == "error") {
      await showDialog(context: context, builder:  (c){
          return Dialogs.warningDialog(Utils.labels!.warning, event["data"]["paymentResult"]["responseMessage"], Utils.labels!.ok, backFunction);
        });
      } else if (event["status"] == "event") {
      await showDialog(context: context, builder:  (c){
          return Dialogs.warningDialog(Utils.labels!.warning, event["responseMessage"], Utils.labels!.ok, backFunction);
        });      }
    });

  }

  Future<void> applePayPressed() async {
    var configuration = PaymentSdkConfigurationDetails(
        profileId: "*Your profile id*",
        serverKey: Utils.payTabsServerKey,
        clientKey: Utils.payTabsClientKey,
        cartId: "12433",
        cartDescription: "Mother Club",
        merchantName: "Mother club Store",
        amount: widget.total,
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


  backFunction() {
    Navigator.pop(context);
  }

  void submit() {
    if(validateForm()){
      if(Platform.isIOS)
        {
          applePayPressed();
        }
      else{
        payPressed();
      }
    }
  }

  bool validateForm () {
    if(_formKey.currentState!.validate()){
      return true;
    }
    return false;
  }

  void createOrder(ShippingDetails shippingDetails , BillingDetails billingDetails, String paymentMethod , String cardType) async{
    var productData = getProductData();
    OrderRequestModel orderRequestModel = OrderRequestModel(
        paymentMethod,cardType,true,billingDetails,shippingDetails,
        productData,
        [
      ShippingLines(
        methodId: "asas",
        methodTitle: "",
        total: widget.total.toString()
      ),
    ]
    );
    OrderRepo.createRepo(orderRequestModel);
  }

  List<LineItems> getProductData() {
    List<LineItems> lineItems =[];
    for ( var i in widget.data!){
    lineItems.add(LineItems(i.id, i.quantity.value,variationId: i.id));
    }
    return lineItems;
  }
}


