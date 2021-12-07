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




class Choose_Payment_view extends GetView<AuthController> {
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
                          Card(
                            
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                width: Utils.deviceWidth,
                                height: Utils.deviceHeight/16,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.black),
                                  borderRadius: BorderRadius.all(Radius.circular(7)),


                                ),
                                child: Text(Utils.labels!.work,style:GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black)),
                              ),
                            ),
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
                                    future: Utils.bLoC.productList(context),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<ProductModel>? data = snapshot.data;
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
                                               // height:100,
                                                width:180,
                                                child:Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:[
                                                      SizedBox(height:23),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [

                                                        Row(
                                                          children: [
                                                            Icon(Icons.home,color: Colors.red,),
                                                            SizedBox(width: 5,),
                                                            Text(Utils.labels!.home,style: GoogleFonts.roboto(
                                                              fontSize: 18,
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.normal,
                                                              color: Black_textColor,

                                                            )
                                                            ),
                                                          ],
                                                        ),
                                                        Icon(Icons.check_circle_outline,color: Colors.red,),
                                                      ],),

                                                      SizedBox(height:10),
                                                      Text("Amara",style: GoogleFonts.roboto(
                                                        fontSize: 14,
                                                        fontStyle: FontStyle.normal,
                                                        fontWeight: FontWeight.normal,
                                                        color: Colors.black,

                                                      )
                                                      ),
                                                      SizedBox(height:3),
                                                      Text("+2156875426",style: GoogleFonts.roboto(
                                                        fontSize: 14,
                                                        fontStyle: FontStyle.normal,
                                                        fontWeight: FontWeight.normal,
                                                        color: Colors.grey,

                                                      )
                                                      ),
                                                      SizedBox(height:3),
                                                      Text("House 541, Gulf CIty Saudi Arabia",style: GoogleFonts.roboto(
                                                        fontSize: 14,
                                                        fontStyle: FontStyle.normal,
                                                        fontWeight: FontWeight.normal,
                                                        color: Colors.grey,

                                                      )
                                                      ),

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
                          ),SizedBox(height: 10,),

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(Utils.labels!.save_address_as,style:GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: Black_textColor)),
                          ),
                          SizedBox(height: 10,),
                          Card(child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(children: [
                              Container(
                                width: Utils.deviceWidth/4,
                                height: Utils.deviceHeight/20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.red),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),


                                ),
                                child: Text(Utils.labels!.home,style:GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.red)),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                width: Utils.deviceWidth/4,
                                height: Utils.deviceHeight/20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.grey),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),


                                ),
                                child: Text(Utils.labels!.work,style:GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.grey)),
                              )
                            ],),
                          ),),

                          Row(
                            children: [
                              Checkbox(
                                value: _checkbox,
                                onChanged: (value) {

                                },
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Make this my default address',
                                  style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: Black_textColor),
                                  children: <TextSpan>[
                                                                      ],
                                ),
                              ),
                          //     Text(
                          //       'to\n MotherClub',
                          //       style:  GoogleFonts.roboto(
                          //         fontSize: 13,
                          //         fontWeight: FontWeight.w500,
                          //         fontStyle: FontStyle.normal,
                          //         color: Black_textColor),
                          //
                          // ),
                            ],
                          ),
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
                                    print('registration ${value}');
                                  });
                                  // Get.to(Routes.)
                                },
                                child: CustomBUttonWidget("SELECT ADDRESS", deviceHeight/17 , deviceWidth/1.1, context)),
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
