import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/modules/account/widgets/info_account_widget.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'dart:ui' as ui;
import 'package:motherclub/common/CustomWidget/InfoWidget.dart';
import 'package:motherclub/common/CustomWidget/appBarWidget.dart';
import 'package:motherclub/common/Utils/Utils.dart';


class AccountView extends StatelessWidget {

  final Shader linearGradient = LinearGradient(
    colors: <Color>[CustomButton_Color,
      CustomButton_Color,

      CustomButton_Second_Color],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    double deviceHeight=MediaQuery.of(context).size.height;
    double deviceWidth=MediaQuery.of(context).size.width;
    return

      SafeArea(
        child: Scaffold(
          appBar:  AppBar(
            backgroundColor:Colors.white ,
            title: Container(
              child: Row(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset('assets/images/sort.png',height: 37,width:  deviceWidth/14,)),

                  Image.asset('assets/images/logo.png',width: deviceWidth/5,height: deviceHeight/8,),
                  Text('My Account',style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Black_textColor),),
                  // Image.asset('assets/images/logo.png',width: 120,height: 87,),

                ],
              ),
            ),
            actions: [
              Icon(Icons.search,color: Colors.black87,),
              SizedBox(width: 20,),
              Image.asset('assets/images/translate.png'),

            ],
          ),
        body: SingleChildScrollView(
          child: Column(
          children: [
            // AppBarWidget("My Account",deviceHeight/9.4,deviceWidth,context),
            InfoAccountWidget("${Utils.name}","Age: 29","Week","9-12",deviceHeight/11.6,deviceWidth,context),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.shopping_basket),
                      SizedBox(width:10),
                      Text("Your Orders",style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.25,
                          color: Black_textColor),),
                      SizedBox(width: 9,),
                      Container(
                        height:21,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
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
                        child: Center(
                          child: Text("10",style: GoogleFonts.roboto(
                              fontSize:13,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.25,
                              color: white_color),),
                        ),
                      )
                    ],
                  ),


                 ShaderMask(
                   blendMode: BlendMode.srcIn,
                   shaderCallback: (Rect bounds) { return ui.Gradient.linear(
                     Offset(14.0, 24.0),
                     Offset(24.0, 0.0),
                     [
                       CustomButton_Color,
                       CustomButton_Second_Color
                     ],
                   ); },
                   child: Text("See All",style: GoogleFonts.roboto(
                        fontSize:13,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.25,
                       color:Text_color
                        ),),
                 ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Container(
                // color: Colors.yellowAccent,
                height:96,
                width: deviceWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      // padding: EdgeInsets.all(2),
                      height:96,
                      width: 135,
                      // color: Colors.yellow,
                      child:
                            Image.asset('assets/images/product_image.png',height: 80.89,width: 116.25,),
                      );
                  },
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.touch_app,size: 22),
                    SizedBox(width:15),
                    Text("Buy Again",style: GoogleFonts.roboto(
                        fontSize:17,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,

                        color:Black_textColor
                    ),),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 30),
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.favorite,size: 22,),
                    SizedBox(width:15),
                    Text("Your Wish List",style: GoogleFonts.roboto(
                        fontSize:17,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,

                        color:Black_textColor
                    ),),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 30),
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.message,size: 22),
                    SizedBox(width:15),
                    Text("Chat",style: GoogleFonts.roboto(
                        fontSize:17,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,

                        color:Black_textColor
                    ),),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 30),
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.g_translate,size: 22),
                    SizedBox(width:15),
                    Text("Select Language",style: GoogleFonts.roboto(
                        fontSize:17,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,

                        color:Black_textColor
                    ),),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 30),
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.settings,),
                    SizedBox(width:15),
                    Text("Settings",style: GoogleFonts.roboto(
                        fontSize:17,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color:Black_textColor
                    ),),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 120,bottom:40),
              child: Container(
                child: InkWell(
                  onTap: (){
                    Get.offAndToNamed(Routes.LOGIN);
                    Utils.userPreferences.removeUser();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.power_settings_new,size: 22),
                      SizedBox(width:15),
                      Text("Logout",style: GoogleFonts.roboto(
                          fontSize:17,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color:Black_textColor
                      ),),

                    ],
                  ),
                ),
              ),
            )
          ],
      ),
        ),

    ));
  }
}
