import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:provider/provider.dart';




class RegisterView extends GetView<AuthController> {
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
                    CustomLogoWidget("Back to Login",deviceHeight/4.3,deviceWidth,context),
                    Container(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Create a New Account",style: Theme.of(context).textTheme.headline1),
                          SizedBox(width:10),
                          Text("Create an account to see all your information and alos you will be able to share your experience with others and learn other mothers experiment’s.",
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Black_textColor),),
                          Divider(color: Colors.transparent, height: deviceHeight /25,),
                          EditTextwidget("First Name",_nameController ,context),
                          Divider(
                            color: Colors.transparent,
                            height: 10,
                          ),
                          EditTextwidget("Last Name", _lastnameController,context),
                          Divider(
                            color: Colors.transparent,
                            height: 10,
                          ),
                          EditTextwidget("Username", _usernameController,context),
                          Divider(
                            color: Colors.transparent,
                            height: 10,
                          ),
                          EditTextwidget("Email", _emailController,context),
                          Divider(
                            color: Colors.transparent,
                            height: 10,
                          ),
                          EditTextwidget("Password", _passwordController,context),
                          Divider(
                            color: Colors.transparent,
                            height: 10,
                          ),
                          EditTextWidget(Lable: 'Your Baby Age', context: context, IconButton:  Icons.keyboard_arrow_down_outlined, textEditingController: _yourbabyController),
                         // EditTextWidget("Your Baby Age", context, Icons.keyboard_arrow_down_outlined),
                          Divider(
                            color: Colors.transparent,
                            height: 10,
                          ),
                          EditTextWidget(Lable: 'Your Pragnancy Age', context: context, IconButton:  Icons.keyboard_arrow_down_outlined, textEditingController: Baby_AgeController),

                         // EditTextWidget("Your Pregnancy", context, Icons.keyboard_arrow_down_outlined),
                          Divider(
                            color: Colors.transparent,
                            height: 10,
                          ),
                          DottedContainerWidget(context,deviceHeight/8.2,deviceWidth/1.10),
                          Divider(
                            color: Colors.transparent,
                            height: deviceHeight/25,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Agree for Newsletter?',
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color: Black_textColor),

                                ),
                                // CustomToggleWidget(deviceHeight/23,deviceWidth/4,context),
                             ],
                            ),
                          ),
                          Divider(
                            color: Colors.transparent,
                            height: deviceHeight/23,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: _checkbox,
                                onChanged: (value) {

                                },
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'I agree to the ',
                                  style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: Black_textColor),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Terms and conditions', style: GoogleFonts.roboto(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Text_color),),
                                    TextSpan(text: ' and ',style:  GoogleFonts.roboto(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Black_textColor),),
                                    TextSpan(text: 'Privacy Policy', style: GoogleFonts.roboto(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Text_color),),
                                    TextSpan(text:' to\nMotherClub',style:  GoogleFonts.roboto(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Black_textColor),)
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
                          InkWell(
                              onTap: (){

                                Future<Map<String, dynamic>> successfulMessage =  auth.register(_usernameController.text, _emailController.text, _passwordController.text, _nameController.text, _yourbabyController.text, _lastnameController.text, Baby_AgeController.text);
                                successfulMessage.then((value){
                                  print('registration ${value}');
                                });
                                // Get.to(Routes.)
                              },
                              child: CustomBUttonWidget("Register", deviceHeight/17 , deviceWidth/1.1, context)),
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
