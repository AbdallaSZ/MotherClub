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
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:provider/provider.dart';




class Add_Address_view extends GetView<AuthController> {
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
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         // Text("Create a New Account",style: Theme.of(context).textTheme.headline1),
                          //SizedBox(width:10),
                        /*  Text("Create an account to see all your information and alos you will be able to share your experience with others and learn other mothers experiment’s.", style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Black_textColor),),*/

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Contact Details",style:GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: Black_textColor)),
                          ),

                          Divider(color: Colors.transparent, height: deviceHeight /55,),
                          Card(
                            
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(children: [
                                EditTextwidget("Name",_nameController ,context),
                                Divider(
                                  color: Colors.transparent,
                                  height: 10,
                                ),
                                EditTextwidget("Mobile No*", _lastnameController,context),
                                Divider(
                                  color: Colors.transparent,
                                  height: 10,
                                ),
                              ],),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Address",style:GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: Black_textColor)),
                          ),
                          Card(
                            
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(children: [
                                EditTextwidget("Address (House No, Building, Street, Area)*", _usernameController,context),
                                Divider(
                                  color: Colors.transparent,
                                  height: 10,
                                ),
                                EditTextwidget("Locality / Town*", _emailController,context),
                                Divider(
                                  color: Colors.transparent,
                                  height: 10,
                                ),
                                EditTextwidget("Pin Code*", _passwordController,context),
                                Divider(
                                  color: Colors.transparent,
                                  height: 10,
                                ),
                                Row(children: [
                                  Expanded(
                                      flex: 2,
                                      child: EditTextwidget("Pin Code*", _passwordController,context)),
                                  SizedBox(width: 10,),
                                  Expanded(
                                      flex: 2,
                                      child: EditTextwidget("Pin Code*", _passwordController,context)),
                                ],),
                              ],),
                            ),
                          ),
                         
                                                 // EditTextWidget("Your Baby Age", context, Icons.keyboard_arrow_down_outlined),

                         // EditTextWidget("Your Pregnancy", context, Icons.keyboard_arrow_down_outlined),
                          Divider(
                            color: Colors.transparent,
                            height: 10,
                          ),
                        //  DottedContainerWidget(context,deviceHeight/8.2,deviceWidth/1.10),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("SAVE ADDRESS AS",style:GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: Black_textColor)),
                          ),
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
                                child: Text("Home",style:GoogleFonts.roboto(
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
                                child: Text("Work",style:GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.grey)),
                              )
                            ],),
                          ),),

                          Divider(
                            color: Colors.transparent,
                            height: deviceHeight/23,
                          ),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Row(
                                
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
                            ),
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
                              child: CustomBUttonWidget("ADD ADDRESS", deviceHeight/17 , deviceWidth/1.1, context)),
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
