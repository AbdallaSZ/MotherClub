import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:motherclub/app/language/LangaugeBloc.dart';
import 'package:motherclub/app/language/LanguageEvent.dart';
import 'package:motherclub/app/modules/auth/controllers/auth_controller.dart';
import 'package:motherclub/app/provider/AuthProvider.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/CustomWidget/CustomLogoWidget.dart';
import 'package:motherclub/common/CustomWidget/EditTextField.dart';

import 'package:motherclub/common/Utils/Utils.dart';
import 'package:provider/provider.dart';
import 'package:size_helper/size_helper.dart';

class LoginView extends GetView<AuthController> {
  bool _checkbox = false;
  bool _progerss = false;

  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // final Shader _linearGradient = LinearGradient(
  //   colors: [CustomButton_Color, CustomButton_Second_Color],
  //   begin: Alignment.centerLeft,
  //   end: Alignment.bottomRight,
  // ).createShader(Rect.fromLTWH(0.0, 0.0, 320.0, 80.0));

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    AuthProvider auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      // backgroundColor: Background_Color,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLogoWidget("", deviceHeight / 4, deviceWidth, context, false),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Utils.labels!.login_to_account,
                    style: TextStyle(
                      fontSize:SizeHelper.of(context).help(
                        mobileSmall: 8,
                        mobileNormal: 9,
                        mobileLarge: 10,
                        mobileExtraLarge: 12,
                        tabletSmall: 14,
                        tabletNormal: 16,
                        tabletLarge: 22,
                        tabletExtraLarge: 24,
                        desktopLarge: 25,
                      ),
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    Utils.labels!.we_pleased,
                    style: GoogleFonts.roboto(
                      fontSize:SizeHelper.of(context).help(
                        mobileSmall: 6,
                        mobileNormal: 7,
                        mobileLarge: 8,
                        mobileExtraLarge: 10,
                        tabletSmall: 12,
                        tabletNormal: 14,
                        tabletLarge: 20,
                        tabletExtraLarge: 21,
                        desktopLarge: 22,
                      ),
                      fontWeight: FontWeight.w400,
                      color: Black_textColor,
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: deviceHeight / 25,
                  ),
                  EditTextWidget(
                      Lable: Utils.labels!.username,
                      context: context,
                      IconButton: Icons.person_outline,
                      textEditingController: _userNameController),
                  Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  EditTextWidget(
                      Lable: Utils.labels!.password,
                      context: context,
                      IconButton: Icons.lock_open,
                      textEditingController: _passwordController),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Checkbox(
                          value: _checkbox,
                          onChanged: (value) {},
                        ),
                        Text(
                          Utils.labels!.remember_me,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: deviceHeight / 22,
                  ),
                  InkWell(
                      onTap: () {
                        Utils.progressBar
                            .showLoadingIndicator('Logging', context);
                        final Future<Map<String, dynamic>> successfulMessage =
                            auth.login(_userNameController.text,
                                _passwordController.text);
                        successfulMessage.then((value) {
                          Map resp = value;
                          print('loginAuth ${value['status']}');
                          if (value['status'] == true) {
                            Utils.progressBar.hideOpenDialog(context);
                            Utils.getImage(int.parse(value['user'].userId));
                            Get.offAndToNamed(Routes.BOTTOM);
                          } else {
                            Utils.progressBar.hideOpenDialog(context);
                            CoolAlert.show(
                                context: context,
                                text: Utils
                                    .labels!.please_check_username_password,
                                title: Utils.labels!.something_went_wrong,
                                type: CoolAlertType.error);
                          }
                        });

                        // Get.offAndToNamed(Routes.BOTTOM);
                      },
                      child: CustomBUttonWidget(Utils.labels!.login,
                          deviceHeight / 17, deviceWidth / 1.1, context)),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                          onPressed: () {
                            Get.offAndToNamed(Routes.BOTTOM);
                          },
                          child: Text(
                            Utils.labels!.proceed_as_guest,
                            style: TextStyle(
                                color: CustomButton_Color, fontSize:SizeHelper.of(context).help(
                              mobileSmall: 6,
                              mobileNormal: 7,
                              mobileLarge: 8,
                              mobileExtraLarge: 10,
                              tabletSmall: 12,
                              tabletNormal: 14,
                              tabletLarge: 20,
                              tabletExtraLarge: 21,
                              desktopLarge: 22,
                            ),),
                          ))
                    ],
                  ),
                  /*Divider(
                       color: Colors.transparent,
                       height: deviceHeight/75,
                     ),*/
                  /*Center(
                       child: Text(
                         Utils.labels!.forget_password,
                         style: GoogleFonts.roboto(
                             fontSize: 16,
                             fontWeight: FontWeight.w500,
                             color: Text_color),
                       ),
                     ),*/
                  /* Divider(
                       color: Colors.transparent,
                       height: deviceHeight/27,
                     ),*/
                  /*  Row(
                         children: <Widget>[
                           Expanded(
                               child: Divider(color:Black_textColor ,)
                           ),
                           SizedBox(width:15),

                           Text(Utils.labels!.or_login_with,style: GoogleFonts.roboto(
                               fontSize: 18,
                               fontWeight: FontWeight.w500,
                               color: Black_textColor),
                             textAlign: TextAlign.center,),
                           SizedBox(width:15),
                           Expanded(
                               child: Divider(color:Black_textColor ,)
                           ),
                         ]
                     ),*/
                  /*Divider(
                       color: Colors.transparent,
                       height: deviceHeight/26,
                     ),*/
                  /*  Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         InkWell(
                           onTap: (){
                              signup(context);
                                    }
                           ,
                             child: SocialButtonWidget('assets/images/Google.png',context,deviceHeight/17,deviceWidth/2.37)),
                         SocialButtonWidget('assets/images/facebook.png',context,deviceHeight/17,deviceWidth/2.37)
                       ],
                     ),*/
                  Divider(
                    color: Colors.transparent,
                    height: deviceHeight / 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Utils.labels!.dont_have_an_account,
                            style: GoogleFonts.roboto(
                                fontSize: SizeHelper.of(context).help(
                                  mobileSmall: 6,
                                  mobileNormal: 7,
                                  mobileLarge: 8,
                                  mobileExtraLarge: 10,
                                  tabletSmall: 12,
                                  tabletNormal: 14,
                                  tabletLarge: 20,
                                  tabletExtraLarge: 21,
                                  desktopLarge: 22,
                                ),
                                fontWeight: FontWeight.w500,
                                color: Black_textColor),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Text(
                            Utils.labels!.register,
                            style: GoogleFonts.roboto(
                                fontSize:SizeHelper.of(context).help(
                                  mobileSmall: 6,
                                  mobileNormal: 7,
                                  mobileLarge: 8,
                                  mobileExtraLarge: 10,
                                  tabletSmall: 12,
                                  tabletNormal: 14,
                                  tabletLarge: 20,
                                  tabletExtraLarge: 21,
                                  desktopLarge: 22,
                                ),
                                fontWeight: FontWeight.w500,
                                color: Text_color),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      print(user!.displayName);
      if (result != null) {
        Get.toNamed(Routes.BOTTOM);
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  String _radioValue = Utils.locality == Locality.english
      ? "en"
      : Utils.locality == Locality.arabic
          ? "ar"
          : Utils.locality == Locality.spanish
              ? "es"
              : "ur"; //Initial definition of radio button value
  String? choice;
  LanguageBloc? _bloc;

  void radioButtonChanges(String? value) {
    Get.back();
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

    //      Strings.isEnglish = value;

    if (choice == "en") {
      _bloc!.add(LanguageEvent(Locale("en", "")));
      Get.updateLocale(Locale("en", ""));
    } else if (choice == "ar") {
      _bloc!.add(LanguageEvent(Locale("ar", "")));
      Get.updateLocale(Locale("ar", ""));
    }
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      Utils.languageSubject.sink.add(true);
    });
  }
}
