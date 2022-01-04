import 'package:connectivity/connectivity.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:motherclub/app/NetworkCalls/Api.dart';
import 'package:motherclub/app/NetworkCalls/BLoC.dart';
import 'package:motherclub/app/NetworkCalls/Networkcall.dart';
import 'package:motherclub/app/provider/UserPreferences.dart';
import 'package:motherclub/common/Utils/ProgressBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Locality {
  arabic , english ,spanish ,urdu
}
enum SignInMethod {
google , facebook , regular
}
class Utils
{

  static double deviceHeight=0.0;
  static double deviceWidth=0.0;
  static double horizontalMargin=0.0;
  static double verticalMargin=0.0;
  static String id ='';
  static String name ='';
  static String pass ='';
  static String cookie ='';
  static var fb ;
  static SignInMethod method = SignInMethod.regular;
  static final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static String userName ='';
  static String payTabsServerKey ='SDJNZDNMBJ-J2MW66NTLR-KBZWWBWBLM';
  static String payTabsClientKey ='C2KMHQ-2P7N6M-NVGGQ7-RG2HKN';
  static String ImageUrl ='';
  static String email ='';
  static Locality? locality ;
  BuildContext? applicationContext ;
  static  double? width , height ;
  static AppLocalizations? labels;

  static initializeLocality (context){
    Utils.labels = AppLocalizations.of(context);
    setLocality();
  }
  static BehaviorSubject<bool> languageSubject  = BehaviorSubject();

  static initializeMyLocality (BuildContext context){
    switch (AppLocalizations.of(context)!.localeName){
      case 'en':
        locality = Locality.english;
        print("english");
        break;
      case 'ar':
        locality = Locality.arabic;
        print("arabic");
        break;

    }
  }
  static  setLocality (){
    print("set locality called");
    switch (userPreferences.getLanguage()){
      case 'en':
        locality = Locality.english;
        break;
      case 'ar':
        locality = Locality.arabic;
        break;
      case 'es':
        locality = Locality.spanish;
        break;
      case 'ur':
        locality = Locality.urdu;
        break;
    }
  }
  static Networkcall networkcall =Networkcall();
  static UserPreferences userPreferences=UserPreferences();
  static ProgressBar progressBar=ProgressBar();
  static BLoC bLoC=BLoC();

  static  Future<bool> check(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    else{
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,

        text: "Network Connection Not connected ",
      );
      return false;
    }
    // return false;
  }


  static  Future<bool> checkapp() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    else{

      return false;
    }
    // return false;
  }
static   SharedPreferences? prefs ;
  static initializePref ()async{
    prefs =await SharedPreferences.getInstance();
  }

  static ImageProvider myImage = NetworkImage("url");
  static getImage(int id)async {
    var myData = await NetworkService.getMyData("api/user/get_avatar/?user_id=$id&type=full");

    try{
      String url = myData["avatar"];
      if(url.contains("empty"))
        prefs!.setString("imageUrl", "https://c0.klipartz.com/pngpicture/434/847/gratis-png-usuario-de-iconos-de-computadora-empresario-ejecutivo-de-negocios-s.png");
      else
    prefs!.setString("imageUrl", myData['avatar']);
  }catch (e){
      prefs!.setString("imageUrl", "https://c0.klipartz.com/pngpicture/434/847/gratis-png-usuario-de-iconos-de-computadora-empresario-ejecutivo-de-negocios-s.png");
    }
  }

  static void deleteUserData() {
    id= "";
    name="";
    pass ='';
    cookie ='';
    userName ='';

  }
}