import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Shimmers/Product_Shimmer.dart';
import 'package:motherclub/app/modules/auth/controllers/auth_controller.dart';
import 'package:motherclub/app/provider/AuthProvider.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/CustomWidget/CustomLogoWidget.dart';
import 'package:motherclub/common/CustomWidget/CustomeToggleWidget.dart';
import 'package:motherclub/common/CustomWidget/DottedContainerWidget.dart';
import 'package:motherclub/common/CustomWidget/EditTextField.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:motherclub/common/CustomWidget/EditTextWithoutIcon.dart';
import 'package:motherclub/common/CustomWidget/SocialButtonWidget.dart';
import 'package:motherclub/common/Utils/RandomColorModel.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:provider/provider.dart';




class Select_Address_view extends GetView<AuthController> {
  bool _checkbox = false;
  TextEditingController _yourbabyController=TextEditingController();
  TextEditingController Baby_AgeController=TextEditingController();
  TextEditingController _nameController=TextEditingController();
  TextEditingController _lastnameController=TextEditingController();
  TextEditingController _usernameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;


    AuthProvider auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
              color: white_color,
              height: deviceHeight,
              width: deviceWidth,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //   CustomLogoWidget("Back to Login",deviceHeight/4.3,deviceWidth,context),
                    Container(
                      // padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("PAYMENT OPTION",style:GoogleFonts.roboto(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                                color: Colors.black)),
                          ),
                          /* Divider(
                            color: Colors.transparent,
                            height: deviceHeight/23,
                          ),
*/
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(


                                child: FutureBuilder<List<ProductModel>>(
                                    future: Utils.bLoC.Product_list(context),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<ProductModel>? data = snapshot.data;
                                        print(data);
                                        return ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: 2,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Container(

                                                padding: EdgeInsets.all( 10),
                                                margin: EdgeInsets.only( bottom: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  color: RandomColorModel().getColor().withOpacity(0.1),
                                                ),
                                                 height:60,
                                                width:180,
                                                child:Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:[
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                        Text("COD",style: GoogleFonts.roboto(
                                                          fontSize: 14,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.normal,
                                                          color: Colors.black,

                                                        )
                                                        ),
                                                        Icon(Icons.check_circle_outline,color: Colors.green,)
                                                      ],)



                                                    ]
                                                )
                                            );
                                          },
                                        );}
                                      else{
                                        return ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 10,
                                          itemBuilder: (context, index) {
                                            return snapshot.hasData? ProductShimer(Utils.deviceHeight, Utils.deviceWidth, context):Card(
                                              // padding: EdgeInsets.all(2),
                                              // color: Colors.yellow,
                                              child: ProductShimer(Utils.deviceHeight, Utils.deviceWidth, context),
                                            );
                                          },
                                        );
                                      }
                                    }),
                              ),
                            ),
                          ),SizedBox(height: Utils.deviceHeight/10,),

                               Card(
                                 child: Container(

                                   padding: EdgeInsets.all(10),
                                   
                                   width: Utils.deviceWidth,
                                   height: 40,
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Row(
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                         Icon(Icons.card_giftcard),
                                       SizedBox(width: 10,),
                                       Text("Have a promo code",style: GoogleFonts.roboto(
                                       fontSize: 14,
                                       fontStyle: FontStyle.normal,
                                       fontWeight: FontWeight.normal,
                                       color: Colors.black,

                                 ))
                                       ],),
                                       Text("Apply",style: GoogleFonts.roboto(
                                         fontSize: 14,
                                         fontStyle: FontStyle.normal,
                                         fontWeight: FontWeight.bold,
                                         color: Colors.red,

                                       ))
                                     ],
                                   ),
                                 ),
                               ) ,



                          Divider(
                            color: Colors.transparent,
                            height: deviceHeight/21,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: Utils.deviceWidth,
                            child: InkWell(
                                onTap: (){

                                  Future<Map<String, dynamic>> successfulMessage =  auth.register(_usernameController.text, _emailController.text, _passwordController.text, _nameController.text, _yourbabyController.text, _lastnameController.text, Baby_AgeController.text);
                                  successfulMessage.then((value){
                                    print('Place order ${value}');
                                  });
                                  // Get.to(Routes.)
                                },
                                child: CustomBUttonWidget("Place order", deviceHeight/17 , deviceWidth/1.1, context)),
                          ),
                          Divider(
                            color: Colors.transparent,
                            height: deviceHeight/30,
                          ),



                        ],
                      ),
                    ),

                  ],
                ),
              ))

      ),
    );
  }
}
