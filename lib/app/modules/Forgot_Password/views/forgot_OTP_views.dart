import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/modules/Forgot_Password/controller/forgot_OTP_controller.dart';

import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/CustomWidget/CustomLogoWidget.dart';
import 'package:motherclub/common/CustomWidget/EditTextField.dart';
import 'package:motherclub/common/CustomWidget/SocialButtonWidget.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class forgot_otp_views extends GetView<Forgot_OTP_Controller> {
  bool _checkbox = false;
  bool _progerss = false;


  TextEditingController _userNameController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Background_Color,
      body: SafeArea(
          child: Container(
              color:   white_color,
              height: deviceHeight,
              width: deviceWidth,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5,right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back,size: 33,),

                          Image.asset('assets/images/translate.png')
                        ],
                      ),
                    ),
                    Container(
                      height:deviceHeight/5,
                     // width: deviceWidth/,
                      alignment: Alignment.center,

                      decoration: BoxDecoration
                        (image: DecorationImage(
                        image: AssetImage("assets/images/lockicon.png"),
                        //fit: BoxFit.fill
                      ),
                      ),
                      child: Icon(Icons.lock,color: Colors.deepOrange,size: 50,),
                    ),
                    SizedBox(height:25),
                   // CustomLogoWidget("",deviceHeight/4.3,deviceWidth,context),
                    Container(
                      padding:  EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Login your Account",style: GoogleFonts.roboto(
                        fontSize: 18,

                        fontWeight: FontWeight.bold,
                        color: Black_textColor,
                      )),
                          SizedBox(height:10),
                          Text("Your new password must be different from priviously  used Password",style: GoogleFonts.roboto(
                            fontSize: 13,

                            fontWeight: FontWeight.w400,
                            color: Black_textColor,
                          ),
                          ),

                          Divider(color: Colors.transparent, height: deviceHeight /25,),
                          EditTextWidget(Lable: 'New Password', context: context, IconButton:null, textEditingController: _userNameController),

                          Divider(
                            color: Colors.transparent,
                            height: 10,
                          ),
                          EditTextWidget(Lable: 'Confirm Password', context: context, textEditingController: _passwordController, IconButton: null),

                          Divider(
                            color: Colors.transparent,
                            height: deviceHeight/22,
                          ),
                          Center(
                            child: Text(
                              'Change Password ?',
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Text_color),
                            ),
                          ),
                          Divider(
                            color: Colors.transparent,
                            height: deviceHeight/8,
                          ),
                          InkWell(

                              child:CustomBUttonWidget("Login", deviceHeight/17 , deviceWidth/1.1, context)),
                          Divider(
                            color: Colors.transparent,
                            height: deviceHeight/31,
                          ),

                          Divider(
                            color: Colors.transparent,
                            height: deviceHeight/27,
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