import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/language/LangaugeBloc.dart';
import 'package:motherclub/app/language/LanguageEvent.dart';
import 'package:motherclub/app/modules/account/widgets/info_account_widget.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'dart:ui' as ui;
import 'package:motherclub/common/CustomWidget/InfoWidget.dart';
import 'package:motherclub/common/CustomWidget/appBarWidget.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountView extends StatefulWidget {

  @override
  _AccountViewState createState() => _AccountViewState();
}


class _AccountViewState extends State<AccountView> {
  LanguageBloc? _bloc;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[CustomButton_Color,
      CustomButton_Color,

      CustomButton_Second_Color],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    double deviceHeight=MediaQuery.of(context).size.height;
    double deviceWidth=MediaQuery.of(context).size.width;
    _bloc = BlocProvider.of<LanguageBloc>(context);

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
                  Text(Utils.labels!.my_account,style: GoogleFonts.roboto(
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
                      Text(Utils.labels!.your_orders,style: GoogleFonts.roboto(
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
                   child: Text(Utils.labels!.see_all,style: GoogleFonts.roboto(
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
                    Text(Utils.labels!.buy_again,style: GoogleFonts.roboto(
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
                    Text(Utils.labels!.your_wish_list,style: GoogleFonts.roboto(
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
                    Text(Utils.labels!.chat,style: GoogleFonts.roboto(
                        fontSize:17,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,

                        color:Black_textColor
                    ),),

                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (c) {
                      return Directionality(
                        textDirection: Utils.locality == Locality.english ? TextDirection.ltr : TextDirection.rtl,
                        child: AlertDialog(
                            title: Text(
                              Utils.labels!.change_language,
                            ),
                            content: Container(
                              alignment: Alignment.centerRight,
                              height: 120,
                              width: 200,
                              child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        radioButtonChanges("en");
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 6,
                                            child: Text(
                                              "English",
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Radio(
                                              value: 'en',
                                              groupValue: _radioValue,
                                              onChanged: radioButtonChanges,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        radioButtonChanges("ar");
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 6,
                                            child: Text(
                                              "اللغة العربية",
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Radio(
                                              value: 'ar',
                                              groupValue: _radioValue,
                                              onChanged: radioButtonChanges,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ), /*
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                     children: <Widget>[
                                       Expanded(
                                         flex:6,
                                         child: Text(
                                           "Spanish",
                                         ),
                                       ),
                                       Expanded(
                                         flex:1,
                                         child: Radio(
                                           value: 'es',
                                           groupValue: _radioValue,
                                           onChanged: radioButtonChanges,
                                         ),
                                       ),

                                     ],
                                   ),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                     children: <Widget>[
                                       Expanded(
                                         flex:6,
                                         child: Text(
                                           "اللغة الأردية",
                                         ),
                                       ),
                                       Expanded(
                                         flex:1,
                                         child: Radio(
                                           value: 'ur',
                                           groupValue: _radioValue,
                                           onChanged: radioButtonChanges,
                                         ),
                                       ),

                                     ],
                                   ),*/
                                  ]),
                            )),
                      );
                    });
                if (choice == "en") {
                  _bloc!.add(LanguageEvent(Locale("en", "")));
                } else if (choice == "ar") {
                  _bloc!.add(LanguageEvent( Locale("ar", "")));
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20,top: 30),
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.g_translate,size: 22),
                      SizedBox(width:15),
                      Text(Utils.labels!.select_language,style: GoogleFonts.roboto(
                          fontSize:17,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,

                          color:Black_textColor
                      ),),

                    ],
                  ),
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
                    Text(Utils.labels!.settings,style: GoogleFonts.roboto(
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
                      Text(Utils.labels!.logout,style: GoogleFonts.roboto(
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
  String _radioValue = Utils.locality == Locality.english
      ? "en"
      : Utils.locality == Locality.arabic
      ? "ar"
      : Utils.locality == Locality.spanish
      ? "es"
      : "ur"; //Initial definition of radio button value
  String? choice;

  void radioButtonChanges(String? value) {
    Navigator.pop(context);
    setState(() {
      _radioValue = value!;
      switch (value) {
        case 'en':
          choice = value;
          break;
        case 'ar':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
    //      Strings.isEnglish = value;

    if (choice == "en") {
      _bloc!.add(LanguageEvent( Locale("en", "")));
      Get.updateLocale(Locale("en", ""));
    } else if (choice == "ar") {
      _bloc!.add(LanguageEvent(  Locale("ar", "")));
      Get.updateLocale(Locale("ar", ""));
    }
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      Utils.languageSubject.sink.add(true);

    });
  }

}
