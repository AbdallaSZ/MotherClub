import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:motherclub/app/modules/auth/controllers/auth_controller.dart';
import 'package:motherclub/app/provider/AuthProvider.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/CustomWidget/CustomLogoWidget.dart';
import 'package:motherclub/common/CustomWidget/EditTextField.dart';
import 'package:motherclub/common/CustomWidget/SocialButtonWidget.dart';
import 'package:motherclub/common/CustomWidget/progressButton.dart';
import 'package:motherclub/common/CustomWidget/progressbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:provider/provider.dart';




class LoginView extends GetView<AuthController> {
  bool _checkbox = false;
  bool _progerss = false;

  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _userNameController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

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
         child: Container(
          color:   white_color,
         height: deviceHeight,
         width: deviceWidth,
         child: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               CustomLogoWidget("",deviceHeight/4,deviceWidth,context),
               Container(
                 padding: const EdgeInsets.only(left: 20,right: 20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(Utils.labels!.login_to_account,style: Theme.of(context).textTheme.headline1),
                     SizedBox(height:10),
                     Text(Utils.labels!.we_pleased,style: GoogleFonts.roboto(
                         fontSize: 13,

                         fontWeight: FontWeight.w400,
                         color: Black_textColor,
                         ),
                       ),

                     Divider(color: Colors.transparent, height: deviceHeight /25,),
                     EditTextWidget(Lable: 'Username', context: context, IconButton: Icons.person_outline, textEditingController: _userNameController),

                     Divider(
                       color: Colors.transparent,
                       height: 10,
                     ),
                     EditTextWidget(Lable: 'Password', context: context, IconButton: Icons.lock_open, textEditingController: _passwordController),
                     Align(
                       alignment: Alignment.topLeft,
                       child: Row(
                         children: [
                           Checkbox(
                             value: _checkbox,
                             onChanged: (value) {

                             },
                           ),
                           Text(
                             'Remember Me?',
                             style: Theme.of(context).textTheme.bodyText2,
                           ),
                         ],
                       ),
                     ),
                     Divider(
                       color: Colors.transparent,
                       height: deviceHeight/22,
                     ),
                     InkWell(
                         onTap: ()
                         {
                           Utils.progressBar.showLoadingIndicator('Logging', context);
                           final Future<Map<String, dynamic>> successfulMessage =
                           auth.login(_userNameController.text, _passwordController.text);
                           successfulMessage.then((value){
                             Map resp=value;
                             print('loginAuth ${value['status']}');
                             if(value['status']==true)
                             {
                               Utils.progressBar.hideOpenDialog(context);
                                Utils.getImage(int.parse(value['user'].userId));
                               Get.offAndToNamed(Routes.BOTTOM);
                             }
                             else
                             {
                               Utils.progressBar.hideOpenDialog(context);
                               CoolAlert.show(context: context,text: ' Please check your username or password ',title: 'Something went wrong', type: CoolAlertType.error);
                             }

                           });

                          // Get.offAndToNamed(Routes.BOTTOM);
                         },
                         child:CustomBUttonWidget("Login", deviceHeight/17 , deviceWidth/1.1, context)),
                     Divider(
                       color: Colors.transparent,
                       height: deviceHeight/31,
                     ),
                     Center(
                       child: Text(
                         'Forgot Password?',
                         style: GoogleFonts.roboto(
                             fontSize: 16,
                             fontWeight: FontWeight.w500,
                             color: Text_color),
                       ),
                     ),
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
                     Divider(
                       color: Colors.transparent,
                       height: deviceHeight/26,
                     ),
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
                       height: deviceHeight/30,
                     ),
                      Container(
                       alignment: Alignment.center,
                       child: GestureDetector(
                         onTap: (){
                           Get.toNamed(Routes.REGISTER);
                         },
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text(
                               'Don’t have an account?',
                               style: GoogleFonts.roboto(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w500,
                                   color: Black_textColor),
                               textAlign: TextAlign.center,
                             ),
                             SizedBox(
                               width: 1,
                             ),
                             Text('Register',
                               style: GoogleFonts.roboto(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w500,
                                   color: Text_color),
                               textAlign: TextAlign.center,),
                           ],
                         ),
                       ),
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


  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
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
      }  // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

 }
