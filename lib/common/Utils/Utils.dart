import 'package:connectivity/connectivity.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:motherclub/app/NetworkCalls/BLoC.dart';
import 'package:motherclub/app/NetworkCalls/Networkcall.dart';
import 'package:motherclub/app/provider/UserPreferences.dart';
import 'package:motherclub/common/Utils/ProgressBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rxdart/rxdart.dart';

enum Locality {
  arabic , english ,spanish ,urdu
}

class Utils
{

  static double deviceHeight=0.0;
  static double deviceWidth=0.0;
  static double horizontalMargin=0.0;
  static double verticalMargin=0.0;
  static String id ='';
  static String name ='';
  static String payTabsServerKey ='SDJNZDNMBJ-J2MW66NTLR-KBZWWBWBLM';
  static String payTabsClientKey ='C2KMHQ-2P7N6M-NVGGQ7-RG2HKN';
  static String ImageUrl ='';
  static String email ='';
  static Locality? locality ;
  BuildContext? applicationContext ;

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
}