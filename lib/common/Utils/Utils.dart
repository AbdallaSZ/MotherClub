import 'package:connectivity/connectivity.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:motherclub/app/NetworkCalls/BLoC.dart';
import 'package:motherclub/app/NetworkCalls/Networkcall.dart';
import 'package:motherclub/app/provider/UserPreferences.dart';
import 'package:motherclub/common/Utils/ProgressBar.dart';



class Utils
{

  static double deviceHeight=0.0;
  static double deviceWidth=0.0;
  static double horizontalMargin=0.0;
  static double verticalMargin=0.0;
  static String id ='';
  static String name ='';
  static String ImageUrl ='';
  static String email ='';

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